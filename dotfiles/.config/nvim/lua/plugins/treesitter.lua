return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
        config = function()
       require'nvim-treesitter.configs'.setup({
      ensure_installed = {
        "angular", "bash", "css", "csv", "dockerfile",
        "dot", "git_config", "git_rebase", "gitattributes", "gitcommit",
        "gitignore", "gleam", "html", "java", "javascript",
        "json", "lua", "markdown", "markdown_inline", "prisma",
        "python", "readline", "regex", "rust", "scss",
        "slint", "sql", "ssh_config", "terraform", "tmux",
        "toml", "tsv", "tsx", "typescript", "vimdoc", "xml", "yaml",
        -- "http, "graphql", "comment", "jsdoc", "json5",
        -- "jsonc", "jsonnet", "luadoc", "properties", "proto",
        -- "ruby", "svelte", "swift", "vue", "zig"
        },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
