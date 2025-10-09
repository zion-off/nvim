-- Keymaps are automatically loaded on the VeryLazy event
-- 
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Execute shell command silently
vim.keymap.set("n", "<leader>xs", function()
  local cmd = vim.fn.input("Command: ")
  if cmd ~= "" then
    vim.fn.system(cmd)
  end
end, { desc = "Execute shell command" })

vim.keymap.set("n", "<leader>ac", ":ClaudeCode<CR>", { desc = "Toggle Claude Code" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
vim.keymap.set("n", "<leader>ay", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
vim.keymap.set("n", "<leader>an", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

-- Override terminal keybindings to open in current buffer
vim.keymap.set("n", "<leader>ft", ":terminal<CR>", { desc = "Terminal (current buffer)" })
vim.keymap.set("n", "<leader>fT", ":terminal<CR>", { desc = "Terminal (current buffer)" })
