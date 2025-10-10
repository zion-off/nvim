return {
  -- OneDarkPro theme
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        colors = {
          onedark = {
            bg = "#1e2127",
          },
          onedark_dark = {
            bg = "#0f0f0f",
          },
        },
        highlights = {
          TermCursor = { bg = "#e8e8e8" },
        },
        options = {
          transparency = false,
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },

  -- Oxocarbon theme
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme oxocarbon")
    end,
  },

  -- Snacks.nvim configuration
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      animate = {},
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
      terminal = {
        win = {
          position = "right",
          width = 0.3,
        },
      },
      scroll = {},
    },
  },

  -- Material icons
  {
    "DaikyXendo/nvim-material-icon",
  },

}
