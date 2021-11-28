" Set F12 key
set <F12>=<c-v><F12>
" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap kj <Esc>
" inoremap jk <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-s-u> viwU<Esc>

" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprevious<CR>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :BufferNext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :BufferPrevious<CR>

" Alternate way to save
" nnoremap <C-s> :w<CR>
" Alternate way to quit
" nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
" nnoremap <C-c> <Esc>
" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? '\<C-n>' : '\<TAB>'

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
map <leader>, :FloatermNew<CR>
map <leader>. :FloatermToggle<CR>
map <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <F24> <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <S-TAB> <C-\><C-n>:FloatermNext<CR>
" tnoremap <silent> [[ <C-\><C-n>:FloatermPrev<CR>

" function! FRunInit()
"     if !exists('b:FloatRun')
"         :FloatermNew! --autoclose=0 --silent --name=float_run
"         let b:FloatRun = 1
"     end
" endfunction

" nmap <silent> <leader>r :w<CR>:call FRunInit()<CR>:FloatermSend! --name=float_run run.lua %<CR>:FloatermShow! float_run<CR>
nmap <silent> <leader>r :up<CR>:FloatermNew --autoclose=1 run.lua % ; read<CR>

" map <leader>n :FloatermNew nnn<CR>
nnoremap <leader>n :NnnPicker %:p:h<CR>

" Delete without copy to clipboard
map <leader>d "_d
nmap <leader>p "_ddkp
vmap <leader>p "_P

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
nnoremap <leader>b :BufferClose<CR>

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
nmap <silent> <leader>l :LspStart<CR>
