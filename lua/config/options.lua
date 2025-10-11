-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.autochdir = true
vim.opt.spell = false
vim.opt.autowriteall = true -- Auto-save files
vim.opt.background = "dark"

vim.opt.wrap = true
vim.opt.breakindent = true

-- Load terminal colors
require("config.colors").setup()
