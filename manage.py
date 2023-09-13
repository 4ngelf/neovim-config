#!/bin/env python3
from argparse import ArgumentParser
from pathlib import Path
from subprocess import run

BASE_DIR = Path(__file__).parent
TEMPLATE_DIR = BASE_DIR / "templates"
PLUGIN_DIR = BASE_DIR / "lua/plugins/extensions"

TEMPLATES = {"extension": "lazy_plugin.lua"}


# Tasker class {{{


class Tasker:
    def __init__(self):
        self._tasks = []

    @staticmethod
    def register(docs={}):
        def decorator(func):
            code = func.__code__
            for key in docs.keys():
                if key not in code.co_varnames:
                    raise Exception(f"{key} not in {func.__name__} function")
            if not docs:
                func_arguments = code.co_varnames[: code.co_argcount]
                for arg in func_arguments:
                    arg = arg.replace("_", "-")
                    docs[arg] = ""

            meta = {
                "func": func,
                "name": func.__name__.replace("_", "-"),
                "help": func.__doc__,
                "args": docs,
            }
            _tasker._tasks.append(meta)
            return func

        return decorator

    @property
    def tasks_names(self):
        for task in self._tasks:
            yield task["name"]

    @property
    def tasks(self):
        for task in self._tasks:
            yield task

    @property
    def argparser(self) -> ArgumentParser:
        parser = ArgumentParser(
            description="Manage tasks for neovim configuration."
        )
        subparsers = parser.add_subparsers(
            title="commands", description="Available commands"
        )
        for task in self.tasks:
            task_parser = subparsers.add_parser(
                task["name"], description=task["help"]
            )
            task_parser.set_defaults(func=task["func"])
            for arg, help in task["args"].items():
                task_parser.add_argument(arg, help=help)

        return parser


_tasker: Tasker = Tasker()


# }}}


# Utils {{{


def template(template: str, context: dict, /) -> str:
    """Parse templates using the given context"""

    contents = ""
    with open(TEMPLATE_DIR / template, "r") as f:
        contents = f.read()

    return contents.format(**context)


# }}}


# Tasks {{{


@Tasker.register()
def create_venv():
    """Create venv for nvim"""
    PYTHON_VENV = BASE_DIR / "py3nvim"
    PYTHON_BIN = PYTHON_VENV / "bin"
    if PYTHON_VENV.exists():
        print("Python for nvim already created!")
        return

    run(["python3", "-m", "venv", PYTHON_VENV], check=True)
    run([PYTHON_BIN / "pip", "install", "--upgrade", "pip"], check=True)
    run([PYTHON_BIN / "pip", "install", "pynvim"], check=True)

    version = run(
        [PYTHON_BIN / "python3", "-V"], capture_output=True, check=True
    ).stdout.decode(encoding="utf-8").replace("\n", "")

    print(f"{version} venv created for nvim!")


@Tasker.register(docs={"short_url": "Short url for the repository"})
def add_plugin(short_url: str):
    """Add plugin from template using
    short repository url as context"""
    name = short_url.split("/")[1]
    filename = name.replace("-", "_").split(".")[0] + ".lua"
    context = {"short_url": short_url, "name": name, "filename": filename}
    contents = template(TEMPLATES["extension"], context)

    with open(PLUGIN_DIR / filename, "wt") as f:
        f.write(contents)

    print(f"Plugin {short_url} added!\nLocation: {PLUGIN_DIR/filename}")


# }}}


def main():
    parser = _tasker.argparser
    kwargs = vars(parser.parse_args())
    if not kwargs:
        parser.print_usage()
        return

    func = kwargs.pop("func")
    func(**kwargs)


if __name__ == "__main__":
    main()

# vim: tabstop=4 shiftwidth=4 expandtab syntax=python foldmethod=marker foldlevelstart=0 foldlevel=0 # noqa
