-- set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- set leader key
vim.g.mapleader = " "

-- use system clipboard for yankkkk
vim.opt.clipboard = 'unnamedplus'

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
-- disable perl provider (enabled by default)
vim.g.loaded_perl_provider = 0

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies =
      {
        'nvim-lua/plenary.nvim'
      }
  },
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    tag = "3.23",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
}
}
local opts = {}

require("lazy").setup(plugins, opts)

-- keymaps
local keymap = vim.keymap.set
keymap('n', '<leader>w', ':w <CR>', {})
keymap('n', '<leader>q', ':q <CR>', {})
keymap('n', '<leader>w!', ':w! <CR>', {})
keymap('n', '<leader>q!', ':q! <CR>', {})
keymap('n', '<leader><f5>', ':source $HOME/.config/nvim/init.lua <CR>', {})

-- telescope
local builtin = require("telescope.builtin")
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})

-- neotree
keymap('n', '<leader>ee', ':Neotree filesystem reveal left <CR>', {})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {
    "angular", "bash", "css", "csv", "dockerfile", "dot", "git_config", "git_rebase", "gitattributes", "gitcommit",
    "gitignore", "gleam", "html", "java", "javascript", "json", "lua", "markdown", "markdown_inline", "prisma",
    "python", "readline", "regex", "rust", "scss", "slint", "sql", "ssh_config", "terraform", "tmux",
    "toml", "tsv", "tsx", "typescript", "vimdoc", "xml", "yaml",

    -- "http, "graphql", "comment", "jsdoc", "json5", "jsonc", "jsonnet", "luadoc", "properties", "proto",
    -- "ruby", "svelte", "swift", "vue", "zig"

  },
  highlight = { enable = true },
  indent = { enable = true },
})

-- colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
