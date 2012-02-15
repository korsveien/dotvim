"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ABOUT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Author: Nils Peder Korsveien
"Sources: - http://amix.dk/vim/vimrc.html
"         - http://folk.uio.no/larsstor/.vimrc
"         - http://www.8t8.us/vim/vim.html


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PREAMBLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()
nnoremap <leader>x :Hexmode<CR>
inoremap <leader>x <Esc>:Hexmode<CR>
vnoremap <leader>x :<C-U>Hexmode<CR>


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set textwidth=72                " generate newline at col 79
set virtualedit=all             " let the cursor stray beyond defined text
set ruler                       " status bar
set nofoldenable                " no folding please
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

let g:jah_Quickfix_Win_Height=10 "set height of quickfix window


"""""""""""""""""""""""""""""""
" => Colors
""""""""""""""""""""""""""""""
set t_Co=256                         
" if has("gui_running")
"     call HourColor()              "Set color according to time of day
" else
colorscheme wombat256         " use wombat
" endif


" colorscheme zenburn
" let g:zenburn_high_contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_unfified_CursorColumn = 1

" colorscheme wombat256           
" colorscheme molokai
" colorscheme solarized
" colorscheme tango2
" colorscheme peaksea


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
" => Statusline
""""""""""""""""""""""""""""""
set statusline=%<%F\ %y\ %h%w%m%r\ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %P



"""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>


"""""""""""""""""""""""""""""""
" => Gist
""""""""""""""""""""""""""""""
"FIXME: fix visual selection posting
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
vmap <leader>g :'<,'>Gist<CR>
map <leader>g :Gist<CR>
map <leader>gp :Gist -p<CR>
map <leader>gl :Gist -l<CR>
map <leader>gd :Gist -d<CR>


"""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""
" Must be called before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""
" set supertab to use the context (ie programming language) we are in
let g:SuperTabDefaultCompletionType = "context"

"""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40

"""""""""""""""""""""""""""""""
" => WinManager
""""""""""""""""""""""""""""""
map <c-w><c-t> :WMToggle<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>

"""""""""""""""""""""""""""""""
" => Cscope
""""""""""""""""""""""""""""""
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    " set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  
endif

"""""""""""""""""""""""""""""""
" => Taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='/local/bin/ctags'
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compact_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Process_Files_Always = 1

"""""""""""""""""""""""""""""""
" => LateX
""""""""""""""""""""""""""""""
" LaTeX specifics
let g:tex_flavor='latex'


"""""""""""""""""""""""""""""""
" => BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerHorzSize=10
let g:bufExplorerSplitBelow=1

"""""""""""""""""""""""""""""""
" => MiniBufExplorer
""""""""""""""""""""""""""""""
let g:miniBufExplSplitBelow =0
let g:miniBufExplModSelTarget=1

"""""""""""""""""""""""""""""""
" => Tabularize
""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""
" => Tasklist
""""""""""""""""""""""""""""""
map <Leader>t <Plug>TaskList



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Works like gangbusters on norwegian keyboard with US as language
let mapleader= "§"

" Open ctags definition i vertical split window
map <C-\> :30sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Function keys
map <F1> :25split %<.h<CR><C-W>j
map <F2> :BufExplorer<CR>
map <F3> :TlistToggle<CR>
map <F4> :QFix<CR>

" For easier making comment boxes
abbr #b /************************************************************
abbr #e <space>************************************************************/

" Fold/unfold JavaDoc
nmap <leader>fj :g/\/\*\*/ foldo<CR>:nohls<CR>
nmap <leader>Fj :g/\/\*\*/ foldc<CR>:nohls<CR>
  
" Substitute on this line
nmap <Leader>s :s///g<Left><Left><Left>

" Substitute all
nmap <Leader>S :%s///gc<Left><Left><Left><Left>

" Substitue visual selection
vmap <Leader>s :s/\%V//g<Left><Left><Left>

" Toggle highlighting
nmap <Leader>w :nohls<Enter>
nmap <Leader>W :set hls<Enter>

" Navigate windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"echo the truth 
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Up> :cp<CR>
nnoremap <Down> :cn<CR>

"Scroll with space 
nmap <Space> 10j
nmap <Backspace> 10k
vmap <Space> 10j
vmap <Backspace> 10k


" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Insert <count> line over/under current line
nmap <Leader>O [<Space>
nmap <Leader>o ]<Space>

" Edit .vimrc
nmap <Leader>V :edit $MYVIMRC<CR> 
nmap <Leader>v :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SYSTEM SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle pastemode if in terminal
if !has("gui_running")
    nnoremap <Leader>p :set invpaste paste?<CR>
    set pastetoggle=<Leader>p
    set showmode
endif

if has("win32")
    "Windows options here
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n" 
            "Mac options here
            let g:gist_clip_command = 'pbcopy' "Mac specific for gist plugin

            if has("gui_macvim")  "settings for macvim
                set lines=35 columns=110
                set vb             "remove annoying sound in macvim
                set guioptions=-m  "remove menu bar
                set gfn=Monaco:h10 "change default font
                " set gfn=Inconsolata:h11 "change default font
                "remap K to use conqueterm
                :map K :<C-U>call ConqueMan()<CR> 
                :ounmap K
            endif
        endif
    endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COMPILING AND EXECUTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
if has("autocmd")
  augroup vimrc_filetype
    autocmd!
    autocmd FileType    python          map <Leader>r :!echo -- Running %; python %<CR>
    autocmd FileType    ruby            map <Leader>r :!echo -- Running %; ruby %<CR>
    autocmd FileType    c,cpp,objc,java map <Leader>m :make<CR>

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
    autocmd FileType    tex             map <Leader>c :w<CR>:!pdflatex %<CR>
    autocmd FileType    tex             map <Leader>r :!open %<.pdf<CR>

    " Running scheme
    autocmd filetype scheme map <leader>r call Send_To_Screen(@r)

  augroup end
endif
