-- Set leader key first
vim.g.mapleader = ","

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Fix for LaTeXtoUnicode#Refresh error from julia-vim plugin
-- We've commented out the problematic autocommands in the julia-vim plugin
vim.g.latex_to_unicode_disable = 1
vim.g.julia_disable_latex_to_unicode = 1

-- Load plugins
require("lazy").setup("plugins")

-- Set options
vim.opt.background = "dark"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.errorbells = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.scrolloff = 5
vim.opt.visualbell = true
vim.opt.gdefault = true
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.fixendofline = false
vim.opt.updatetime = 100
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.termguicolors = true

-- Filetype specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.shiftwidth = 4
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "julia",
  callback = function()
    vim.opt_local.shiftwidth = 4
  end
})

-- Key mappings
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('n', '<Leader>p', ':set paste!<CR>')
vim.keymap.set('n', '<Leader>s', '<esc>:w<cr>')
vim.keymap.set('n', '<Leader>l', ':nohls<CR>')
vim.keymap.set('n', '<Leader>c', 'gc')
vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
vim.keymap.set('n', '<Leader>w', ':FixWhitespace<CR>')

-- Buffer navigation mappings
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.fn.tabpagenr('$') > 1 then
      -- Don't remap if tabs are open
      return
    end

    vim.keymap.set('n', 'gt', ':bn<cr>', { buffer = true })
    vim.keymap.set('n', 'gT', ':bp<cr>', { buffer = true })
  end
})

-- Visual mode mappings
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Search and replace mappings
vim.keymap.set('n', 'sr', "'<,'>s/\\<<C-r>=expand('<cword>')<CR>\\>/")
vim.keymap.set('n', 'SR', "%s/\\<<C-r>=expand('<cword>')<CR>\\>/")

-- Jump to last known cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    if vim.fn.line("'\"") <= 1 or vim.fn.line("'\"") > vim.fn.line("$") then
      return
    end

    -- Ignore git commit messages and git rebase scripts
    if vim.fn.expand("%"):match('^".git/') then
      return
    end

    vim.cmd('normal! g`"')
  end
})

-- Zoom toggle function
local function ZoomToggle()
  if vim.b.zoomed and vim.b.zoomed == true then
    vim.cmd(vim.b.zoom_winrestcmd)
    vim.b.zoomed = false
  else
    vim.b.zoom_winrestcmd = vim.fn.winrestcmd()
    vim.cmd('resize')
    vim.cmd('vertical resize')
    vim.b.zoomed = true
  end
end

vim.api.nvim_create_user_command('ZoomToggle', ZoomToggle, {})
vim.keymap.set('n', '<Leader>z', ':ZoomToggle<CR>')

-- netrw options
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 10

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd('Lexplore')
    vim.cmd('wincmd p')
  end
})

vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.bo.filetype == "netrw" then
      vim.cmd('q')
    end
  end
})

-- Plugin specific configurations
vim.g.jsx_ext_required = 0
vim.g.airline_powerline_fonts = 1
vim.g.airline_extensions_hunks_non_zero_only = 1
vim.g.airline_theme = 'one'
vim.g.bufferline_echo = 0
vim.g.sneak_label = 1
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}

-- Set colorscheme
vim.cmd('colorscheme one')
