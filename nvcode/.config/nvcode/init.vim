" Plugins
source ~/.config/nvcode/plugins.vim

" Settigns
set clipboard=unnamedplus

" Mapping

" Delete
map <space>d "_d
nmap <space>p "_ddkp
vmap <space>p "_dkp

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

com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\/')| normal! n