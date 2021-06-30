" Lua plugins config
lua require"surround".setup{}
lua require('glxline')
lua require('comment')
lua require('treesitter')
lua require('nscroll')

" Vim plugins config
source $HOME/.config/nvim/plug/fortran/syntax.vim
source $HOME/.config/nvim/plug/fortran/indent.vim
source $HOME/.config/nvim/plug/fzf.vim

" Plugins config values

" Set NNN layout
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
