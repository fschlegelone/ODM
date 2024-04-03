-- set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- set leader key
vim.g.mapleader = " "
-- use system clipboard for yankkkk
vim.opt.clipboard = "unnamedplus"
-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
-- disable perl provider (enabled by default)
vim.g.loaded_perl_provider = 0

-- set nvim shell binary
vim.o.shell = "/opt/homebrew/bin/zsh -i"

vim.opt.termguicolors = true

-- highlight cursorline
vim.opt.cursorline = false

vim.opt.hidden = true
