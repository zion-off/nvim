-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Disable default spell autocmd
pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_wrap_spell")

-- =====================
-- Auto-save Configuration
-- =====================
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
  callback = function()
    if vim.bo.modifiable and not vim.bo.readonly then
      vim.cmd("silent! update")
    end
  end,
})

-- =====================
-- Window Dimming Configuration
-- =====================
-- Adjust this value to control inactive window dimming (0.0 = black, 1.0 = same as active)
local INACTIVE_WINDOW_DIM_FACTOR = 0.75

-- Function to set window highlights relative to current theme
local function set_window_highlights()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

  -- Active window keeps the normal background
  vim.api.nvim_set_hl(0, "ActiveWindow", { bg = normal_hl.bg })

  -- Inactive window gets a dimmed background
  if normal_hl.bg then
    local bg = normal_hl.bg
    -- Extract RGB components
    local r = math.floor(bg / 65536)
    local g = math.floor((bg % 65536) / 256)
    local b = bg % 256

    -- Dim by the configured factor
    r = math.floor(r * INACTIVE_WINDOW_DIM_FACTOR)
    g = math.floor(g * INACTIVE_WINDOW_DIM_FACTOR)
    b = math.floor(b * INACTIVE_WINDOW_DIM_FACTOR)

    local dimmed_bg = r * 65536 + g * 256 + b
    vim.api.nvim_set_hl(0, "InactiveWindow", { bg = dimmed_bg })
  else
    -- Fallback if no background color is set
    vim.api.nvim_set_hl(0, "InactiveWindow", { bg = "#0f0f0f" })
  end
end

-- Apply highlights on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_window_highlights,
})

-- Set initial highlight groups
set_window_highlights()

-- Apply window highlighting on focus change
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = function()
    vim.wo.winhl = "Normal:ActiveWindow,NormalNC:InactiveWindow"
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.wo.winhl = "Normal:InactiveWindow,NormalNC:InactiveWindow"
  end,
})
