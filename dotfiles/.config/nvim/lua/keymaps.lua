local keymap = vim.keymap.set             -- wrapper around vim.api.nvim_set_keymap (lua friendly interface)
local nv_keymap = vim.api.nvim_set_keymap -- direct neovim keymap api (low level)
local key_opts = { noremap = true, silent = true }
-- VIM Motions
keymap("n", "<leader>w", ":w <CR>", {})
keymap("n", "<leader>q", ":q <CR>", {})
keymap("n", "<leader>w!", ":w! <CR>", {})
keymap("n", "<leader>q!", ":q! <CR>", {})
keymap("n", "<leader>qa", ":qa! <CR>", {})

-- reverse undo
keymap("n", "<C-u>", "<C-r>", {})
keymap("n", "<C-r>", "<Nop>", {})
-- source init.lua
keymap('n', '<leader><f5>', ':source $HOME/.config/nvim/init.lua <CR>', {})
-- stop find & repl & replace
keymap('n', '<leader><escape>', ':noh <CR>', {})

-- find and replace
keymap("n", "<Leader>fr", [[:lua FindAndReplace()<CR>]], key_opts)

function FindAndReplace()
  local text_old = vim.fn.input("Enter text_old: ")
  local text_new = vim.fn.input("Enter text_new: ")
  vim.cmd(string.format("%%s/%s/%s/g", vim.fn.escape(text_old, "/"), vim.fn.escape(text_new, "/")))
end

--# NEOTREE #--
nv_keymap("n", "<leader>ee", ":Neotree reveal left <CR>", {})

--# LSP #--
-- hover infobox
keymap({ 'n', 'v' }, '<C-k>', vim.lsp.buf.hover, {})
keymap({ 'n', 'v' }, '<leader>df', vim.lsp.buf.definition, {})
-- code actions
keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- formatting
keymap("n", "<leader>F", vim.lsp.buf.format, {})
-- code actions
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

--# LAZYGIT #--
keymap("n", "<leader>lg", ":LazyGit <CR>", {})
keymap("n", "<leader>lgc", ":LazyGitConfig <CR>", {})
