local use_local = vim.env.DEV_PLUGINS or os.getenv("DEV_PLUGINS")

local plugin_spec = {
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    picker = "telescope",
    use_local_fs = true,
    enable_builtin = true,
    default_to_projects_v2 = false,
    default_merge_method = "rebase",
    gh_cmd = "/opt/homebrew/bin/gh",
  },
}

if use_local then
  plugin_spec.dir = "~/projects/octo.nvim"
else
  plugin_spec[1] = "zion-off/octo.nvim"
end

return plugin_spec
