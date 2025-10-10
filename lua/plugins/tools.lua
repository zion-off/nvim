return {
  -- GitHub integration
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = false,
      default_merge_method = "squash",
      gh_cmd = "/opt/homebrew/bin/gh",
    },
  },

  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    lazy = false,
    config = function()
      require("claudecode").setup({
        open_command = "vsplit",
      })
    end,
  },
}
