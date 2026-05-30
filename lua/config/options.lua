-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable AI in completion menu, use inline ghost text instead
vim.g.ai_cmp = false
vim.opt.spell = false
vim.opt.background = "dark"

-- Increase timeout for which-key to prevent space key issues
vim.opt.timeoutlen = 400

vim.opt.pumblend = 0
vim.opt.wrap = true
vim.opt.breakindent = true
