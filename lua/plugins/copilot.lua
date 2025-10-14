return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  config = function()
    require("fzf-lua").register_ui_select()
    require("CopilotChat").setup({})
  end,
}
