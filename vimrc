" *****************************************************************************
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible
set t_Co=256                         

if has("autocmd")
    " Source the vimrc file after saving it
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Set syntax highligthing for arduino
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    au InsertEnter * set cursorcolumn
    au InsertLeave * set nocursorcolumn
    autocmd BufEnter * highlight OverLenght cterm=bold term=bold ctermbg=red ctermfg=black
    " autocmd BufEnter * match OverLenght /\%80v.*/
endif

" ************************** SETTINGS ***************************************** 
" ***************************************************************************** 
set bg=dark                     " used with color scheme
colorscheme zenburn             " 256-colored color schemes
" colorscheme wombat256           
" colorscheme molokai
" colorscheme solarized
" colorscheme tango2
" colorscheme railscasts
" colorscheme darkspectrum
syntax on                       " use syntax highlighting
filetype plugin indent on       " use file specific plugins and indents
set number                      " use line numbers
set autoindent                  " indenting
set smartindent                 " indenting
set hlsearch                    " highlight search
set ignorecase                  " case insensitive
set incsearch                   " search while typing
set nocursorcolumn              " no highligted cursor column
set cursorline                  " highlight the line we are on
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
set hlsearch                    " highlight search result

" Specify words to be highlighted automatically
highlight TODOS cterm=bold term=bold ctermbg=yellow ctermfg=black
match TODOS /TODO\|FIXME\|XXX/

" customize the staus line
set statusline=%#Time#%{strftime(\"\%a\ \%d\ \%b\ \%H:\%M\ \ \",localtime())}\ %#Filepath#[\%F]%#Filetype#\ %y%#Flags#\ %M\ \ %r\ %h\ %w\ %=%L\ lines\ \ \ %#Percentage#[%p%%]

" *************************** PLUGINS *****************************************
" *****************************************************************************

" Must be called before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" set supertab to use the context (ie programming language) we are in
let g:SuperTabDefaultCompletionType = "context"

" Options for taglist
let Tlist_Auto_Open=0
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Enable_Fold_Column=0
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Sort_Type="name"     
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40

" LaTeX specifics
let g:tex_flavor='latex'

" ************************** MAPPINGS *****************************************
" *****************************************************************************

"<Space> is the leader character
" let mapleader = " " 

" Mappings for Tabularize plugin 
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

" Toggle pastemode
nnoremap <Leader>p :set invpaste paste?<CR>
set pastetoggle=<Leader>p
set showmode

" Substitute on this line
nmap <Leader>s :s///g<Left><Left><Left>

" Substitute all
nmap <Leader>S :%s///gc<Left><Left><Left><Left>

" Substitue visual selection
vmap <Leader>s :s/\%V//g<Left><Left><Left>

" Toggle highlighting
nmap <Leader>w :nohls<Enter>
nmap <Leader>W :set hls<Enter>

"Easier navigation between windows
nmap <Leader>j  <c-w>j
nmap <Leader>k  <c-w>k
nmap <Leader>h  <c-w>h
nmap <Leader>l  <c-w>l

"echo the truth 
nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" Scroll faster
nmap <C-j> 5j
nmap <C-k> 5k

" Bubble single lines by using unimpaired plugin
nmap <C-h> [e
nmap <C-l> ]e

" Bubble multiple lines using unimpaired plugin
vmap <C-h> [egv
vmap <C-l> ]egv

" Toggle Tlist and NERDTree
nmap <Leader>t :TlistToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Insert <count> line over/under current line
nmap <Leader>O [<Space>
nmap <Leader>o ]<Space>

" Edit .vimrc
nmap <Leader>v :edit $MYVIMRC<CR>

"open BufExplorer
nmap <Leader>b :BufExplorer<CR>

" open FuzzyFinder
nmap <Leader>f :FufFile<CR>

imap <c-c> <esc>

" ************************** COMPILING AND RUNNING ****************************
" *****************************************************************************

filetype on
if has("autocmd")
  augroup vimrc_filetype
    autocmd!
    autocmd FileType    python          map <Leader>r :!echo -- Running %; python %<CR>
    autocmd FileType    ruby            map <Leader>r :!echo -- Running %; ruby %<CR>
    autocmd FileType    c,cpp,objc      map <F5> :make<CR>

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

    " Running lisp (there is no compile)
    autocmd filetype scheme map <leader>r call Send_To_Screen(@r)

  augroup end
endif
