filetype plugin indent on       " use file specific plugins and indents (required for vundle)
filetype plugin on
set autoindent                  " indenting
set smartindent                 " indenting
set ignorecase                  " case insensitive
set incsearch                   " search while typing
set noerrorbells                " no noise, please
set noexrc                      " use local version of .(g)vimrc, .exrc
set visualbell                " blink on error
set smarttab                    " <TAB> inserts indentation according to 'shiftwidth'
set expandtab                   " convert tabs to spaces
set shiftwidth=4                " Affects automatic indenting and pressing <<,>> or ==
set softtabstop=4               " Affects what happens when <TAB> is pressed
set textwidth=72                " set wordwrap to 72 characters
set virtualedit=all             " let the cursor stray beyond defined text
set showmode                    " shows current mode in bottom right corner
set nobackup                    " turn backup off
set nowb
set noswapfile
set mouse=a                     " enable mouse
set tags+=tags;/;/usr/include/  " search recursively upwards for tagfile
set shell=/bin/zsh              " set default shell to zsh
set bs=indent,eol,start         " fix misbehaving backspace
set tildeop                     " use tilde as an operator (i.e 5~)
set encoding=utf-8
set nowrap                      " no line wrap
set nu

" set list listchars=tab:»·,
set list listchars=trail:·
let g:jah_Quickfix_Win_Height=10 "set height of quickfix window
