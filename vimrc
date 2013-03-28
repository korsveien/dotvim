"""""""""""""""""""""""""""""""
"                             "
"           ABOUT             "
"                             "
"""""""""""""""""""""""""""""""
"Author: Nils Peder Korsveien 
"Url:    https://www.github.com/nilspk/dotvim

"References: - http://amix.dk/vim/vimrc.html
"            - http://folk.uio.no/larsstor/.vimrc
"            - http://www.8t8.us/vim/vim.html


"FIXME Command-T split open does not work



"""""""""""""""""""""""""""""""
"                             "
"           PREAMBLE          "
"                             "
"""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible

" Must be called before filetype detection
call pathogen#helptags()

if has("autocmd")
    " Source the vimrc file after saving it
    " autocmd bufwritepost .vimrc source $MYVIMRC

    " Set syntax highligthing for arduino
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    " au InsertEnter * set cursorcolumn
    " au InsertLeave * set nocursorcolumn
    " autocmd BufEnter * highlight OverLenght cterm=bold term=bold ctermbg=darkgrey ctermfg=black guibg=#592929
    " autocmd BufEnter * match OverLenght /\%80v.*/
    " autocmd FileType c,cpp,objc,java,ruby,python,clojure,javascript set cc=+9 
    " highlight ColorColumn ctermbg=darkgrey

    " open quickfix window after make
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    autocmd BufRead,BufNewFile *.clj set filetype=clojure "recognize clj files
endif




"""""""""""""""""""""""""""""""
"                             "
"      GENERAL SETTINGS       "
"                             "
"""""""""""""""""""""""""""""""
filetype plugin indent on       " use file specific plugins and indents
set autoindent                  " indenting
set number                      " use line numbers
set rnu                         " use relative line numbering
set smartindent                 " indenting
set ignorecase                  " case insensitive
set incsearch                   " search while typing
set noerrorbells                " no noise, please 
set noexrc                      " use local version of .(g)vimrc, .exrc
set novisualbell                " blink on error
set smarttab                    " <TAB> inserts indentation according to 'shiftwidth'
set expandtab                   " convert tabs to spaces
set shiftwidth=4                " Affects automatic indenting and pressing <<,>> or ==
set softtabstop=4               " Affects what happens when <TAB> is pressed
set textwidth=72                " set wordwrap to 72 characters
set virtualedit=all             " let the cursor stray beyond defined text
set nofoldenable                " no automatic folding please
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

let g:jah_Quickfix_Win_Height=10 "set height of quickfix window

"""""""""""""""""""""""""""""""
" => Statusline options
""""""""""""""""""""""""""""""
set ruler                       " status bar
set laststatus=2                " status line is always enabled
set showcmd                     " display keystrokes in statusline


set statusline=

"left side
set statusline+=[%n] "buffer number
set statusline+=(%{fugitive#statusline()})
set statusline+=%<%F%m%r%w "full path, modified? read only?

set statusline+=%=

"right side
set statusline+=\ %l\/%L\ 
set statusline+=%y "filetype
set statusline+=[%{&ff}] "file format
set statusline+=[%{strlen(&fenc)?&fenc:&enc}] "encoding



"""""""""""""""""""""""""""""""
" => Colors
""""""""""""""""""""""""""""""
set t_Co=256                         

" colorscheme zenburn
" let g:zenburn_high_contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_unfified_CursorColumn = 1

" colorscheme railscasts
" colorscheme ir_black           
" colorscheme wombat256           
" colorscheme molokai
" colorscheme solarized
" colorscheme tango2
" colorscheme peaksea
" colorscheme desert
colorscheme jellybeans




"""""""""""""""""""""""""""""""
"                             "
"      GENERAL MAPPINGS       "
"                             "
"""""""""""""""""""""""""""""""
let mapleader=','

" Why haven't I thought about this before?
nnoremap :W :w
nnoremap :Q :q

" Function keys
map <F5> :e %<CR>
map <F9> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Essential plugin windows
nmap <C-h> :NERDTreeToggle<CR>
nmap <C-l> :TagbarToggle<CR>
nmap <C-k> :BuffergatorToggle<CR>
nmap <C-j> :CommandT<CR>

" For easier buffer navigation
nmap <right> :bnext<cr>
nmap <left> :bprev<cr>
nmap <up> :bnext<cr>
nmap <down> :bprev<cr>


" Fold/unfold JavaDoc
nmap <leader>fj :g/\/\*\*/ foldo<CR>:nohls<CR>
nmap <leader>Fj :g/\/\*\*/ foldc<CR>:nohls<CR>
  
" Substitute on this line
nmap <Leader>s :s//g<Left><Left>

" Substitute all
nmap <Leader>S :%s//gc<Left><Left><Left>

" Substitue visual selection
vmap <Leader>s :s/\%V/g<Left><Left>

" Remove ^M from dos files
nmap <Leader>m :%s/\r\(\n\)/\1/g

" Toggle highlighting
nnoremap <silent><leader>n :nohls<cr>

nnoremap <C-n> :call NumberToggle()<cr>

" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Edit vimrc
nmap <Leader>V :edit $MYVIMRC<CR> 
nmap <Leader>v :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""
" => Higlighting
""""""""""""""""""""""""""""""
syntax on                       " use syntax highlighting
set hlsearch                    " highlight search
set nocursorcolumn              " no highligted cursor column
set cursorline                  " highlight the line we are on
highlight TODOS cterm=bold term=bold ctermbg=green ctermfg=black
highlight Search cterm=bold term=bold ctermbg=yellow ctermfg=black
highlight IncSearch cterm=bold term=bold ctermbg=yellow ctermfg=black
match TODOS /TODO\|FIXME\|XXX/




"""""""""""""""""""""""""""""""
"                             "
"      PLUGIN SETTINGS        "
"                             "
"""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" => UltiSnip
"""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/bundle/ultisnip
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'passive',
                            \'active_filetypes': ['c', 'cpp'],
                            \'passive_filetypes': [] }


"""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_detailed_diagnostics = '<leader>di'


