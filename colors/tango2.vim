" =============================================================================
" Name: Tango2
" Purpose: Another colour scheme using the Tango colour palette
" Maintainer: Pranesh Srinivasan
" Last Modified: Saturday 04 October 2008 02:06:26 AM IST
" Edited By: Lars Storjord, October 2009
" Available From: http://folk.uio.no/larsstor/tango2.vim
" =============================================================================


" =============================================================================
" Preamble
" =============================================================================

set background=dark

hi clear

if exists("syntax-on")
syntax reset
endif

let colors_name = "tango2"

" =============================================================================
" Vim >= 7.0 specific colours
" =============================================================================

if version >= 700
" No support for cursor line yet
" hi CursorLine term=underline cterm=underline guibg=#111133
" hi CursorColoumn
" hi MatchParen
"hi Pmenu guibg=#111111 guifg=#e9ba6e
"hi PmenuSel guibg=#8ae234 guifg=black gui=italic,bold
hi Pmenu                    guifg=#5eafe5   guibg=#111111
hi PmenuSel gui=italic,bold guifg=black     guibg=#5eafe5
endif

" =============================================================================
" General colours
" =============================================================================

hi Normal       gui=none    guifg=#eeeeec   guibg=#2e3436
hi Cursor       gui=none    guifg=Black     guibg=White

"hi Folded guibg=#202020 guifg=#e9ba6e
"hi Folded guibg=#202020 guifg=#8ae234
hi Folded                   guifg=#ae7fa8   guibg=#202020
hi FoldColumn               guifg=#e9ba6e   guibg=#2e3436
" =============================================================================
" Syntax highlighting
" =============================================================================

hi Comment      gui=italic  guifg=#6d7e8a   ctermfg=Grey
hi Constant                 guifg=#8ae234
hi Function     gui=bold    guifg=#9bcf8d
hi Identifier               guifg=#ad7fa8
hi IncSearch    gui=italic  guifg=black     guibg=#8ae234
hi MatchParen               guifg=#e9ba6e   guibg=#2e3436
hi ModeMsg      gui=none    guifg=white
hi MoreMsg      gui=bold    guifg=#5eafe5
hi PreProc                  guifg=#e9ba6e
hi Question                 guifg=#8ae234
hi Special                  guifg=#5eafe5   term=underline
hi Statement                guifg=#729fcf
hi StatusLine   gui=none    guifg=#e9ba6e   guibg=#202020
hi StatusLineNC gui=none                    guibg=#202020
hi TabLine      gui=none    guifg=#8ae234   guibg=#202020
hi TabLineFill  gui=none    guifg=#5eafe5   guibg=#202020
hi TabLineSel   gui=italic  guifg=#5eafe5   guibg=#2e3436
hi Todo                     guifg=black
hi Type                     guifg=#8ae234
hi VertSplit    gui=none    guifg=#5eafe5   guibg=#202020
hi Visual       gui=italic                  guibg=#101010
hi WildMenu     gui=italic                  guibg=#e9ba6e



hi OverLength                               guibg=#990000 ctermbg=red
match OverLength /\%>80v.*/

hi Search guibg=#81abbd
"hi Search guibg=#8ae234 guifg=white
" hi QtClass guifg=Orange ctermfg=LightBlue

" Used by status line
hi Filepath     gui=bold    guifg=#8ae234   guibg=#202020
hi Filetype                 guifg=#e9ba6e   guibg=#202020
hi Flags        gui=italic  guifg=white     guibg=#202020
hi Percentage               guifg=#5eafe5   guibg=#202020
hi Positions    gui=bold    guifg=#8ae234   guibg=#202020
hi Time                     guifg=#5eafe5   guibg=#202020
