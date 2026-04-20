-- ~/.config/nvim/lua/kk42/plugins/colorscheme.lua

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme tokyonight")
    end,
}
