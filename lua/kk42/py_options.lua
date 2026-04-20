vim.g.lazyvim_python_lsp = "pyrefly"

-- run black on python files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local params = vim.api.nvim_buf_get_name(0)
    -- write file to disk first so black reads latest contents
    vim.cmd("silent write")
    local cmd = { "black", "--fast", params }
    local result = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("Black failed: " .. result)
    else
      -- reload buffer without changing cursor
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.cmd("edit")
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})

-- run isort on python files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local params = vim.api.nvim_buf_get_name(0)
    -- write file to disk first so black reads latest contents
    vim.cmd("silent write")
    local cmd = { "isort",  params }
    local result = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("isort failed: " .. result)
    else
      -- reload buffer without changing cursor
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.cmd("edit")
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})


-- define F8 commaond to run flake8

vim.api.nvim_create_user_command("F8", function(opts)
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].filetype ~= "python" then
    vim.api.nvim_err_writeln("flake8: not a python file")
    return
  end
  -- ensure buffer is saved so black formats the on-disk file
  vim.cmd("write")
  local fname = vim.api.nvim_buf_get_name(bufnr)
  local cmd = { "flake8", "--extend-ignore", "E501", fname }
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("flake8 failed: " .. result)
    return
  end
  -- reload buffer and preserve cursor
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd("edit")
  vim.api.nvim_win_set_cursor(0, { row, col })
end, { desc = "Check current Python buffer with Flake8" })

-- run flake8 on python files on save
--[[
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local params = vim.api.nvim_buf_get_name(0)
    -- write file to disk first so black reads latest contents
    vim.cmd("silent write")
    local cmd = { "flake8", "--extend-ignore E501",  params }
    local result = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_err_writeln("Flake8 failed: " .. result)
    else
      -- reload buffer without changing cursor
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.cmd("edit")
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})
]]
