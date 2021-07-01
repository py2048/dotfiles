if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    
    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    
    " Auto pairs for '(' '[' '{' 
    " Plug 'jiangmiao/auto-pairs'
    Plug 'windwp/nvim-autopairs'
    
    " Status line

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'

    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " Commenter
    Plug 'terrortylor/nvim-comment'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'airblade/vim-rooter'
    " Vim-which-key
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    " Color
    Plug 'norcalli/nvim-colorizer.lua'
    " Start screen
    Plug 'mhinz/vim-startify'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Tag bar
    Plug 'preservim/tagbar'
    " Surround
    Plug 'blackcauldron7/surround.nvim'
    " Snippets
    "Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
    " nnn
    Plug 'mcchrish/nnn.vim'
    
    " Color scheme
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'nvim-treesitter/nvim-treesitter'

    " Scroll
    Plug 'karb94/neoscroll.nvim'

    " Any jump
    " Plug 'pechorin/any-jump.vim'
    "
    "
    " Complesion
    " Plug 'hrsh7th/nvim-compe', { 'on': 'InsertEnter'}
    "Plug 'hrsh7th/nvim-compe'

    call plug#end()

    

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

