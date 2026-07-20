-- Personal plugins (zion-off/*)

local mole_spec = {
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    picker = "snacks",
    virtual_text = true,
  },
}

local diff_spec = {
  lazy = false,
  config = function()
    require("diff").setup()
  end,
}

-- Load mole.nvim from a local working copy when developing it, otherwise from GitHub
local dev = false
if dev then
  mole_spec.dir = "~/projects/mole.nvim"
  diff_spec.dir = "~/projects/diff"
else
  mole_spec[1] = "zion-off/mole.nvim"
  diff_spec[1] = "zion-off/diff"
end

return {
  -- Diff viewer/utility
  diff_spec,
  -- Mole (bookmarks/annotations)
  mole_spec,
}
