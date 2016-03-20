" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Also, make sure vim starts in 256-color mode for screen and etc.
set nocompatible


if has("autocmd")
    " open quickfix window after make
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    autocmd BufRead,BufNewFile *.clj set filetype=clojure "recognize clj files

    " strip trailing whitespace when writing to buffer
    autocmd BufWritePre  *.{cpp,h,c,etc,clj,tex,py}  call StripTrailingWhite()

    augroup gitcommit_filetype
        autocmd!
        autocmd FileType gitcommit :set cc=51
    augroup end

endif
