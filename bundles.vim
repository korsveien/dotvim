"""""""""""""""""""""""""""""""
"                             "
"           VUNDLE            "
"                             "
"""""""""""""""""""""""""""""""
" See: http://gmarik.info/blog/2011/05/17/chicken-or-egg-dilemma

" Required stuff first!
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Github repos
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'martintreurnicht/vim-gradle'
Plugin 'wting/rust.vim'
Plugin 'sjl/gundo.vim.git'
Plugin 'plasticboy/vim-markdown'

" C-specific

" Frontend stuff
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-Javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'

" Color themes
Plugin 'flazz/vim-colorschemes'

" vim-scripts repos
Plugin 'a.vim'
Plugin 'paredit.vim'
Plugin 'groovy.vim'
Plugin 'Gundo'

call vundle#end()
filetype plugin indent on
