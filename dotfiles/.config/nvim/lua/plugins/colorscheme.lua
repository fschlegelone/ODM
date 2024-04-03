return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      integrations = {
        neotree = true,
        mason = true,
        noice = true,
        dashboard = true,
        treesitter = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
      -- highlight groups
      custom_highlights = function(colors)
        return {
          -- neotree
          NeoTreeDirectoryIcon = { fg = colors.red },
          NeoTreeDirectoryName = { fg = colors.text },
          NeoTreeIndentMarker = { fg = colors.pink },
          NeoTreeRootName = { fg = colors.green, style = { "bold" } },
          NeoTreeTitleBar = { fg = colors.mantle, bg = colors.mauve },

          -- dashboard
          DashboardHeader = { fg = colors.mauve },
          DashboardFooter = { fg = colors.mauve },
          DashboardDesc = { fg = colors.text },
          DashboardKey = { fg = colors.red },
          DashboardIcon = { fg = colors.teal },
          DashboardShortCut = { fg = colors.teal },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
