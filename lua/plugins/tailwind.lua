return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- "*" keeps cheap hex/rgb coloring in every filetype (e.g. this config),
      -- while the expensive tailwind matching is enabled only where it's used.
      filetypes = {
        "*",
        css = { tailwind = true },
        scss = { tailwind = true },
        sass = { tailwind = true },
        less = { tailwind = true },
        html = { tailwind = true },
        javascript = { tailwind = true },
        javascriptreact = { tailwind = true },
        typescript = { tailwind = true },
        typescriptreact = { tailwind = true },
        vue = { tailwind = true },
        svelte = { tailwind = true },
      },
      user_default_options = {
        tailwind = false,
      },
    },
  },
}
