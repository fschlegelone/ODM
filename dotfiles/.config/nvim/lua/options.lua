-- # # # # --
-- OPTIONS --
-- # # # # --
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
vim.opt.numberwidth = 2
-- disable perl provider (enabled by default)
vim.g.loaded_perl_provider = 0