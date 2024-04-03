local colors = require("custom.colors")
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = {
          -- normal mode
          normal = {
            a = { fg = colors.crust, bg = colors.mauve },
            b = { fg = colors.mauve, bg = colors.surface0 },
            c = { fg = colors.text, bg = colors.base },
            --
            x = { fg = colors.text, bg = colors.base },
            y = { fg = colors.mauve, bg = colors.surface0 },
            z = { fg = colors.crust, bg = colors.mauve },
          },
          -- visual mode
          visual = {
            a = { fg = colors.crust, bg = colors.green },
            b = { fg = colors.green, bg = colors.surface0 },
            c = { fg = colors.text, bg = colors.base },
            --
            x = { fg = colors.text, bg = colors.base },
            y = { fg = colors.green, bg = colors.surface0 },
            z = { fg = colors.crust, bg = colors.green },
          },
          -- insert mode
          insert = {
            a = { fg = colors.crust, bg = colors.sapphire },
            b = { fg = colors.sapphire, bg = colors.surface0 },
            c = { fg = colors.text, bg = colors.base },
            --
            x = { fg = colors.text, bg = colors.base },
            y = { fg = colors.sapphire, bg = colors.surface0 },
            z = { fg = colors.crust, bg = colors.sapphire },
          },
        },
        component_seperators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "Neotree",
          "statusline",
          "winbar",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "buffers" },
        --
        lualine_x = { "filetype" },
        lualine_y = { "branch" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        --
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      -- tabline (empty = disabled)
      tabline = {},
      -- winbar (empty = disabled)
      winbar = {},
      extensions = { "lazy", "neo-tree", "symbols-outline" },
    })
  end,
}
