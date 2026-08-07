-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- =====================
-- Completion
-- =====================
-- Disable AI suggestions in the completion menu; use inline ghost text (Copilot) instead
vim.g.ai_cmp = false
vim.opt.spell = false

-- =====================
-- Appearance
-- =====================
-- Force a dark background regardless of the terminal's reported background
vim.opt.background = "dark"
-- Disable popup menu transparency for better readability (LazyVim default is 10)
vim.opt.pumblend = 0

-- =====================
-- Clipboard
-- =====================
-- Route yanks over OSC 52 so they land on the local machine's clipboard
-- through SSH + tmux, since this VM has no X/Wayland display for xclip/wl-copy.
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}
vim.opt.clipboard = "unnamedplus"

-- =====================
-- Editing
-- =====================
-- Increase timeout for which-key to prevent space key issues (LazyVim default is 300)
vim.opt.timeoutlen = 400
-- Wrap long lines instead of scrolling horizontally (LazyVim default is false)
vim.opt.wrap = true
-- Indent wrapped lines to match the start of the line (pairs with `wrap`)
vim.opt.breakindent = true
