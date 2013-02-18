"""""""""""""""""""""""""""""""
"                             "
"           ABOUT             "
"                             "
"""""""""""""""""""""""""""""""
"Author: Nils Peder Korsveien 
"Url:    https://www.github.com/nilspk/dotvim

"Sources: - http://amix.dk/vim/vimrc.html
"         - http://folk.uio.no/larsstor/.vimrc
"         - http://www.8t8.us/vim/vim.html

"""""""""""""""""""""""""""""""
"                             "
"           PREAMBLE          "
"                             "
"""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible

if has("autocmd")
    " Source the vimrc file after saving it
    " autocmd bufwritepost .vimrc source $MYVIMRC

    " Set syntax highligthing for arduino
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    " au InsertEnter * set cursorcolumn
    " au InsertLeave * set nocursorcolumn
    autocmd BufEnter * highlight OverLenght cterm=bold term=bold ctermbg=red ctermfg=black
    autocmd BufEnter * match OverLenght /\%80v.*/

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
set ruler                       " status bar
set nofoldenable                " no automatic folding please
set showmode                    " shows current mode in bottom right corner
set laststatus=2                " status line is always enabled
set nowrap                      " no line wrap
set nobackup                    " turn backup off
set nowb 
set noswapfile                  
set mouse=a                     " enable mouse
set tags+=tags;/;/usr/include/  " search recursively upwards for tagfile
set shell=/bin/zsh              " set default shell to zsh
set bs=indent,eol,start         " fix misbehaving backspace
set tildeop                     " use tilde as an operator (i.e 5~)
set encoding=utf-8
set rnu                         " use relative line numbering

let g:jah_Quickfix_Win_Height=10 "set height of quickfix window
set statusline=%<%F\ %y\ %h%w%m%r\ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %P

"""""""""""""""""""""""""""""""
" => Cursor
""""""""""""""""""""""""""""""
let &t_SI = "\033]50;CursorShape=1\007"
let &t_EI = "\033]50;CursorShape=0\007"  

"""""""""""""""""""""""""""""""
" => Colors
""""""""""""""""""""""""""""""
set t_Co=256                         

" colorscheme zenburn
" let g:zenburn_high_contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_unfified_CursorColumn = 1

colorscheme railscasts
" colorscheme ir_black           
" colorscheme wombat256           
" colorscheme molokai
" colorscheme solarized
" colorscheme tango2
" colorscheme peaksea
" colorscheme desert




"""""""""""""""""""""""""""""""
"                             "
"      GENERAL MAPPINGS       "
"                             "
"""""""""""""""""""""""""""""""
let mapleader=','

" Function keys
map <F1> :BuffergatorToggle<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F5> :e %<CR>
map <F9> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" For easier window navigation
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" For easier buffer navigation
nmap <C-j> :bnext<cr>
nmap <C-k> :bprev<cr>

" For those pesky times when caps lock hasn't been mapped
inoremap jk <esc>

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
nmap <Leader>hi :nohls<Enter>
nmap <Leader>Hi :set hls<Enter>

"Scroll with space 
nmap <Space> 10j
nmap <Backspace> 10k
vmap <Space> 10j
vmap <Backspace> 10k

" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Edit .vimrc
if has("win32")
    " Remember to set $HOME as it is not set by default
    nmap <Leader>V :edit $HOME\Dropbox\dotvim\vimrc<CR>
    nmap <Leader>v :source $MYVIMRC<CR>
endif

if has("unix")
    nmap <Leader>V :edit $MYVIMRC<CR> 
    nmap <Leader>v :source $MYVIMRC<CR>
endif

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
" => SimpleFold
"""""""""""""""""""""""""""""""
map <unique> <silent> <Leader>z <Plug>SimpleFold_Foldsearch


"""""""""""""""""""""""""""""""
" => Vim-Ruby
"""""""""""""""""""""""""""""""
" balance ruby blocks with 'end'
" if !exists( "*RubyEndToken" )
" 
"     function RubyEndToken()
"         let current_line = getline( '.' )
"         let braces_at_end = '{\s*|\(,\|\s\|\w*|\s*\)\?$'
"         let stuff_without_do = '^\s*class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def'
"         let with_do = '^\.*do\(\s*|\(,\|\s\|\w*|\s*\)\?$\)*'
" 
"         if match(current_line, braces_at_end) >= 0
"             return "\<CR>}\<C-O>O"
"         elseif match(current_line, stuff_without_do) >= 0
"             return "\<CR>end\<C-O>O"
"         elseif match(current_line, with_do) >= 0
"             return "\<CR>end\<C-O>O"
"         else
"             return "\<CR>"
"         endif
"     endfunction
" endif
" imap <buffer> <CR> <C-R>=RubyEndToken()<CR>


"""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'


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
let g:buffergator_viewport_split_policy = "B"
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
nnoremap <silent> <F11> :CommandT<CR>
nnoremap <silent> <F12> :CommandTBuffer<CR>
noremap <leader>y :CommandTFlush<cr>


