"""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""
nmap <leader>l :TagbarToggle<cr>

"""""""""""""""""""""""""""""""
" => elm-vim
"""""""""""""""""""""""""""""""
au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)

let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
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
let g:ctrlp_working_path_mode = 'ra'
nmap <C-e> :CtrlPMRU<CR>
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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers = ['eslint']

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
