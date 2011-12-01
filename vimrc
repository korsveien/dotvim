" *****************************************************************************
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible
set t_Co=256                         

if has("autocmd")
    " Source the vimrc file after saving it
    " autocmd bufwritepost .vimrc source $MYVIMRC

    " Set syntax highligthing for arduino
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
    " au InsertEnter * set cursorcolumn
    " au InsertLeave * set nocursorcolumn
    autocmd BufEnter * highlight OverLenght cterm=bold term=bold ctermbg=red ctermfg=black
    autocmd BufEnter * match OverLenght /\%80v.*/
endif

" ************************** SETTINGS ***************************************** 
" ***************************************************************************** 
set bg=dark                     " used with color scheme

" colorscheme zenburn             " 256-colored color schemes
" let g:zenburn_high_contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_unfified_CursorColumn = 1

colorscheme wombat256           
" colorscheme molokai
" colorscheme solarized
" colorscheme tango2

syntax on                       " use syntax highlighting
filetype plugin indent on       " use file specific plugins and indents
set autoindent                  " indenting
set number                      " use line numbers
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
set nobackup                    " turn backup off
set nowb 
set noswapfile
set mouse=a

" Specify words to be highlighted automatically
highlight TODOS cterm=bold term=bold ctermbg=green ctermfg=black
highlight Search cterm=bold term=bold ctermbg=yellow ctermfg=black
highlight IncSearch cterm=bold term=bold ctermbg=yellow ctermfg=black
match TODOS /TODO\|FIXME\|XXX/

" customize the status line
set statusline=[%n]%y\%{fugitive#statusline()}%h%w%m%r\ %<%F\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%P

" *************************** PLUGINS *****************************************
" *****************************************************************************

" Must be called before filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" set supertab to use the context (ie programming language) we are in
let g:SuperTabDefaultCompletionType = "context"

" Options for taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Process_Files_Always = 1

" LaTeX specifics
let g:tex_flavor='latex'

" change cursor shape when in insert mode (iTerm2 specific)
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ************************** FUNCTIONS *****************************************
" *****************************************************************************

" goes to definition under cursor
function! GotoDefinition()
  let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
endfunction
map <F9> :call GotoDefinition()<CR>
imap <F9> <c-o>:call GotoDefinition()<CR>
            
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

" ************************** MAPPINGS *****************************************
" *****************************************************************************

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

" \t is already taken by command-t plugin
map <Leader>y <Plug>TaskList

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

"echo the truth 
nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" Scroll faster
nmap <C-j> 5j
nmap <C-k> 5k
vmap <C-j> 5j
vmap <C-k> 5k
nmap <Space> 10j
nmap <Backspace> 10k
vmap <Space> 10j
vmap <Backspace> 10k

" Bubble single lines by using unimpaired plugin
nmap <C-h> [e
nmap <C-l> ]e

" Bubble multiple lines using unimpaired plugin
vmap <C-h> [egv
vmap <C-l> ]egv

" Toggle Tlist and NERDTree
nmap <F2> :TlistToggle<CR>
nmap <F3> :NERDTreeToggle<CR>

" Find next/previous digit
nmap <silent> <Leader>d :call search("[0-9]", "",  line("."))<CR>
nmap <silent> <Leader>D :call search("[0-9]", "b", line("."))<CR>

" Insert <count> line over/under current line
nmap <Leader>O [<Space>
nmap <Leader>o ]<Space>

" Edit .vimrc
nmap <Leader>V :edit $MYVIMRC<CR>
nmap <Leader>v :source $MYVIMRC<CR>

" ************************** COMPILING AND RUNNING ****************************
" *****************************************************************************

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

    " Running scheme (there is no compile)
    autocmd filetype scheme map <leader>r call Send_To_Screen(@r)

  augroup end
endif
