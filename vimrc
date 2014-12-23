" Everybody wants syntax on!
syntax on

" For 256 colors
set t_Co=256

" Colorscheme
colorscheme hybrid

" Having NERDtree always open
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p

" Basic stuff
set autoindent
set background=dark
set mouse=a
set ignorecase
set smartcase
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smarttab
set hlsearch
set incsearch
set noerrorbells
set number
set hidden
set history=100
set scrolloff=5
set wildmenu
set backspace=indent,eol,start
set laststatus=2
set visualbell
set t_vb=
set t_ut=
set pastetoggle=<F4>
set gdefault

" backups and swap are annoying so let's put it in a directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

filetype plugin on
filetype indent plugin on

" Typing jk or kj is like ESC  
inoremap jk <ESC>
inoremap kj <ESC>

" Some languages only want 2 characters tab
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType r setlocal shiftwidth=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType html setlocal shiftwidth=2

" Disable arrow keys
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" For vim-latexsuite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Change leader key from \ to ,
let mapleader=","

" vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" vim-bufferline
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" vim-airline
let g:airline_powerline_fonts = 1

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

" Quick save
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

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

" Re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" Map ,q to vim-bbye extension
:nnoremap <Leader>q :Bdelete<CR>

" Relativenumber treats the current line as line 0 and is helpful for motions
if exists('+relativenumber')
  set relativenumber
end
" Setting number after Relativenumber replaces the '0' with the true number
set number
