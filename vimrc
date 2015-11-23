" Contact: nipeko@gmail.com
" Available From: https://github.com/nipeko/dotvim
"
" The following urls are some of my inspirational sources for setting up
" this vimrc. They are worthwhile a look (use gx to open url under cursor in vim)
"
" http://github.com/lstor/vimfiles-lstor
" https://github.com/amix/vimrc
" http://www.8t8.us/vim/vim.html
" http://dougblack.io/words/a-good-vimrc.html

" Preamble {{{

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible


if has("autocmd")
    " open quickfix window after make
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    autocmd BufRead,BufNewFile *.clj set filetype=clojure "recognize clj files

    " strip trailing whitespace when writing to buffer
    autocmd BufWritePre  *.{cpp,h,c,etc,clj,tex,py}  call StripTrailingWhite()

    augroup gitcommit_filetype
        autocmd!
        autocmd FileType gitcommit :set cc=51
    augroup end

endif
"}}}
" General Settings {{{
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

set list listchars=tab:»·,trail:·

let g:jah_Quickfix_Win_Height=10 "set height of quickfix window
"}}}
" Plugins {{{
let g:plug_timeout=1000
call plug#begin('~/.vim/plugged')

" Github repos
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'kien/rainbow_parentheses.vim'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'

" Automatic closing of parens, quotes etc.
Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdtree'

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

" Official repo
" Plug 'elmcast/elm-vim' 

" Bugfix repo
Plug 'ggVGc/elm-vim', {'branch': 'fix_elm_oracle_elmstuff_dir'}

call plug#end()
"}}}
" Plugin Settings {{{

"""""""""""""""""""""""""""""""
" => Tern
"""""""""""""""""""""""""""""""
let g:tern_show_argument_hints=1
let g:tern_show_signature_in_pum=1
" set noshowmode

"""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""
nmap <Leader>g :Gst<CR>

"""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
set wildignore=*/node_modules/*
nmap <C-e> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""
nmap <C-h> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""
" => Emmet
"""""""""""""""""""""""""""""""
" let g:user_emmet_leader_key = '<c-s>'
let g:use_emmet_complete_tag = 1


"""""""""""""""""""""""""""""""
" => RainbowParenthesis
"""""""""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"""""""""""""""""""""""""""""""
" => Paredit
"""""""""""""""""""""""""""""""
let g:paredit_electric_return=1
let g:paredit_smart_jump=1

"""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_branch = '⎇  '


"""""""""""""""""""""""""""""""
" => UltiSnip
"
"""""""""""""""""""""""""""""""

" This plugins conflicts with ycm when using tab
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=0 " Error window only autoclose
let g:syntastic_check_on_wq=0 " Skip syntax check on :wq, :x and :ZZ
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers = ['eslint']

"""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt=1
let g:ycm_confirm_extrac_conf=0
set completeopt-=preview

"""""""""""""""""""""""""""""""
" => Ag
"""""""""""""""""""""""""""""""
nnoremap <C-g> :Ag 

"}}}
" Statusline {{{
set ruler        " statusline
set laststatus=2 " statusline is always enabled
set showcmd      " display keystrokes in statusline

set statusline=

" left side
set statusline+=%<%F                     " full path,
set statusline+=%m%r%w                   " modified? read only?
set statusline+=%{fugitive#statusline()} " git branch

" middle
set statusline+=%=

"right side
set statusline+=\ %l\:%c\                      " line:column
set statusline+=
set statusline+=[%{&ff}]                      " file format
set statusline+=[%{strlen(&fenc)?&fenc:&enc}] " encoding
"}}}
" Folding {{{
set nofoldenable " disable folding
set modelines=1
"}}}
" Colors {{{
set t_Co=256
set background=dark

" colorscheme solarized
colorscheme Tomorrow-Night
" colorscheme desert

" }}}
" Highlighting {{{
syntax on                       " use syntax highlighting
set hlsearch                    " highlight search
set nocursorcolumn              " no highligted cursor column
set cursorline                  " highlight the line we are on

" Higlight todo, fixme and xxx
highlight TODOS cterm=bold term=bold ctermbg=green ctermfg=black
highlight Search cterm=bold term=bold ctermbg=yellow ctermfg=black
highlight IncSearch cterm=bold term=bold ctermbg=yellow ctermfg=black
match TODOS /TODO\|FIXME\|XXX/
"}}}
" Keyboard mappings {{{
let mapleader=','

" Why haven't I thought about this before?
nnoremap :Q :q
nnoremap :W :w
nnoremap :X :x
nnoremap :Vs :vs
nnoremap :S :s

" Remove ^M from dos files
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle highlighting
nnoremap <silent><leader>w :nohls<cr>

" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Edit vimrc
nmap <Leader>V :edit $MYVIMRC<CR>
nmap <Leader>v :source $MYVIMRC<CR>

" switch cwd to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"}}}
" System specifics {{{

" Toggle pastemode if in terminal
if !has("gui_running")
    nnoremap <Leader>p :set invpaste paste?<CR>
    set pastetoggle=<Leader>p
    set showmode
endif

" Remove annoying gui elements in graphical vim
if has("gui_running")
    set guioptions =-m
    set guioptions =-T
    set guioptions =-r
    set vb "disable bell
endif

if has("win32")
    "Windows options here
elseif has("mac")
    "mac options here
    if has("gui_running")
    "mvim options here
    set guifont=Inconsolata:h18
    colorscheme jellybeans
    endif
elseif has("unix")
    if !has("gui_running")
    endif
    "Unix options here
endif
"}}}
" Functions {{{
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

" aligns a character when inserted, courtesy of the Pope
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
"}}}

" vim:foldmethod=marker:foldlevel:foldenable
