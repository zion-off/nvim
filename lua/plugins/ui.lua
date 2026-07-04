return {
  -- Colorscheme
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("jellybeans").setup({
        on_colors = function(colors)
          colors.background = "#1c1c1c"
        end,
      })
      vim.cmd.colorscheme("jellybeans")
    end,
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
}
