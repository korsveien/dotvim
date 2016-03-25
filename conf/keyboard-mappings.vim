let mapleader=','

nnoremap :sh :terminal

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
