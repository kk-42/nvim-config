-- ~/.config/nvim/lua/kk42/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre", "BufNewFile"},
  build = ":TSUpdate",

  config = function()
      treesitter = require( "nvim-treesitter")
      treesitter.setup(
        {
           highlight = {enable = true, additional_vim_regex_highlighting = false, },
           indednt = { enable = true },
           autotag = { enable = true },
           ensure_installed = {"lua", "bash", "python", "dockerfile", "vim" },
        }
      )
  end,

        
}
