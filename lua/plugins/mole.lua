local use_local = vim.env.LOCAL_MOLE_NVIM or os.getenv("LOCAL_MOLE_NVIM")

local plugin_spec = {
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    picker = "snacks",
  },
}

if use_local then
  plugin_spec.dir = "~/projects/mole.nvim"
else
  plugin_spec[1] = "zion-off/mole.nvim"
end

return plugin_spec
