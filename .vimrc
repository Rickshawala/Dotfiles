syntax on
set number
set showcmd
set incsearch
filetype indent on
set wildmenu
set showmatch
" set termguicolors
"colorscheme cyberpunk-neon
colorscheme levuaska


"vundle stuff
set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plugin 'ap/vim-css-color'                            " Color previews for CSS
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
Plugin 'francoiscabrol/ranger.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'farmergreg/vim-lastplace'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
