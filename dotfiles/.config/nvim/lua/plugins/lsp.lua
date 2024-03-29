--# LSP CONFIGURATION (:h vim.lsp.buf) #--
return {
  -- mason
  {
  'williamboman/mason.nvim',
  config = function()
    require("mason").setup()
  end
  },
  -- mason-lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    tag = "v1.27.0",
    config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
          "lua_ls", "bashls", "dockerls", "eslint", "html",
          "htmx", "jsonls", "tsserver", "markdown_oxide", "spectral",
           "prismals", "pyright", "rust_analyzer", "sqlls",
          "stylelint_lsp", "taplo", "tailwindcss", "lemminx", "hydra_lsp",
          "somesass_ls"
        --# Additional LSPs #--
        -- angular: angularls
        -- css: cssls, cssmodules_ls, unocss
        -- docker: docker_compose_language_service, dockerls
        -- sql: graphql, prismals, sqlls,
        -- json: jsonls, biome, jsonnet_ls(jsonnet)
        -- javascript: quick_lint_js, tsserver, vtsls, biome
        -- TypeScript: biome, tsserver, vtsls
        -- markdown: markdown_oxide, marksman, prosemd_lsp, remark_ls, zk
        -- OpenAPI: spectral, vacuum
        -- Python: basedpyright, pyre, pyright, pylyzer, sourcery, pylsp, ruff_lsp
        -- Terraform: tflint
        -- Svelte: svelte
        -- "powershell_es"
        }
        })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.html.setup({})
      lspconfig.htmx.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.markdown_oxide.setup({})
      lspconfig.spectral.setup({})
      lspconfig.prismals.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.stylelint_lsp.setup({})
      lspconfig.taplo.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.lemminx.setup({})
      lspconfig.hydra_lsp.setup({})
      lspconfig.somesass_ls.setup({})
    end
  }
}
