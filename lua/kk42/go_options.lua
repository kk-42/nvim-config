-- run go fmt on go files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.api.nvim_buf_get_name(0)
    -- write file to disk first so go fmt reads latest contents
    vim.cmd("silent write")
    local cmd = { "go", "fmt", params }
    local result = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("go fmt failed: " .. result)
    else
      -- reload buffer without changing cursor
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.cmd("edit")
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})