"""""""""""""""""""""""""""""""
" => Gist
"""""""""""""""""""""""""""""""
"FIXME: fix visual selection posting
let g:gist_clip_command = 'putclip' "others (cygwin?)
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
vmap <leader>g :'<,'>Gist<CR>
map <leader>g :Gist<CR>
map <leader>gp :Gist -p<CR>
map <leader>gl :Gist -l<CR>
map <leader>gd :Gist -d<CR>                                                         


"""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""
" Must be called before filetype detection
call pathogen#helptags()

if has("win32")                                        
    call pathogen#runtime_prepend_subdirectories(expand('c:\Users\nilspk\Dropbox\dotvim\bundle'))
endif

if has("unix")
    call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
endif


"""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""
" set supertab to use the context (ie programming language) we are in
let g:SuperTabDefaultCompletionType = "context"


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
let g:tagbar_width = 60
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
" let g:Powerline_symbols = 'unicode'

if has("win32")
    let g:Powerline_symbols = 'compatible'
endif
if has("unix")
    let g:Powerline_symbols = 'fancy'
endif


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
endif

if has("win32")
    "Windows options here
    set gfn=Consolas:h10 "change default font
else
    if has("unix")
        "let s:uname = system("uname")
        "if s:uname == "Darwin\n" 
            "Mac options here
            "let g:gist_clip_command = 'pbcopy' "Mac specific for gist plugin

            "if has("gui_macvim")  "settings for macvim
            "    set lines=35 columns=110
                "set vb             "remove annoying sound in macvim
                "set guioptions=-m  "remove menu bar
                "set gfn=Monaco:h10 "change default font
                " set gfn=Inconsolata:h11 "change default font
                "remap K to use conqueterm
                ":map K :<C-U>call ConqueMan()<CR> 
                ":ounmap K
            "endif
        "endif
        
        
        "set gfn=Monaco\ for\ Powerline:h12 "change default font
       " set gfn=CONSOLA-Powerline:h11
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
    autocmd FileType    objc,c,cpp,java,php  inoremap {<CR>  <CR>{<CR>}<Esc>O
    autocmd FileType    c               set syntax=c.doxygen
    autocmd FileType    cpp             set syntax=cpp.doxygen

    " Compiling LaTeX
    autocmd FileType    tex             map <Leader>c :w<CR>:!pdflatex %<CR> :!biber %<CR> :!pdflatex %<CR>
    autocmd FileType    tex             map <Leader>r :!open %<.pdf&<CR>

    " Running Go
    autocmd FileType    go              map <Leader>r :!go run %<CR>

    " Running scheme
    autocmd filetype scheme map <leader>r call Send_To_Screen(@r)

  augroup end
endif




"""""""""""""""""""""""""""""""
"                             "
"           FUNCTIONS         "
"                             "
"""""""""""""""""""""""""""""""

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

" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

map <leader>q :QFix<CR>

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()
nnoremap <leader>x :Hexmode<CR>
inoremap <leader>x <Esc>:Hexmode<CR>
vnoremap <leader>x :<C-U>Hexmode<CR>

" re-implements the functionality of the normal-mode K command using ConqueTerm
" Source: http://superuser.com/a/290113
:function! ConqueMan()
    let cmd = &keywordprg . ' '
    if cmd ==# 'man ' || cmd ==# 'man -s '
        if v:count > 0
            let cmd .= v:count . ' '
        else
            let cmd = 'man '
        endif
    endif
    let cmd .= expand('<cword>')
    execute 'ConqueTermSplit' cmd
:endfunction


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

" goes to definition under cursor
function! GotoDefinition()
  let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
endfunction
map <F7> :call GotoDefinition()<CR>
imap <F7> <c-o>:call GotoDefinition()<CR>
            
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
