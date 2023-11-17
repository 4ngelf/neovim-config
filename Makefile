# Neovim configuration makefile
ROOT_DIR:=$(realpath .)
NVIM_EXEC:=$(shell command -v nvim 2>/dev/null)

PYTHON_EXEC:=$(shell command -v python3 2>/dev/null)
PYTHON_VENV:=${ROOT_DIR}/provider/python
PYTHON_VENV_EXEC:=${PYTHON_VENV}/bin/python3
PYTHON_VENV_PIP:=${PYTHON_VENV}/bin/pip

NODE_EXEC:=$(shell command -v node 2>/dev/null)
NPM_EXEC:=$(shell command -v npm 2>/dev/null)
NODE_PACKAGE:=${ROOT_DIR}/provider/node

entry:
	@echo "Neovim configuration"
	@echo "dir: ${ROOT_DIR}"

provider: python-provider node-provider

python-provider:
ifndef PYTHON_EXEC
	$(error "Python not installed or not found on PATH")
endif

	@rm -rf ${PYTHON_VENV} && mkdir -p ${PYTHON_VENV}

	@${PYTHON_EXEC} -m venv ${PYTHON_VENV} \
		&& ${PYTHON_VENV_PIP} install -q --upgrade pip \
		&& ${PYTHON_VENV_PIP} install -q pynvim

	@echo "Python provider made for neovim!"
	@echo "  $$(${PYTHON_VENV_EXEC} -V)"
	@echo "  pynvim $$(${PYTHON_VENV_EXEC} -c "import pynvim; print('{major}.{minor}.{patch}'.format(**vars(pynvim.VERSION)))")"
	
node-provider:
ifndef NPM_EXEC
	$(error "NPM not installed or not found on PATH")
endif
	
	@rm -rf ${NODE_PACKAGE} && mkdir -p ${NODE_PACKAGE}

	@cd ${NODE_PACKAGE} \
		&& ${NPM_EXEC} install --no-package-lock neovim >/dev/null

	@echo "Node provider made for neovim!"
	@echo "  node.js $$(${NODE_EXEC} --version)"
	@echo "  neovim (npm) $$(${NODE_EXEC} ${NODE_PACKAGE}/node_modules/neovim/bin/cli.js --version)"

plugins-list:
	@${NVIM_EXEC} ${ROOT_DIR}/README.md --headless \
		-c "lua plugins={}" \
		-c "lua for p in require('lazy').plugins() do plugins[#plugins]='['..p.name..']('..url=string.sub(p.url, 1, -5)}..')' end" \
		-c "lua plugins=vim.fn.sort(plugins) end)" \
		-c "lua start=vim.fn.search('<!-- plugins -->', 'cwn')" \
		-c "lua end=vim.fn.search('<!-- plugins-end -->', 'cwn')" \
		-c "lua vim.api.nvim_buf_set_lines(0, start + 1, end - 1,, plugins)" \
		-c wq
		
	@echo "Plugin list updated!"
