return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'scrooloose/nerdtree'
    use 'PhilRunninger/nerdtree-visual-selection'
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
    use 'jpalardy/vim-slime'
    use 'kshenoy/vim-signature'
    use 'junegunn/vim-peekaboo'
    use 'wesQ3/vim-windowswap'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'
    use 'ntpeters/vim-better-whitespace'
    use 'terryma/vim-multiple-cursors'
    use 'junegunn/vim-easy-align'
    use 'vim-airline/vim-airline'
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    use 'kana/vim-textobj-entire'
    use 'Julian/vim-textobj-variable-segment'
    use 'michaeljsmith/vim-indent-object'
    use 'morhetz/gruvbox'
    use 'luochen1990/rainbow'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use 'tpope/vim-rhubarb'
    use 'plasticboy/vim-markdown'
    use 'mattn/emmet-vim'
    use 'neovimhaskell/haskell-vim'
    use 'amiorin/vim-textile'
    use 'tommcdo/vim-exchange'
    use 'ryanoasis/vim-devicons'
    use 'fatih/vim-go'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'mfussenegger/nvim-dap'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { 'dhruvasagar/vim-table-mode' }
    use { 'nvim-orgmode/orgmode', config = function() require('orgmode').setup {} end }
end)
