" Lua plugins config
" lua require('auto-pairs')
" lua require"surround".setup{}
lua require('glxline')
lua require('comment')
lua require('treesitter')
lua require('nscroll')
" lua require('compe')

" Vim plugins config
source $HOME/.config/nvim/plug/fzf.vim
" source $HOME/.config/nvim/plug/compe.vim

" Plugins config values

" Set NNN layout
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
