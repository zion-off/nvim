return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      config = function()
        require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
              accept = false, -- Disable default Tab mapping
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          panel = {
            enabled = true,
            auto_refresh = false,
          },
        })

        -- Custom Tab mapping: accept suggestion if visible, otherwise insert tab
        vim.keymap.set("i", "<Tab>", function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end, { desc = "Accept Copilot suggestion or insert tab" })
      end,
    },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  config = function()
    require("fzf-lua").register_ui_select()
    require("CopilotChat").setup({})
  end,
}
