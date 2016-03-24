"""""""""""""""""""""""""""""""
" => DelimitMate
"""""""""""""""""""""""""""""""
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

"""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""
nmap <C-l> :TagbarToggle<cr>

"""""""""""""""""""""""""""""""
" => elm-vim
"""""""""""""""""""""""""""""""
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "/tmp"
let g:elm_make_show_warnings = 0
" let g:elm_browser_command = ""
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

"""""""""""""""""""""""""""""""
" => Tern
"""""""""""""""""""""""""""""""
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
let g:tern_map_keys=1
" set noshowmode

"""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""
nmap <Leader>g :Gst<CR>

"""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'r'

nmap <C-e> :CtrlPBuffer<CR>

set wildignore+=**/node_modules/**
set wildignore+=**/elm-stuff/**
set wildignore+=**/bin/**
set wildignore+=**/pkg/**
set wildignore+=**/build/**
set wildignore+=*.o,*.obj,*.a,*.iml

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
" => Airline
"""""""""""""""""""""""""""""""
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_section_z='%{fugitive#head()}'

" Displays all buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1


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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = { "mode": "passive",
            \"active_filetypes": ['javascript'],
            \"passive_filetypes": [] }

"""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extrac_conf=0
set completeopt-=preview

"""""""""""""""""""""""""""""""
" => Ag
"""""""""""""""""""""""""""""""
nnoremap <leader>a :Ag
