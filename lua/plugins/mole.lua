local use_local = vim.env.DEV_PLUGINS or os.getenv("DEV_PLUGINS")

local plugin_spec = {
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    picker = "snacks",
    virtual_text = true,
  },
}

if use_local then
  plugin_spec.dir = "~/projects/mole.nvim"
else
  plugin_spec[1] = "zion-off/mole.nvim"
end

return plugin_spec
