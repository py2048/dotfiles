" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set fileformat=unix                     " Set file format to unix
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object
" set iskeyword+=$                      	" treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
" set updatetime=300                      " Faster completion
" set timeoutlen=500                      " By default timeoutlen is 1000 ms
" set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory
set eol
filetype plugin on

" You can't stop me
cmap w!! w !sudo tee %

" Fortran
" au BufWritePost *.f90 silent! execute "!fprettify -i 4 <afile>" | e!

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
augroup PyFormatSave
    autocmd!
    autocmd BufWritePre *.py,*.ipy call YapfFullFormat()
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

" Change cursor when quit
au VimLeave * set guicursor=a:ver25
