-- toggleterm.nvim
local colors = require("custom.colors")
return {
  "akinsho/toggleterm.nvim",
  tag = "v2.10.0",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<leader>T]],
      --       on_create = fun(t: Terminal), -- function to run when the terminal is first created
      --       on_open = fun(t: Terminal), -- function to run when the terminal opens
      --        on_close = fun(t: Terminal), -- function to run when the terminal closes
      hide_numbers = true, -- hide line numbers
      autochdir = false,   -- auto updates terminal directory based on nvim CWD
      highlights = {
        Normal = {
          guibg = colors.base, -- terminal bg
          guifg = colors.text, -- terminal fg
        },
        NormalFloat = {
          link = "Normal",
        },
        FloatBorder = {
          guifg = colors.lavender,
          guibg = colors.lavender,
        },
      },
      shade_filetypes = {},
      shade_terminals = false, -- NOTE: takes prio over highlight group definitions
      start_in_insert = true,
      persist_size = false,    -- persisting means that all splits get the same size. When disabled, opening term is set to 'size'
      close_on_exit = true,
      terminal_mappings = true,
      shell = vim.o.shell,
      auto_scroll = true,  -- automatically scroll to the bottom on terminal output
      float_opts = {
        border = "double", -- values: single, double, shadow, curved (+ everything win open supports)
        -- size, width, height, row, and col can be a number or function
        width = 20,
        heigth = 20,
        --  row = 20,
        --  col = 20,
        --  winblend = 3,
        zindex = 1,
        title_pos = "center",
      },
    })
    -- CUSTOM TERMINALS
    local Terminal = require('toggleterm.terminal').Terminal
    -- lazygit
    local lazygit  = Terminal:new({
      cmd = "lazygit",
      -- dir = "/opt/repos/projects",
      autochdir = true, -- updates terminal dir based on nvim CWD
      start_in_insert = true,
      on_open = function()
        print("lazygit opened")
        vim.cmd("vsplit")
        print("vert split")
        vim.cmd("wincmd l")
        print("switch rightpane")
        vim.cmd("split")
        print("hor split")
      end,
      on_exit = function()
        print("lazygit closed")
      end,
      direction = "float",
      float_opts = {
        zindex = 10,
        border = "single",
        width = 80,
      },
    })
    local neofetch = Terminal:new({
      cmd = "ls",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        zindex = 20,
        border = "single",
        width = 140,
      },
    })

    function _toggle_layout_dev()
      lazygit:toggle()
      -- neofetch:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>lz", "<cmd>lua _toggle_layout_dev()<CR>", { noremap = true, silent = true })
  end,
}
