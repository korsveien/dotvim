set t_Co=256

colorscheme solarized
"
" From https://gist.github.com/garrettoreilly/5564265:
" Change the Solarized background to dark or light depending upon the time of 
" day (5 refers to 5AM and 17 to 5PM). Change the background only if it is not 
" already set to the value we want.
function! SetSolarizedBackground()
    if strftime("%H") >= 5 && strftime("%H") < 17 
        if &background != 'light'
            set background=light
        endif
    else
        if &background != 'dark'
            set background=dark
        endif
    endif
endfunction

" Set background on launch
call SetSolarizedBackground()

" Every time you save a file, call the function to check the time and change 
" the background (if necessary).
if has("autocmd")
    autocmd bufwritepost * call SetSolarizedBackground()
endif
