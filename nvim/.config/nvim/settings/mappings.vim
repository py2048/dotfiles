" Set F12 key
set <F12>=<c-v><F12>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>


" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :BufferNext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :BufferPrevious<CR>


" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <Leader>o o<Esc>^Da
" nnoremap <Leader>O O<Esc>^Da


" Which vim keys
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Split window
nmap <leader>sv :vsplit<CR>
nmap <leader>sh :split<CR>

" Delete without copy to clipboard
map <leader>d "_d
" Paste without copy to clipboard
nmap <silent> <expr> <leader>p (line('.') == line('$')) ? '"_ddp' : '"_ddP'
vmap <silent> <expr> <leader>p (col('.') == col('$')-1) ? '<leader>dp' : '<leader>dP'

" Select lines
nmap <leader>v 0v$h
vmap <leader>v <Esc>0v$h

" Page Motion
nmap K <C-u>
nmap J <C-d>

" Join line
nmap <silent> gJ :join<CR>

" Move lines in visual mode
vmap <c-k> :move '<-2<CR>gv-gv
vmap <c-j> :move '>+1<CR>gv-gv

" Close Buffer
nnoremap <leader>w :BufferClose<CR>

" Change word and occurrences
nnoremap c* *<c-o>cgn
nnoremap c# #<C-o>cgn

" Turn off highlight until next search
nmap <silent> <leader>h :noh<CR>

" Replace arrow in insert mode
imap <c-h> <Left>
imap <c-j> <Down>
imap <c-k> <Up>
imap <c-l> <Right>

" Turn on lsp
nmap <silent> <leader>s :LspStart<CR>


" Vim RegEx
" nnoremap / /\v
" nnoremap ? ?\v
" cnoremap %s/ %s/\v
" cnoremap s/ s/\v
