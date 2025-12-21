return {
  -- Jellybeans theme
  {
    "metalelf0/jellybeans-nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      vim.cmd("colorscheme jellybeans-nvim")
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
            hidden = false,
            ignored = false,
          },
        },
      },
      explorer = {
        hidden = false,
        ignored = false,
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

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup({
        marks = {
          Error = { text = { "█" } },
          Warn = { text = { "█" } },
          Info = { text = { "█" } },
          Hint = { text = { "█" } },
          Misc = { text = { "█" } },
        },
      })
    end,
  },

  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    opts = {},
    keys = {
      {
        "<leader>ff",
        function() require("fff").find_files() end,
        desc = "Find files (fff)",
      },
      {
        "<leader>fF",
        function() require("fff").find_in_git_root() end,
        desc = "Find files in git root (fff)",
      },
      {
        "<leader><space>",
        function() require("fff").find_files() end,
        desc = "Find files (fff)",
      },
    },
  },
}
