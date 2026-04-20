
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end


-- edit /tabedit
vim.api.nvim_set_keymap('n', 't', ':tabedit<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', 'e', ':edit ', { noremap = true})

-- neotree

vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>Neotree toggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', '<CMD>Neotree focus<CR>', {noremap = true})


-- window navigation
--
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

