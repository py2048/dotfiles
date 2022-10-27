" Vim plugins config
source $HOME/.config/nvim/vim/vplug/fzf.vim
source $HOME/.config/nvim/vim/vplug/sneak.vim
source $HOME/.config/nvim/vim/vplug/vsnip.vim
source $HOME/.config/nvim/vim/vplug/pluto.vim
" source $HOME/.local/share/nvim/site/pack/packer/start/vim-sandwich/macros/sandwich/keymap/surround.vim
" source $HOME/.config/nvim/vim/vplug/ipython.vim
" source $HOME/.config/nvim/vim/vplug/table-md.vim
" source $HOME/.config/nvim/vim/vplug/md_preview.vim


" Plugins config values

" Which vim keys
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
highlight Pmenu guibg=#191e2a


" Quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#1EFFFF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#FF00FF' gui=underline ctermfg=81 cterm=underline

" Snippets
let g:vsnip_snippet_dir = "$HOME/.config/nvcode/snippets/src"

" Yapf
let g:yapf_format_style='{based_on_style: pep8, column_limit: 120, dedent_closing_brackets: 1, join_multiple_lines: 0, SPACE_BETWEEN_ENDING_COMMA_AND_CLOSING_BRACKET: 0}'