"""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'


"""""""""""""""""""""""""""""""
" => Buffergator
"""""""""""""""""""""""""""""""
let g:buffergator_display_regime = "bufname"
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_sort_regime = "mru"
let g:buffergator_suppress_keymaps = "true"
let g:buffergator_split_size = 10


"""""""""""""""""""""""""""""""
" => TaskList
"""""""""""""""""""""""""""""""
map <leader>T <Plug>TaskList


"""""""""""""""""""""""""""""""
" => Command-T
"""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>y :CommandTFlush<cr>

"""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""
call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))


"""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "left"


"""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""
let g:tagbar_autoclose=0
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1


"""""""""""""""""""""""""""""""
" => LateX
"""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:Tex_BibtexFlavor = 'biber'


"""""""""""""""""""""""""""""""
" => Tabularize
"""""""""""""""""""""""""""""""
nmap <Leader>: :Tabularize /:<Enter>
vmap <Leader>: :Tabularize /:<Enter>
nmap <Leader>; :Tabularize /;<Enter>
vmap <Leader>; :Tabularize /;<Enter>
nmap <Leader># :Tabularize /#<Enter>
vmap <Leader># :Tabularize /#<Enter>
nmap <Leader>/ :Tabularize /\/\/<Enter>
vmap <Leader>/ :Tabularize /\/\/<Enter>
nmap <Leader>= :Tabularize /=<Enter>
vmap <Leader>= :Tabularize /=<Enter>
nmap <Leader>& :Tabularize /&<Enter>
vmap <Leader>& :Tabularize /&<Enter>


