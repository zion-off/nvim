return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.spec = opts.spec or {}
    table.insert(opts.spec, {
      { "<leader>a", group = "ai", icon = "󰧑" },
    })
  end,
}
