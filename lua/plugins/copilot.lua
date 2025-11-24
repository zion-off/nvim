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

        -- Custom Tab mapping: accept suggestion if visible, otherwise fallback to default tab
        vim.keymap.set("i", "<Tab>", function()
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            -- Fallback: let blink.cmp or default tab behavior handle it
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end, { desc = "Accept Copilot suggestion or fallback to default tab" })
      end,
    },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {},
  config = function()
    require("CopilotChat").setup({})
  end,
}
