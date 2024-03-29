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
  },
    custom_highlights = function(colors)
    return {
      NeoTreeDirectoryIcon = { fg = colors.teal },
      NeoTreeDirectoryName = { fg = colors.text },
		  NeoTreeIndentMarker = { fg = colors.pink },
		  NeoTreeRootName = { fg = colors.green, style = { "bold" } },
      NeoTreeTitleBar = { fg = colors.mantle, bg = colors.mauve },
    }
    end
    })
    vim.cmd.colorscheme "catppuccin"
  end

}
