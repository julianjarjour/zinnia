require("settings")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {"catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  {"nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {"akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons  = false,
        show_close_icon  = false,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {"windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },


  {"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

})
