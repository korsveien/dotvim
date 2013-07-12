color jellybeans
set foldmethod=syntax
set syntax=cpp.doxygen
map <Leader>co :w<CR>:!echo -- Compiling %; gcc -o %< %<CR>
map <Leader>co :w<CR>:!echo -- Compiling %; g++ -o %< %<CR>
map <leader>ru :!echo -- Running %<; ./%< <CR>
