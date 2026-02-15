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
      picker = "telescope",
      use_local_fs = true,
      enable_builtin = true,
      default_to_projects_v2 = false,
      default_merge_method = "rebase",
      gh_cmd = "/opt/homebrew/bin/gh",
    },
  },
  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  },
  -- Diffview integration
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview file history" },
      { "<leader>gF", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview branch history" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    lazy = false,
    config = function()
      require("claudecode").setup({
        open_command = "vsplit",
        diff_opts = {
          layout = "vertical", -- Use vertical splits for diffs
          open_in_new_tab = false, -- Keep diffs in current tab for easier access
          keep_terminal_focus = false, -- Focus on diff window instead of terminal
          hide_terminal_in_new_tab = false, -- Keep terminal visible when opening in new tab
          on_new_file_reject = "keep_empty", -- Keep empty buffer when rejecting new file diffs
        },
      })
    end,
  },
}
