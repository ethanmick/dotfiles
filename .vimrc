set nocompatible " be iMproved, required for vundle
filetype off "required for vundle

" Vundle Setup and Plugins happens first, and all configuration happens after
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
Plugin 'Quramy/tsuquyomi'
Plugin 'sbdchd/neoformat'
Plugin 'cespare/vim-toml'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set ruler
set autoread
syntax on

set clipboard=unnamed
set belloff=all
set smartcase
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

" Place all swap files in a central location to not pollute directories
set directory^=$HOME/.vim/tmp//

" Map colon to semicolon, so we don't need to press shift all the time.
nmap ; :
noremap ;; ; 

" Rocking Line Numbers. Setting both gives you relative numbers from your
" cursor, the absolute line number on your line, and absolute line numbers on
" files that don't have focus.
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" Correct Status Bar
set laststatus=2
let g:lightline = { 'colorscheme': 'palenight' }

" Make Go Vim Awesome!
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1

" Format JS/TS/JSX/TSX
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.scss Neoformat


" Use Theme
set background=dark
colorscheme palenight
if (has("termguicolors"))
	set termguicolors
endif

" Make fzf easy to access
nmap <C-p> :FZF<CR>

" easier navigation
"
" this is hacky but some terminals send <BS> instead of <C-h> when ctrl-h is
" pressed. since i don't really use <BS> in normal mode, this seems like a
" reasonable thing for it to do.
nmap <BS> <C-w>h
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-q> <C-w>q

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
