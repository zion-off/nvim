-- Change this one value to switch the startup colorscheme
local active_theme = "jellybeans-muted"

-- Each theme: { repo, colorscheme, opts, setup(optional) }
-- setup() runs before colorscheme is applied; config() runs after.
local themes = {
  {
    repo = "casedami/neomodern.nvim",
    colorscheme = "roseprime",
    opts = { opts = {} },
  },
  {
    repo = "rebelot/kanagawa.nvim",
    colorscheme = "kanagawa-dragon",
    config = function()
      -- Disable italics globally
      for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.italic == true then
          vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", hl, { italic = false }))
        end
      end
    end,
  },
  {
    repo = "wtfox/jellybeans.nvim",
    colorscheme = "jellybeans-muted",
    opts = { opts = {} },
    config = function()
      -- Apply kanagawa-dragon background color
      vim.api.nvim_set_hl(0, "Normal", { bg = "#181616" })

      -- For floating windows, preserve fg but set bg
      local float_groups = {
        "NormalFloat",
        "FloatBorder",
        "SnacksPickerBorder",
        "SnacksPickerList",
        "SnacksPickerPreview",
        "SnacksPickerInput",
        "SnacksPickerPrompt",
      }
      for _, group in ipairs(float_groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.fg then
          vim.api.nvim_set_hl(0, group, { fg = hl.fg, bg = "#181616" })
        else
          vim.api.nvim_set_hl(0, group, { bg = "#181616" })
        end
      end

      -- For titles, link to Normal to avoid blue backgrounds
      vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
      vim.api.nvim_set_hl(0, "SnacksPickerTitle", { link = "Normal" })
      vim.api.nvim_set_hl(0, "SnacksPickerBoxTitle", { link = "Normal" })
    end,
  },
  {
    repo = "sainnhe/gruvbox-material",
    colorscheme = "gruvbox-material",
    setup = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
    end,
    config = function()
      vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bold = true })
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#232e25" })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#2e2020" })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#232830" })
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#2c3540" })
    end,
  },
}

local function build_theme_specs()
  local specs = {}
  for _, theme in ipairs(themes) do
    local is_active = theme.colorscheme == active_theme
    local spec = vim.tbl_deep_extend("force", {
      theme.repo,
      lazy = not is_active,
      priority = is_active and 1000 or nil,
      config = is_active and function()
        if theme.setup then
          theme.setup()
        end
        vim.cmd.colorscheme(theme.colorscheme)
        if theme.config then
          theme.config()
        end
      end or nil,
    }, theme.opts or {})
    table.insert(specs, spec)
  end
  return specs
end

local specs = build_theme_specs()

-- Append non-theme plugins
vim.list_extend(specs, {
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
})

return specs
