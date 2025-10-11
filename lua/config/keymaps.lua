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

vim.keymap.set("n", "<leader>bp", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bn", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Override terminal keybindings
vim.keymap.set("n", "<leader>ft", function()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local target_dir = (vim.v.shell_error == 0 and git_root ~= "") and git_root or vim.fn.getcwd()
  vim.cmd("terminal")
  vim.cmd("startinsert")
  vim.fn.chansend(vim.b.terminal_job_id, "cd " .. vim.fn.shellescape(target_dir) .. "\n")
end, { desc = "Terminal (project root)" })
vim.keymap.set("n", "<leader>fT", ":terminal<CR>", { desc = "Terminal (current buffer)" })
