-- Basic settings
vim.o.number = true
-- vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.termguicolors = true

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

