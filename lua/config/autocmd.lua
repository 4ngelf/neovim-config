--[[
  File: config/autocmd.lua
  Description: Defined autocommands
]]

local function augroup(group_name)
  return vim.api.nvim_create_augroup("userconfig_" .. group_name, { clear = true })
end

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "resize splits if window got resized",
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({
      higroup = "@text.todo",
      timeout = 600,
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "close some filetypes with <q>",
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "Trouble",
    "checkhealth",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "wrap words in certain filetypes",
  group = augroup("selective_wrap"),
  pattern = {
    "markdown",
    "gitcommit",
  },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "help window is initially resized",
  group = augroup("help_win_resized"),
  pattern = {
    "help",
  },
  callback = function()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(win, 10)
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "Ensure configured foldmethod is used",
  group = augroup("ensure_foldmethod"),
  callback = function()
    vim.wo.foldmethod = vim.wo.foldmethod
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "Auto create dir when saving a file, in case some intermediate directory does not exist",
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
