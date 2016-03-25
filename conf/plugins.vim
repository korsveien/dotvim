let g:plug_timeout=1000
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'

Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

Plug 'Valloric/YouCompleteMe'
Plug 'benekastah/neomake'

" Automatic closing of parens, quotes etc.
Plug 'Raimondi/delimitMate'

" Search your code
Plug 'rking/ag.vim'

" JS
Plug 'marijnh/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" omnicomplete and syntax for html5
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" css color preview
Plug 'gorodinskiy/vim-coloresque'

" Color themes
Plug 'flazz/vim-colorschemes'

" Elm
Plug 'elmcast/elm-vim'

" Golang
Plug 'fatih/vim-go'

" Live editing of markdown and html/css
Plug 'shime/vim-livedown'
Plug 'jaxbot/browserlink.vim'

call plug#end()
