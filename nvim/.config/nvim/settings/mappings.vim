" Set F12 key
set <F12>=<c-v><F12>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
" inoremap kj <Esc>
" inoremap jk <Esc>


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

" Terminal
" tnoremap <Esc> <C-\><C-n>
" map <leader>, :FloatermNew<CR>
" map <leader>. :FloatermToggle<CR>
" map <silent> <F12> :FloatermToggle<CR>
" tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
" tnoremap <silent> <F24> <C-\><C-n>:FloatermNew<CR>
" tnoremap <silent> <S-TAB> <C-\><C-n>:FloatermNext<CR>
" tnoremap <silent> [[ <C-\><C-n>:FloatermPrev<CR>

" function! FRunInit()
"     if !exists('b:FloatRun')
"         :FloatermNew! --autoclose=0 --silent --name=float_run
"         let b:FloatRun = 1
"     end
" endfunction

" nmap <silent> <leader>r :w<CR>:call FRunInit()<CR>:FloatermSend! --name=float_run run.lua %<CR>:FloatermShow! float_run<CR>
" nmap <silent> <leader>r :up<CR>:FloatermNew --autoclose=1 run.lua % ; read<CR>
" nmap <silent> <leader>r :up<CR>:FloatermNew --autoclose=1 run.sh % ; read<CR>

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

" Move lines in visual mode
vmap <c-k> :move '<-2<CR>gv-gv
vmap <c-j> :move '>+1<CR>gv-gv

" Search for any string
com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\/')| normal! n

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
