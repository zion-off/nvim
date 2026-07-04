return {
  "dmtrKovalenko/fff.nvim",
  commit = "1cd8d31da4c1536be11c4dae0ed61d066e05e87f",
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    fd_extra_args = {
      "--exclude",
      ".git",
      "--exclude",
      "node_modules",
      "--exclude",
      "bower_components",
      "--exclude",
      "vendor",
      "--exclude",
      "__pycache__",
      "--exclude",
      ".pytest_cache",
      "--exclude",
      "*.pyc",
      "--exclude",
      ".next",
      "--exclude",
      ".nuxt",
      "--exclude",
      "dist",
      "--exclude",
      "build",
      "--exclude",
      "out",
      "--exclude",
      ".cache",
      "--exclude",
      "coverage",
      "--exclude",
      "target",
      "--exclude",
      ".hg",
      "--exclude",
      ".svn",
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("fff").find_files()
      end,
      desc = "Find files (fff)",
    },
    {
      "<leader>fF",
      function()
        require("fff").find_in_git_root()
      end,
      desc = "Find files in git root (fff)",
    },
    {
      "<leader><space>",
      function()
        require("fff").find_files()
      end,
      desc = "Find files (fff)",
    },
  },
}
