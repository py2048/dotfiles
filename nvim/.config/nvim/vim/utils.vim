" Formatting
" Fortran
" au BufWritePost *.f90 silent! execute '!fprettify -i 4 <afile>' | e!

" C auto format
function! ClangFormat()
    let l:lines='all'
    if bufname() != "keymap.c"
        py3f ~/.local/bin/clang-format.py
    endif
endfunction

augroup CFormatSave
    autocmd!
    autocmd BufWritePre *.c,*.h,*.cc,*.cpp call ClangFormat()
augroup END


" python auto format
function! PyYapfFormat()
    if exists("*YapfFullFormat")
        call YapfFullFormat()
    endif
endfunction

augroup PyFormatSave
    autocmd!
    autocmd BufWritePre *.py,*.ipy call PyYapfFormat()
augroup END


" Latex files
au BufRead,BufNewFile *.tex set filetype=latex

" kbd files
au BufRead,BufNewFile *.kbd set filetype=lisp

" Set tab
" autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
" autocmd FileType jsonc setlocal shiftwidth=2 softtabstop=2 expandtab

" Fixed form fortran
au BufRead,BufNewFile *.f setlocal shiftwidth=2 softtabstop=2 expandtab

"Makefile tab
autocmd FileType make setlocal noexpandtab softtabstop=0

" Set numberline
set number relativenumber

" Number line
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" auto reload file
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Change cursor when quit
au VimLeave * set guicursor=a:ver25
"
" Search for any string
com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\/')| normal! n

" Search highlight
highlight Search guifg=None guibg=#444b69

" Quit
com! Q :q
