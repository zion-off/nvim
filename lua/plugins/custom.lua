-- Personal plugins (zion-off/*)

local mole_spec = {
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    picker = "snacks",
    virtual_text = true,
  },
}

-- Load mole.nvim from a local working copy when developing it, otherwise from GitHub
local mole_dev = vim.env.DEV_PLUGINS or os.getenv("DEV_PLUGINS")
if mole_dev then
  mole_spec.dir = "~/projects/mole.nvim"
else
  mole_spec[1] = "zion-off/mole.nvim"
end

return {
  -- Diff viewer/utility
  {
    "zion-off/diff",
    lazy = false,
    config = function()
      require("diff").setup()
    end,
  },

  -- Mole (bookmarks/annotations)
  mole_spec,
}
