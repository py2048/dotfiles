local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    --- Packer
    use 'wbthomason/packer.nvim'

    -- Reduce startup time
    use 'nathom/filetype.nvim'
    use 'lewis6991/impatient.nvim'

    -- Auto pairs 
    use 'windwp/nvim-autopairs'

    -- Status line
    use 'kyazdani42/nvim-web-devicons'
    use 'romgrk/barbar.nvim'
    use 'nvim-lualine/lualine.nvim'
    
    -- Commenter
    use 'b3nj5m1n/kommentary'
    -- FZF
    use 'junegunn/fzf.vim'
    -- Vim-which-key
    use {'liuchengxu/vim-which-key', opt = true, cmd = {'WhichKey', 'WhichKey!'}}
    -- Color
    use 'norcalli/nvim-colorizer.lua'
    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'
    -- Terminal
    use 'numToStr/FTerm.nvim'
    -- Surround
    -- use 'machakann/vim-sandwich'
    use { "kylechui/nvim-surround", tag = "*"}

    -- Markdown
    use {'dhruvasagar/vim-table-mode', opt = true, ft = {'markdown'}}

    -- Color scheme
    use 'Shatur/neovim-ayu'
    -- use 'navarasu/onedark.nvim'
    -- use 'shaunsingh/nord.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- Scroll
    use 'karb94/neoscroll.nvim'

    -- Completion
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lua'
    use 'kdheepak/cmp-latex-symbols'

    -- plenary
    use "nvim-lua/plenary.nvim"
    -- null ls
    use "jose-elias-alvarez/null-ls.nvim"

    -- Julia support
    use 'JuliaEditorSupport/julia-vim'
    use {
        'hasundue/vim-pluto', opt = true, ft = 'julia',
        requires = {'vim-denops/denops.vim', opt = true}
    }

    -- Snippet
    use 'hrsh7th/vim-vsnip'
    -- use 'rafamadriz/friendly-snippets'

    -- Motion
    use 'justinmk/vim-sneak'
    -- use 'unblevable/quick-scope'
    use "jinh0/eyeliner.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
