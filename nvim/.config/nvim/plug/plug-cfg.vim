" Lua plugins config
" lua require"surround".setup{}
luafile $HOME/.config/nvim/lua/glxline.lua
luafile $HOME/.config/nvim/lua/comment.lua
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/nscroll.lua
luafile $HOME/.config/nvim/lua/nvcompe.lua
luafile $HOME/.config/nvim/lua/auto-pairs.lua

" Vim plugins config
source $HOME/.config/nvim/plug/fzf.vim
source $HOME/.config/nvim/autoload/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim
source $HOME/.config/nvim/plug/sneak.vim


" Plugins config values

" Set NNN layout
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
