return {
    "nvim-neo-tree/neo-tree.nvim",
    tag = "3.23",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
  },
    config = function()
      require('neo-tree').setup {
        filesystem = {
        filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".github",
          ".git",
          ".vscode",
          "package-lock.json",
          "pnpm-lock.yaml",
          "yarn.lock",
          "node_modules",
          ".next",
          ".DS_Store",
        },
      },
    },
      default_component_configs = {
      indent = {
        indent_marker = "│",
        last_indent_marker = "└",
        expander_collapsed = "",
        expander_expanded = "",
    },
    icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󱧹",
            default = "",
          },
    modified = {
            symbol = "󰜅",
          },
          git_status = {
            symbols = {
              added     = "",
              modified  = "",
              deleted   = "󰮉",
              renamed   = "",
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "󰴅",
              conflict  = "",
            }
          },
          file_size = {
            enabled = false,
          },
          type = {
            enabled = false,
          },
          last_modified = {
            enabled = false,
          },
          created = {
            enabled = false,
          },
          symlink_target = {
            required_width = 60, -- value between 50 & 70 makes sense
            enabled = true,
          },
        },
        window = {
          width = 30,
        }
      }
    end
  }
