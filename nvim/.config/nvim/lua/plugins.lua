-- This file will contain all the plugins managed by lazy.nvim
return {
  -- Colorscheme
  { 'rakr/vim-one', lazy = false, priority = 1000 },

  -- UI Enhancements
  { 'vim-airline/vim-airline' },
  { 'bling/vim-bufferline' },
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Navigation and Editing
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<esc>"] = actions.close
            }
          },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            ".cache",
            "%.class",
            "%.pdf",
            "%.mkd",
            "%.zip"
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })

      -- Key mappings
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help tags' })
    end
  },
  { 'justinmk/vim-sneak' },

  -- Git integration
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },
  { 'lewis6991/gitsigns.nvim' },

  -- Utility plugins
  { 'tpope/vim-commentary' },
  { 'moll/vim-bbye' },
  { 'bronson/vim-trailing-whitespace' },
  { 'hisbaan/supertab.nvim' },
  { 'windwp/nvim-autopairs' },
  { 'numToStr/Comment.nvim' },

  -- Language support
  { 'othree/yajs.vim', ft = 'javascript' },
  { 'mxw/vim-jsx', ft = 'javascript.jsx' },
  { 'elixir-lang/vim-elixir', ft = 'elixir' },
  { 'digitaltoad/vim-pug', ft = 'pug' },
  { 'slim-template/vim-slim', ft = 'slim' },
  { 'dart-lang/dart-vim-plugin', ft = 'dart' },
  { 'rust-lang/rust.vim', ft = 'rust' },
  { 'rhysd/vim-crystal', ft = 'crystal' },
  { 'reasonml-editor/vim-reason-plus', ft = 'reason' },
  { 'JuliaEditorSupport/julia-vim', ft = 'julia' },
  { 'jpalardy/vim-slime', ft = 'julia' },
  { 'tomlion/vim-solidity', ft = 'solidity' },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
          number = false,
          relativenumber = false,
        },
        renderer = {
          group_empty = true,
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
              },
            }
          }
        },
        filters = {
          dotfiles = false,
        },
      })

      -- Key mapping to toggle nvim-tree
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    end
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  }
}
