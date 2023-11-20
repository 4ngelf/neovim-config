M = {}

M.find_command = { "rg", "--hidden", "--files", "--iglob", "!.git" }
M.find_all_command = { "rg", "--hidden", "--files", "--no-ignore" }

---Fuzzy Finder (with .gitignore)
---@param path string
function M.fd(path)
  require("telescope.builtin").fd({
    cwd = path or vim.cmd.pwd(),
    find_command = M.find_command,
  })
end

---Fuzzy Finder (without .gitignore)
---@param path string
function M.fd_all(path)
  require("telescope.builtin").fd({
    cwd = path or vim.cmd.pwd(),
    find_command = M.find_all_command,
  })
end

---Image previewer for image/* mimetypes powered with chafa
function M.image_previewer(filepath, bufnr, opts)
  if not vim.fn.executable("chafa") then
    require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "chafa executable not found.")
    return
  end

  local term = vim.api.nvim_open_term(bufnr, {})
  local function send_output(_, data, _)
    for _, d in ipairs(data) do
      vim.api.nvim_chan_send(term, d .. "\r\n")
    end
  end
  local h = vim.api.nvim_win_get_height(opts.winid)
  local w = vim.api.nvim_win_get_width(opts.winid)
  vim.fn.jobstart({
    "chafa",
    "--size=" .. w .. "x" .. h,
    filepath,
  }, { on_stdout = send_output, stdout_buffered = true, pty = true })
end

return M
