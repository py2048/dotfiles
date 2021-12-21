if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Set filetype
" au BufRead,BufNewFile *.jl set filetype=julia


call plug#begin('~/.config/nvim/autoload/plugged')
    

    " Auto pairs 
    Plug 'windwp/nvim-autopairs'
    
    " Julia support
    " Plug 'JuliaEditorSupport/julia-vim'

    " Subtitle Alpha support
    " Plug 'joeky888/Ass.vim', { 'for': 'ass' }

    " Status line

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'

    Plug 'nvim-lualine/lualine.nvim'

    " Commenter
    Plug 'b3nj5m1n/kommentary'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Vim-which-key
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    " Color
    Plug 'norcalli/nvim-colorizer.lua'
    " Indent line
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Tag bar
    " Plug 'preservim/tagbar'
    " Surround
    Plug 'machakann/vim-sandwich'
    " lf
    Plug 'py2048/vim-lf'
    
    " Markdown  
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
    
    " Color scheme
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'Shatur/neovim-ayu'
    Plug 'navarasu/onedark.nvim'
    Plug 'shaunsingh/nord.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'

    " Scroll
    Plug 'karb94/neoscroll.nvim'

    " Completion
    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Plug 'hrsh7th/cmp-nvim-lua'

    " Yapf format
    Plug 'pignacio/vim-yapf-format', {'for': 'python'}

    " Snippet
    Plug 'hrsh7th/vim-vsnip'
    " Plug 'hrsh7th/vim-vsnip', { 'on': 'InsertEnter'}
    " Plug 'rafamadriz/friendly-snippets'

    " Motion
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'

    " Vim ipython
    " Plug 'jpalardy/vim-slime', { 'for': 'python' }
    " Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()

    

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

