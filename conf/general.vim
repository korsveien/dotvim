filetype plugin indent on       " use file specific plugins and indents (required for vundle)
filetype plugin on

set autoindent                  " indenting
set smartindent                 " indenting
set ignorecase                  " case insensitive
set incsearch                   " search while typing
set noerrorbells                " no noise, please
set noexrc                      " use local version of .(g)vimrc, .exrc
set visualbell                  " blink on error

set expandtab                   " convert tabs to spaces
set shiftwidth=4                " Affects automatic indenting and pressing <<,>> or ==
set softtabstop=4               " Number of spaces in TAB when editing
set tabstop=4                   " Number of visual spaces per TAB

set textwidth=72                " set wordwrap to 72 characters
set virtualedit=all             " let the cursor stray beyond defined text
set showmode                    " shows current mode in bottom right corner

" turn backup off
set nobackup
set nowb
set noswapfile

set mouse=a                     " enable mouse
set tags+=tags;/;/usr/include/  " search recursively upwards for tagfile
set shell=/bin/zsh              " set default shell to zsh
set bs=indent,eol,start         " fix misbehaving backspace
set tildeop                     " use tilde as an operator (i.e 5~)
set encoding=utf-8
set nowrap                      " no line wrap
set nu                          " show line numbers

set ruler        " statusline
set laststatus=2 " statusline is always enabled
set showcmd      " display keystrokes in statusline

set list listchars=tab:»·
set list listchars=trail:·
let g:jah_Quickfix_Win_Height=10 "set height of quickfix window
