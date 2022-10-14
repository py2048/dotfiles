if empty(glob('~/.config/nvcode/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvcode/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set rtp+=~/.config/nvcode

call plug#begin('~/.config/nvcode/autoload/plugged')

    
    " Vim-which-key
    " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    " Surround
    Plug 'machakann/vim-sandwich'
    
    " Motion
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'

    " Latex
    Plug 'py2048/vim-latex-objects'

call plug#end()


" Config

" Surround
source ~/.config/nvcode/autoload/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim

" " Sneak.vim
" highlight Sneak guifg=#000000 guibg=#75A5D3 ctermfg=black ctermbg=cyan
highlight Sneak guifg='#afff5f' gui=underline ctermfg=155 cterm=underline 
let g:sneak#prompt = ' '
nmap gs <Plug>Sneak_;
nmap gS <Plug>Sneak_,
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T
let g:sneak#s_next = 1

" " Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