"""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""
" => Vimclojure
"""""""""""""""""""""""""""""""
let vimclojure#WantNailgun = 1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let g:vimclojure#ParenRainbow = 1
let vimclojure#SplitPos = "right"
let vimclojure#NailgunServer = "127.0.0.1"
let vimclojure#NailgunPort = "2113"
let g:paredit_mode = 1


"""""""""""""""""""""""""""""""
" => vim-golang
"""""""""""""""""""""""""""""""
set rtp+=$GOROOT/misc/vim





"""""""""""""""""""""""""""""""
"                             "
"      SYSTEM SPECIFICS       "
"                             "
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
else
    if has("unix")
        "Unix options here

        let s:uname = system("uname")
        "FIXME
        " echom(s:uname)
        if s:uname == "Darwin"
            "Mac options here

            colorscheme railscasts       
            "Change cursor to bar in insert mode in iTerm2
            let &t_SI = "\033]50;CursorShape=1\007"
            let &t_EI = "\033]50;CursorShape=0\007"  
        endif
    endif
endif




"""""""""""""""""""""""""""""""
"                             "
"     COMPILING AND EXEC      "
"                             "
"""""""""""""""""""""""""""""""
filetype on
if has("autocmd")
  augroup vimrc_filetype
    autocmd!
    autocmd FileType    python          map <Leader>r :!echo -- Running %; python %<CR>
    autocmd FileType    ruby            map <Leader>r :!echo -- Running %; ruby %<CR>

    " For simple compiling when a makefile isn't feasible
    autocmd FileType    c               map <Leader>c :w<CR>:!echo -- Compiling %; gcc -o %< %<CR>
    autocmd FileType    c               map <Leader>C :w<CR>:!echo -- Compiling %; gcc -g %<CR>
    autocmd FileType    cpp             map <Leader>c :w<CR>:!echo -- Compiling %; g++ -o %< %<CR>
    autocmd FileType    c,cpp           map <Leader>r :!echo -- Running %<; ./%< <CR>

    " Compiling Java
    autocmd FileType    java            map <Leader>c :w<CR>:!echo -- Compiling %; javac %<CR>
    autocmd FileType    java            map <Leader>r :!echo -- Running %<; java %<

    " Syntax-indenting for programming...
    autocmd FileType    objc,c,cpp,java,php  set foldmethod=syntax
    " autocmd FileType    objc,c,cpp,java,php  inoremap {<CR>  <CR>{<CR>}<Esc>O
    autocmd FileType    c               set syntax=c.doxygen
    autocmd FileType    cpp             set syntax=cpp.doxygen

    " Compiling LaTeX
    autocmd FileType    tex             map <Leader>c :w<CR>:!pdflatex %<CR> :!biber %<CR> :!pdflatex %<CR>
    autocmd FileType    tex             map <Leader>r :!open %<.pdf&<CR>

    " Running Go
    autocmd FileType    go              map <Leader>r :!go run %<CR>

    " Running scheme
    autocmd FileType scheme map <leader>r call Send_To_Screen(@r)

  augroup end
endif




"""""""""""""""""""""""""""""""
"                             "
"           FUNCTIONS         "
"                             "
"""""""""""""""""""""""""""""""

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" Javadoc comments (/** and */ pairs) and code sections (marked by {} pairs)
" mark the start and end of folds.
" All other lines simply take the fold level that is going so far.
function! MyFoldLevel( lineNumber )
  let thisLine = getline( a:lineNumber )
  " Don't create fold if entire Javadoc comment or {} pair is on one line.
  if ( thisLine =~ '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
    return '='
  elseif ( thisLine =~ '\%(^\s*/\*\*\s*$\)\|{' )
    return "a1"
  elseif ( thisLine =~ '\%(^\s*\*/\s*$\)\|}' )
    return "s1"
  endif
  return '='
endfunction
setlocal foldexpr=MyFoldLevel(v:lnum)
setlocal foldmethod=expr

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

" Set color scheme according to current time of day.
" Source: http://vim.wikia.com/wiki/Switch_color_schemes
function! HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 11
    let i = 0
  elseif hr <= 17 
    let i = 1
  else
    let i = 2
  endif
  let nowcolors = 'zenburn peaksea wombat256'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
endfunction

" highlights all occurences of word without moving cursor
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <F8> Highlighting()
