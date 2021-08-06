" Plugins
source ~/.config/nvcode/plugins.vim

" Settigns
set clipboard=unnamedplus

" Mapping

" Delete
map <space>d "_d
nmap <space>p "_ddkp
vmap <space>p "_dkp

" Comment
map <space>/ <Plug>VSCodeCommentary

" Indent
vnoremap < <gv
vnoremap > >gv

" Comment

" Navigate
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Math
  autocmd!
augroup filetype_latex
  autocmd BufRead *.tex inoremap $ $$<Esc>i
augroup END

" Pages
" nmap <A-j> <J>
nmap K <C-u>
nmap J <C-d>

imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Change word and occurrences
nnoremap c* *<c-o>cgn
nnoremap c# #<C-o>cgn

" Move lines in visual mode
vmap K :move '<-2<CR>gv-gv
vmap J :move '>+1<CR>gv-gv

com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\/')| normal! n
