return {
  -- Dashboard configuration
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢖⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠇⢀⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠁⠀⡞⠀⠀⠀⠀⠀⠀⣠⠔⣺⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⠃⠀⣸⠁⠀⠀⠀⠀⣠⠊⠀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⠀⠀⠳⡀⠀⠀⠀⡜⠁⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡸⢣⡄⢀⡀⠀⠀⠘⢦⡀⡼⠁⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣸⠁⠈⢧⠜⠀⠀⠀⠀⠀⠙⠃⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣯⠀⠀⠀⠀⠀⠀⠀⡄⢀⡀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣀⡀⢸⠀⠀⠀⡀⠀⠀⠀⠹⠼⠃⠀⠀⠈⢳⡀⠀⢠⣄⠀⠀⠀⠀⢿⠳⢤⠀⠀⠀⠀
⠀⠀⣼⣏⣯⡭⠟⠀⠀⡞⠉⠲⢤⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⡏⢧⠀⠀⠀⠈⣇⠈⢧⠀⠀⠀
⠀⠐⣿⠿⠛⠁⠀⠀⠀⠙⢤⡀⠀⠳⢄⡀⠀⠀⠀⠀⠀⠀⠈⠳⡧⠈⣇⠀⠀⠀⠸⡄⠈⢧⠀⠀
⠀⠀⡏⢠⠄⠀⠀⠀⠀⢠⡀⠑⢦⡀⠀⠉⠲⣄⠀⠀⠀⠀⠀⠀⠙⣆⠸⡄⠀⠀⠀⢿⠀⠘⡆⠀
⠀⢰⡇⣾⠀⠀⠀⠀⠀⣾⠓⢤⡈⠑⢦⡀⠀⠉⠲⣄⠀⠀⠀⠀⠀⠹⣄⠧⢤⣤⡤⠾⠀⠀⣇⠀
⠀⢸⢀⡇⡀⠀⠀⠀⠀⣇⠀⠀⠙⠲⣄⣙⣦⡤⠤⠶⠟⢦⡀⠀⢠⠀⣨⢳⠀⠀⡀⠀⡄⠀⠹⡄
⠀⣿⢸⠇⠀⠀⠀⠈⢀⡿⡴⢶⠚⠛⠉⠁⠀⠀⠀⠀⠀⠀⠈⠳⣌⡳⠋⠈⡇⠀⠳⠞⠁⠀⠀⡇
⢀⡿⢸⡄⠀⠀⠀⠀⢨⡷⣿⣯⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠲⠁⠀⠀⠀⠀⠀⠀⡇
⠈⡇⢸⡂⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠉⠉⠉⠉⠛⠓⠶⣖⡖⠶⣶⡒⠒⠶⠶⠤⡄⠀⠀⡼⠁
⠀⣇⠸⣇⠀⠀⠀⠀⢸⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠦⣉⡙⠲⠤⣤⡇⠀⢸⠁⠀
⠀⠙⣦⣈⡓⠶⠤⣄⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢆⠀⠀⠀⠈⢳⡀
⠀⠀⣿⠈⠉⠙⠲⢤⣉⡉⠛⠒⠦⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⡷
⠀⠀⣷⠀⠀⠀⠀⠀⢸⡉⠙⠲⠦⢤⣄⣉⡉⠙⠒⠒⠶⠦⠦⠤⠤⠤⣤⣴⣤⠼⠷⠚⠁⠀⣴⠃
⠀⠀⡿⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠈⠉⠙⠓⠒⠒⠶⠶⠶⠤⠤⠤⠤⠶⣤⠴⣶⣖⡟⠉⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⢾⡽⣆⡾⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠈⠛⣿⠀⠀
      ]]

      logo = string.rep("\n", 2) .. logo .. "\n"
      opts.config.header = vim.split(logo, "\n")
      opts.config.header_hl = "DashboardLogo"
      vim.api.nvim_set_hl(0, "DashboardLogo", { fg = "#ffffff" })
      opts.config.footer = function()
        return {}
      end
    end,
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      table.insert(opts.spec, {
        { "<leader>a", group = "ai", icon = "󰧑" },
      })
    end,
  },

  -- Gitsigns configuration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },
  -- Cursor animation
  {
    "sphamba/smear-cursor.nvim",

    opts = {
      -- Cursor color
      cursor_color = "#c6c6c6",

      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,
    },
  },
}
