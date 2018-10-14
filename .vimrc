set nocompatible " be iMproved, required for vundle
filetype off "required for vundle

set ruler
set autoread
syntax on

set clipboard=unnamed
set belloff=all

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

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Correct Status Bar
set laststatus=2
let g:lightline = { 'colorscheme': 'palenight' }

" Make Go Vim Awesome!
let g:go_fmt_command = "goimports"

" Use Theme
set background=dark
colorscheme palenight
if (has("termguicolors"))
	set termguicolors
endif

" Make fzf easy to access
nmap <C-p> :FZF<CR>
