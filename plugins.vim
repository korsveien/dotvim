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


""""""""""""""""""""""""""""""" " => Emmet """""""""""""""""""""""""""""""
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
