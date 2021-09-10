" Lua plugins config
luafile $HOME/.config/nvim/lua/glxline.lua
luafile $HOME/.config/nvim/lua/comment.lua
luafile $HOME/.config/nvim/lua/treesitter.lua
luafile $HOME/.config/nvim/lua/nscroll.lua
" luafile $HOME/.config/nvim/lua/nvcompe.lua
" luafile $HOME/.config/nvim/lua/auto-pairs.lua
luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Vim plugins config
source $HOME/.config/nvim/plug/fzf.vim
source $HOME/.config/nvim/autoload/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim
source $HOME/.config/nvim/plug/sneak.vim
" source $HOME/.config/nvim/plug/vsnip.vim
" source $HOME/.config/nvim/plug/ipython.vim


" Plugins config values

" Float Term
hi FloatermBorder guibg=NONE guifg=#5e81ac
autocmd TermOpen * setlocal nonumber norelativenumber

" Set NNN layout
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" Quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#1EFFFF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#FF00FF' gui=underline ctermfg=81 cterm=underline

" Search highlight
highlight Search guifg=None guibg=#444b69

" Search
com! Q :q

" Snippets
let g:vsnip_snippet_dir = "$HOME/.config/nvcode/snippets/src"

set colorcolumn=99999
lua require("indent_blankline").setup { char = "│", buftype_exclude = {"terminal"}}

