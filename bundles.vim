"""""""""""""""""""""""""""""""
"                             "
"           VUNDLE            "
"                             "
"""""""""""""""""""""""""""""""
"See: http://gmarik.info/blog/2011/05/17/chicken-or-egg-dilemma

" Required stuff first!
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Github repos
Bundle '/sheerun/vim-polyglot.git'
Bundle '/sheerun/vim-polyglot.git'
Bundle 'jiangmiao/auto-pairs.git'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-bufferline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mattn/emmet-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'martintreurnicht/vim-gradle'
Bundle 'marijnh/tern_for_vim'
Bundle 'wting/rust.vim'
Bundle 'sjl/gundo.vim.git'
Bundle 'plasticboy/vim-markdown'

" Go specific bundles
Bundle 'bradfitz/goimports.git'
Bundle 'dgryski/vim-godef.git'
Bundle 'Blackrush/vim-gocode.git'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'paredit.vim'
Bundle 'groovy.vim'
Bundle 'Gundo'

filetype plugin indent on
