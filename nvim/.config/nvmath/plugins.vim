" if empty(glob('~/.config/nvmath/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvmath/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

set rtp+=~/.config/nvmath

call plug#begin('~/.config/nvmath/autoload/plugged')

    
    " Vim-which-key
    " Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    " Surround
    " Plug 'machakann/vim-sandwich'
    
    " Motion
    " Plug 'justinmk/vim-sneak'
    " Plug 'unblevable/quick-scope'

    " Latex
    " Plug 'py2048/vim-latex-objects'
    
    " Color theme
    Plug 'Shatur/neovim-ayu'

    " Plug 'SirVer/ultisnips'
    Plug 'JuliaEditorSupport/julia-vim'

call plug#end()


" Config

" Surround
" source ~/.config/nvmath/autoload/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim

" " Quickscope
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" let g:qs_max_chars=150
" highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
" highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Julia
let g:latex_to_unicode_auto = 1

" Color scheme
colorscheme ayu-mirage
