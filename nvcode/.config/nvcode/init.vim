" Plugins
map <space>/ <Plug>VSCodeCommentary
source ~/.config/nvcode/plugins.vim

" Settigns
set clipboard=unnamedplus

" Mapping

" Delete
map <space>d "_d
" nmap <space>p "_ddkp
" vmap <space>p "_dkp


" Selection
nmap <space>v 0v$h
vmap <space>v <Esc>0v$h

" Comment
xmap <space>/ <Plug>VSCodeCommentary
omap <space>/ <Plug>VSCodeCommentary
nmap <space>/ <Plug>VSCodeCommentaryLine

" Indent
vnoremap < <gv
vnoremap > >gv

" Navigate
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" tnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
" tnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
" tnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
" tnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Math
augroup filetype_latex
  autocmd!
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

nmap <silent> <TAB> gt
nmap <silent> <S-TAB> gT

" Change word and occurrences
nnoremap c* *<c-o>cgn
nnoremap c# #<C-o>cgn

" Move lines in visual mode
vmap <c-k> :move '<-2<CR>gv-gv
vmap <c-j> :move '>+1<CR>gv-gv

" Search
com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\/')| normal! n

" Highlight
nmap <silent> <space>h :noh<CR>

" run code
nmap <silent> <space>r :call VSCodeCall('code-runner.run')<CR>
autocmd FileType python nmap <buffer> <silent> <space>r :call VSCodeCall('python.execInTerminal')<CR>

" Code cell
" autocmd FileType python nmap <buffer> <silent> J :call VSCodeCall('jupyter.gotoNextCellInFile')<CR>
" autocmd FileType python nmap <buffer> <silent> K :call VSCodeCall('jupyter.gotoPrevCellInFile')<CR>


" Ipython
" au BufRead,BufNewFile *.ipynb set filetype=notebook
" autocmd FileType notebook nmap <buffer> <silent> J :call VSCodeCall('notebook.focusNextEditor')<CR>
" autocmd FileType notebook nmap <buffer> <silent> K :call VSCodeCall('notebook.focusPreviousEditor')<CR>

" Command Palate
map <silent> <space>; : call VSCodeCall('workbench.action.showCommands')<CR>

" Split
nmap <silent> <space>sv :call VSCodeCall('workbench.action.splitEditor')<CR>
nmap <silent> <space>sh :call VSCodeCall('workbench.action.splitEditorOrthogonal')<CR>
