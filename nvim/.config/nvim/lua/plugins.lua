-- This file will contain all the plugins managed by lazy.nvim
return {
  -- Colorscheme
  { 'rakr/vim-one', lazy = false, priority = 1000 },

  -- UI Enhancements
  { 'vim-airline/vim-airline' },
  { 'bling/vim-bufferline' },

  -- Git integration
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },

  -- Utility plugins
  { 'tpope/vim-commentary' },
  { 'moll/vim-bbye' },
  { 'bronson/vim-trailing-whitespace' },
  { 'justinmk/vim-sneak' },
  { 'hisbaan/supertab.nvim' },

  -- Navigation
  { 'justinmk/vim-sneak' },

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
}
