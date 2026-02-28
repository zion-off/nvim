return {
  { "github/copilot.vim" },
  {
    "zion-off/copilot.nvim",
    config = function()
      require("copilot").setup()
    end,
  },
}
