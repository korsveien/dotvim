 " following urls are some of my inspirational sources for setting up
" this vimrc. They are worthwhile a look (use gx to open url under cursor in vim)
"
" http://github.com/lstor/vimfiles-lstor
" https://github.com/amix/vimrc
" http://www.8t8.us/vim/vim.html
" http://dougblack.io/words/a-good-vimrc.html

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible


"""""""""""""""""""""""""""""""
" => Preamble
"""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""
source $HOME/.vim/plugins.vim


"""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""
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
set nofoldenable " disable folding
set modelines=1


"""""""""""""""""""""""""""""""
" => Colors and highlighting 
"""""""""""""""""""""""""""""""
set t_Co=256

" colorscheme solarized
" colorscheme jellybeans
" colorscheme Tomorrow-Night
colorscheme onedark
" colorscheme desert

syntax on                       " use syntax highlighting
set hlsearch                    " highlight search
set nocursorcolumn              " no highligted cursor column
set cursorline                  " highlight the line we are on

" Higlight todo, fixme and xxx
highlight TODOS cterm=bold term=bold ctermbg=green ctermfg=black
highlight Search cterm=bold term=bold ctermbg=yellow ctermfg=black
highlight IncSearch cterm=bold term=bold ctermbg=yellow ctermfg=black
match TODOS /TODO\|FIXME\|XXX/


"""""""""""""""""""""""""""""""
" => Keyboard mappings
"""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""
" => System specifics
"""""""""""""""""""""""""""""""
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
        set guifont=Inconsolata\ 13
    endif
    "Unix options here
endif


"""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""
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
