local keymap = vim.keymap.set             -- wrapper around vim.api.nvim_set_keymap (lua friendly interface)
local nv_keymap = vim.api.nvim_set_keymap -- direct neovim keymap api (low level)
local key_opts = { noremap = true, silent = true }

local trim_spaces = true -- used by toggleterm
local term_args = { args = vim.v.count }

-- quit & writefile
keymap("n", "<leader>w", ":w<CR>", key_opts)
keymap("n", "<leader>q", ":q<CR>", key_opts)
keymap("n", "<leader>qa", ":qa!<CR>", key_opts)

-- navigate windows
keymap({ "n", "t", "v" }, "<C-h>", "<Cmd>wincmd h<CR>", key_opts)
keymap({ "n", "t", "v" }, "<C-j>", "<Cmd>wincmd j<CR>", key_opts)
keymap({ "n", "t", "v" }, "<C-k>", "<Cmd>wincmd k<CR>", key_opts)
keymap({ "n", "t", "v" }, "<C-l>", "<Cmd>wincmd l<CR>", key_opts)

-- reverse undo
keymap("n", "<C-u>", "<C-r>", {})
keymap("n", "<C-r>", "<Nop>", {})
-- source init.lua
keymap("n", "<leader><f5>", ":source $HOME/.config/nvim/init.lua <CR>", {})
-- stop find & repl & replace
keymap("n", "<leader><escape>", ":noh <CR>", {})

-- find and replace
keymap("n", "<Leader>fr", [[:lua FindAndReplace()<CR>]], key_opts)

function FindAndReplace()
  local text_old = vim.fn.input("Enter text_old: ")
  local text_new = vim.fn.input("Enter text_new: ")
  vim.cmd(string.format("%%s/%s/%s/g", vim.fn.escape(text_old, "/"), vim.fn.escape(text_new, "/")))
end

function ChangeWorkingDirectory()
  local dir_path = vim.fn.input("Enter directory path: (absolute)")
end

-- # TERMINAL # --
-- send selected text to terminal
vim.keymap.set("v", "<T>", function()
  --  require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
  require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, term_args)
end)

-- # NEOTREE # --
nv_keymap("n", "<leader>ee", ":Neotree reveal left <CR>", {})

--# LSP #--
-- hover infobox
keymap({ "n", "v" }, "<C-k>", vim.lsp.buf.hover, {})
keymap({ "n", "v" }, "<leader>df", vim.lsp.buf.definition, {})
-- code actions
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
-- formatting
keymap("n", "<leader>F", vim.lsp.buf.format, {})
-- code actions
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

--# LAZYGIT #--
keymap("n", "<leader>lg", ":LazyGit <CR>", {})
keymap("n", "<leader>lgc", ":LazyGitConfig <CR>", {})
