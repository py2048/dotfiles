" Plugins
source ~/.config/nvmath/plugins.vim

" config
map <space>/ <Plug>VSCodeCommentary

" Settigns
set clipboard=unnamedplus

" Mapping

" Delete without copy to clipboard
map <leader>d "_d
" Paste without copy to clipboard
nmap <silent> <expr> <leader>p (line('.') == line('$')) ? '"_ddp' : '"_ddP'
vmap <silent> <expr> <leader>p (col('.') == col('$')-1) ? '<leader>dp' : '<leader>dP'


" Selection
nmap <space>v 0v$h
vmap <space>v <Esc>0v$h
" Comment

" Indent
vnoremap < <gv
vnoremap > >gv



" Pages
" nmap <A-j> <J>
nmap K <C-u>
nmap J <C-d>

nmap <silent> gJ :join<CR>

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

" Macro
let @m = 'S{hi\mathrm'
