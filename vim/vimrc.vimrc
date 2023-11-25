" Init Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'cespare/vim-toml'
call vundle#end()

filetype plugin on

" indentation
set expandtab
set autoindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set cindent

" line number
set number
set ruler

" syntax highlighting
syntax on

colorscheme desert

" text highlights
" set listchars=tab:·\ ,trail:-
" set list
set hlsearch

" mouse
set mouse=n

" vim command autocomplete
set wildmenu

" Ctrl+S to save
nmap <c-s> :w<CR>
imap <c-s> <c-o>:w<CR>

" F2 to toggle paste
set pastetoggle=<F2>

" language-specific configs
" indentation (yaml)
au FileType yaml set tabstop=4 shiftwidth=4 expandtab

" .bash_aliases highlight
au BufNewFile,BufRead .bash_aliases call SetFileTypeSH("bash")
