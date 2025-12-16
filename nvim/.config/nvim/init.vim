" Sane defaults
set background=dark
set mouse=a
set ignorecase
set smartcase
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set noerrorbells
set relativenumber
set number
set hidden
set scrolloff=5
set visualbell
set gdefault
set noswapfile
set noshowmode
set nofixendofline
set updatetime=100
set timeoutlen=1000
set ttimeoutlen=0
set termguicolors

" Plugins! (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'moll/vim-bbye'
Plug 'bronson/vim-trailing-whitespace'
Plug 'justinmk/vim-sneak'
Plug 'hisbaan/supertab.nvim'
Plug 'rakr/vim-one'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'rust-lang/rust.vim',  { 'for': 'rust' }
Plug 'rhysd/vim-crystal',  { 'for': 'crystal' }
Plug 'reasonml-editor/vim-reason-plus',  { 'for': 'reason' }
Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
Plug 'jpalardy/vim-slime', { 'for': 'julia' }
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
call plug#end()

" Theme!
colorscheme one

" Python, C and Julia indent are 4 characters tab
autocmd FileType python setlocal shiftwidth=4
autocmd FileType c setlocal shiftwidth=4
autocmd FileType julia setlocal shiftwidth=4

" Typing jk or kj is like ESC
inoremap jk <ESC>
inoremap kj <ESC>

" Leader key stuff
let mapleader=","
map <Leader>p :set paste!<CR>
map <Leader>s <esc>:w<cr>
map <Leader>l :nohls<CR>
map <Leader>c gc
:nnoremap <Leader>q :Bdelete<CR>
map <Leader>w :FixWhitespace<CR>

" remapping gt & gT to switch between buffers instead of tabs if no tabs is open
if tabpagenr("$") > 1
  unmap gt
  unmap gT
else
  if v:count == 0
    map gt :bn<cr>
    map gT :bp<cr>
  else
    map gt :<C-U>exec "b" . v:count<cr>
  endif
endif

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" Easy search & replace
nnoremap sr :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap SR :%s/\<<C-r>=expand('<cword>')<CR>\>/

" Jumps to last known cursor position when buffer is re-opened
function! s:JumpToLastKnownCursorPosition()
  if line("'\"") <= 1 | return | endif
  if line("'\"") > line("$") | return | endif
  " Ignore git commit messages and git rebase scripts
  if expand("%") =~# '\(^\|/\)\.git/' | return | endif
  execute "normal! g`\"" |
endfunction
autocmd BufReadPost * call s:JumpToLastKnownCursorPosition()

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

" netrw options
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10
augroup ProjectDrawer
  autocmd!
    autocmd VimEnter * :Lexplore | wincmd p
    augroup END
aug netrw_close
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

" Let's get jsx syntax in .js files too
let g:jsx_ext_required = 0

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme='one'

" vim-bufferline
let g:bufferline_echo = 0

" vim-sneak
let g:sneak#label = 1
map <Leader>f <Plug>Sneak_s
map <Leader>F <Plug>Sneak_S

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
