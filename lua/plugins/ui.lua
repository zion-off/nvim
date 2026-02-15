return {

  -- Colorschemes: set lazy = false and priority = 1000 on the active one
  {
    "metalelf0/jellybeans-nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = true,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
      vim.cmd.colorscheme("gruvbox-material")

      -- Strip italic from all highlight groups
      -- for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
      --   local hl = vim.api.nvim_get_hl(0, { name = group })
      --   if hl.italic then
      --     hl.italic = nil
      --     vim.api.nvim_set_hl(0, group, hl --[[@as vim.api.keyset.highlight]])
      --   end
      -- end

      -- Diff highlight overrides
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#232e25" })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#2e2020", fg = "#5c3535" })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#232830" })
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#2c3540" })
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
          grep = {
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
          Error = { text = { "█" }, color = "#ea6962" },
          Warn = { text = { "█" }, color = "#d8a657" },
          Info = { text = { "█" }, color = "#7daea3" },
          Hint = { text = { "█" }, color = "#a9b665" },
          Misc = { text = { "█" }, color = "#d3869b" },
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
        "--exclude",
        ".git",
        "--exclude",
        "node_modules",
        "--exclude",
        "bower_components",
        "--exclude",
        "vendor",
        "--exclude",
        "__pycache__",
        "--exclude",
        ".pytest_cache",
        "--exclude",
        "*.pyc",
        "--exclude",
        ".next",
        "--exclude",
        ".nuxt",
        "--exclude",
        "dist",
        "--exclude",
        "build",
        "--exclude",
        "out",
        "--exclude",
        ".cache",
        "--exclude",
        "coverage",
        "--exclude",
        "target",
        "--exclude",
        ".hg",
        "--exclude",
        ".svn",
      },
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("fff").find_files()
        end,
        desc = "Find files (fff)",
      },
      {
        "<leader>fF",
        function()
          require("fff").find_in_git_root()
        end,
        desc = "Find files in git root (fff)",
      },
      {
        "<leader><space>",
        function()
          require("fff").find_files()
        end,
        desc = "Find files (fff)",
      },
    },
  },
}
