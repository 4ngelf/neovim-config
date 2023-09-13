--[[
  File: plugins/init.lua
  Description: Lazy loaded plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

function req(extension)
  return require("plugins.extensions"..extension)
end

return {
  req("cmp_nvim_lsp"),
  req("lspkind_nvim"),
  req("lsp_zero"),
  req("LuaSnip"),
  req("mason_lspconfig"),
  req("mason"),
  req("mason_null_ls"),
  req("null_ls"),
  req("nvim_cmp"),
  req("nvim_lspconfig"),
  req("nvim_treesitter"),
  req("plenary"),
  req("project"),
  req("telescope"),
}
