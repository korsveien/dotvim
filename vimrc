 " following urls are some of my inspirational sources for setting up
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
set visualbell                  " blink on error
set visualbell t_vb=
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
set rnu

set list listchars=tab:»·,trail:·

let g:jah_Quickfix_Win_Height=10 "set height of quickfix window
"}}}
" Plugins {{{
let g:plug_timeout=1000
call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""
" => AutoComplete
"""""""""""""""""""""""""""""""
Plug 'sheerun/vim-polyglot'

"""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

"""""""""""""""""""""""""""""""
" => Elm
"""""""""""""""""""""""""""""""
Plug 'elmcast/elm-vim'
Plug 'bitterjug/vim-tagbar-ctags-elm'

let g:polyglot_disabled = ['elm']
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "make/out.js"
let g:elm_make_show_warnings = 0
" let g:elm_browser_command = ""
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

"""""""""""""""""""""""""""""""
" => Formatting files
"""""""""""""""""""""""""""""""
Plug 'sbdchd/neoformat'

autocmd BufWritePre *.js Neoformat

"""""""""""""""""""""""""""""""
" => Linting, errros and warnings
"""""""""""""""""""""""""""""""
Plug 'w0rp/ale'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"


"""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""
Plug 'SirVer/UltiSnips'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"


"""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""
Plug 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'r'

set wildignore+=**/node_modules/**
set wildignore+=**/elm-stuff/**
set wildignore+=**/bin/**
set wildignore+=**/pkg/**
set wildignore+=**/build/**
set wildignore+=*.o,*.obj,*.a,*.iml


"""""""""""""""""""""""""""""""
" => Emmet
"""""""""""""""""""""""""""""""
Plug 'mattn/emmet-vim'
let g:use_emmet_complete_tag = 1
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


"""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_section_z='%{fugitive#head()}'

" Enable/Disable buffer display on top bar
let g:airline#extensions#tabline#enabled = 0

" Displays all buffers when only one tab is open
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1


"""""""""""""""""""""""""""""""
" => Searching code
"""""""""""""""""""""""""""""""
Plug 'rking/ag.vim'
nnoremap <leader>a :Ag

"""""""""""""""""""""""""""""""
" => Sublimeish features
"""""""""""""""""""""""""""""""
Plug 'terryma/vim-multiple-cursors'

"""""""""""""""""""""""""""""""
" => Tim Pope essentials
"""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

nmap <Leader>g :Gstatus<CR>

Plug 'junegunn/gv.vim'

"""""""""""""""""""""""""""""""
" => NERDTree + Tagbar
"""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

nnoremap <silent> <c-h> :NERDTreeToggle<CR>
nnoremap <silent> <right> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""
" => Misc.
"""""""""""""""""""""""""""""""
" Automatic closing of parens, quotes etc.
Plug 'Raimondi/delimitMate'
au FileType vim,html,elm let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Automatically generate tags
Plug 'fntlnz/atags.vim'
let g:atags_build_commands_list = [
    \"ctags --exclude=node_modules -R -f tags.tmp",
    \"awk 'length($0) < 400' tags.tmp > tags",
    \"rm tags.tmp"
    \]
" Generate tags on each file write
" autocmd BufWritePost * call atags#generate()

map <Leader>t :call atags#generate()<cr>

Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""
" => Color themes
"""""""""""""""""""""""""""""""
" Color themes
Plug 'flazz/vim-colorschemes'
let g:jellybeans_overrides = {
\		'Search': { 'guifg': '303030', 'guibg': 'f0f000',
\				    'ctermfg': 'Black', 'ctermbg': 'Yellow',
\			        'attr': 'bold' }
\}

call plug#end()
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

" colorscheme solarized
" colorscheme jellybeans
" colorscheme Tomorrow-Night
colorscheme onedark
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

" Toggle dark and light background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

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
        set macligatures
        set guifont=Fira\ Code:h14
    endif
elseif has("unix")
    if has("gui_running")
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
