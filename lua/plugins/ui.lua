return {
  -- Snacks.nvim configuration
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      animate = {},
      picker = {},
      terminal = {
        win = {
          position = "right",
          width = 0.3,
        },
      },
      scroll = {},
    },
  },

  -- Lualine configuration
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {}
    end,
  },
}
