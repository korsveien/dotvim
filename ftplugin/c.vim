color jellybeans
set foldmethod=syntax
set syntax=c.doxygen
autocmd FileType    objc,c,cpp,java,php  set foldmethod=syntax
map <Leader>co :w<CR>:!echo -- Compiling %; gcc -o %< %<CR>
map <leader>ru :!echo -- Running %<; ./%< <CR>
