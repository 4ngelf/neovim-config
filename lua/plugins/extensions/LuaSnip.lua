--[[
  File: plugins/extensions/LuaSnip.lua
  Description: Lazy configuration for LuaSnip
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/L3MON4D3/LuaSnip
]]

local M = {}

M[1] = "L3MON4D3/LuaSnip" --  string?
M.name = "LuaSnip" --  string?
M.tag = "" --  string?
M.lazy = true --  boolean?
M.event = { } --  string? or string[] or fun(self:LazyPlugin, event:string[]):string[]
M.config = function() --  fun(LazyPlugin, opts:table) or true

end
M.dependencies = { --  LazySpec[]

}

return M

--[[
Options Available:
M[1] = "L3MON4D3/LuaSnip"    --  string?
                            Short plugin url. Will be expanded using config.git.url_format
M.dir = nil             --  string?
                            A directory pointing to a local plugin
M.url = nil             --  string?
                            A custom git url where the plugin is hosted
M.name = LuaSnip         --  string?
                            A custom name for the plugin used for the local plugin directory and as the display name
M.dev = nil             --  boolean?
                            When true, a local plugin directory will be used instead. See config.dev
M.lazy = true           --  boolean?
                            When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are required, or when one of the lazy-loading handlers triggers
M.enabled = nil         --  boolean? or fun():boolean
                            When false, or if the function returns false, then this plugin will not be included in the spec
M.cond = nil            --  boolean? or fun(LazyPlugin):boolean
                            When false, or if the function returns false, then this plugin will not be loaded. Useful to disable some plugins in vscode, or firenvim for example.
M.dependencies = {}   --  LazySpec[]
                            A list of plugin names or plugin specs that should be loaded when the plugin loads. Dependencies are always lazy-loaded unless specified otherwise. When specifying a name, make sure the plugin spec has been defined somewhere else.
M.init = nil            --  fun(LazyPlugin)
                            init functions are always executed during startup
M.opts = {}           --  table or fun(LazyPlugin, opts:table) opts should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table.
                            The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()
M.config = true         --  fun(LazyPlugin, opts:table) or true config is executed when the plugin loads.
                            The default implementation will automatically run require(MAIN).setup(opts). Lazy uses several heuristics to determine the plugin's MAIN module automatically based on the plugin's name. See also opts. To use the default implementation without opts set config to true.
M.main = nil            --  string?
                            You can specify the main module to use for config() and opts(), in case it can not be determined automatically. See config()
M.build = nil           --  fun(LazyPlugin) or string or a list of build commands
                            Build is executed when a plugin is installed or updated. Before running build, a plugin is first loaded. If it's a string it will be ran as a shell command. When prefixed with : it is a Neovim command. You can also specify a list to executed multiple build commands. Some plugins provide their own build.lua which is automatically used by lazy. So no need to specify a build step for those plugins.
M.branch = nil          --  string?
                            Branch of the repository
M.tag = nil             --  string?
                            Tag of the repository
M.commit = nil          --  string?
                            Commit of the repository
M.version = nil         --  string? or false to override the default
                            Version to use from the repository. Full Semver ranges are supported
M.pin = nil             --  boolean?
                            When true, this plugin will not be included in updates
M.submodules = nil      --  boolean?
                            When false, git submodules will not be fetched. Defaults to true
M.event = nil           --  string? or string[] or fun(self:LazyPlugin, event:string[]):string[]
                            Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
M.cmd = nil             --  string? or string[] or fun(self:LazyPlugin, cmd:string[]):string[]
                            Lazy-load on command
M.ft = nil              --  string? or string[] or fun(self:LazyPlugin, ft:string[]):string[]
                            Lazy-load on filetype
M.keys = nil            --  string? or string[] or LazyKeys[] or fun(self:LazyPlugin, keys:string[]):(string | LazyKeys)[]
                            Lazy-load on key mapping
M.module = nil          --  false?
                            Do not automatically load this Lua module when it's required somewhere
M.priority = nil        --  number?
                            Only useful for start plugins (lazy=false) to force loading certain plugins first. Default priority is 50. It's recommended to set this to a high number for colorschemes.
M.optional = nil        --  boolean?
                            When a spec is tagged optional, it will only be included in the final spec, when the same plugin has been specified at least once somewhere else without optional. This is mainly useful for Neovim distros, to allow setting options on plugins that may/may not be part of the user's plugins
]]
