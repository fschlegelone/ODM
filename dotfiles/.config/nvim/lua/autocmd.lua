local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- autocmd [group] event pattern command

-- # AUGROUPS # --
augroup("workdirectory", { clear = true })
augroup("highlight-yank", { clear = true })
-- # AUTOCOMMANDS # --

autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = "highlight-yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- change workdirectory
autocmd({ "DirChanged" }, {
  group = "workdirectory",
  callback = function()
    print("CWD changed")
  end,
  pattern = "*",
})
