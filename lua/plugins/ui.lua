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
    keys = {
      { "<leader>ff", false }, -- disable default, using fff.nvim instead
    },
    ---@type snacks.Config
    opts = {
      gitbrowse = {
        what = "permalink",
      },
      animate = {},
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          grep = {
            hidden = true,
            ignored = true,
            exclude = {
              ".git",
              "node_modules",
              "bower_components",
              "vendor",
              "__pycache__",
              ".pytest_cache",
              "*.pyc",
              ".next",
              ".nuxt",
              "dist",
              "build",
              "out",
              ".cache",
              "coverage",
              "target",
              ".hg",
              ".svn",
            },
          },
        },
      },
      explorer = {
        hidden = true,
        ignored = true,
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
    opts = {
      fd_extra_args = {
        "--exclude", ".git",
        "--exclude", "node_modules",
        "--exclude", "bower_components",
        "--exclude", "vendor",
        "--exclude", "__pycache__",
        "--exclude", ".pytest_cache",
        "--exclude", "*.pyc",
        "--exclude", ".next",
        "--exclude", ".nuxt",
        "--exclude", "dist",
        "--exclude", "build",
        "--exclude", "out",
        "--exclude", ".cache",
        "--exclude", "coverage",
        "--exclude", "target",
        "--exclude", ".hg",
        "--exclude", ".svn",
      },
    },
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
