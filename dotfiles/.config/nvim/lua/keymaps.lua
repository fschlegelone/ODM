-- # # # # --
-- KEYMAPS --
-- # # # # --
local keymap = vim.keymap.set

-- motions
keymap('n', '<leader>w', ':w <CR>', {})
keymap('n', '<leader>q', ':q <CR>', {})
keymap('n', '<leader>w!', ':w! <CR>', {})
keymap('n', '<leader>q!', ':q! <CR>', {})
-- source init.lua
keymap('n', '<leader><f5>', ':source $HOME/.config/nvim/init.lua <CR>', {})
-- stop find & repl & replace
keymap('n', '<leader><escape>', ':noh <CR>', {})

--# TELESCOPE #--
local builtin = require("telescope.builtin")
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
--# NEOTREE #--
keymap('n', '<leader>ee', ':Neotree reveal left <CR>', {})

--# LSP #--
-- hover infobox
keymap({ 'n', 'v' }, '<C-k>', vim.lsp.buf.hover, {})
keymap({ 'n', 'v' }, '<leader>df', vim.lsp.buf.definition, {})
-- code actions
keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
