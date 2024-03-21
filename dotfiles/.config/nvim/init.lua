local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- use system clipboard
vim.opt.clipboard:append("unnamedplus")

local plugins = {
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "startup-nvim/startup.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
local opts = {}

require("lazy").setup(plugins, opts)
