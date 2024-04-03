return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true, -- automatically installs parsers when new filetype is encountered
      ensure_installed = {
        "bash",
        "css",
        "csv",
        "dockerfile",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "sql",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
