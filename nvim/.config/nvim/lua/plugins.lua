return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'mbbill/undotree'
    use 'christoomey/vim-tmux-navigator'
    use 'jpalardy/vim-slime'
    use 'kshenoy/vim-signature'
    use 'junegunn/vim-peekaboo'
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
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-fugitive'
    use 'rafamadriz/friendly-snippets'
    use 'mhinz/vim-signify'
    use 'tpope/vim-rhubarb'
    use 'plasticboy/vim-markdown'
    use 'mattn/emmet-vim'
    use 'neovimhaskell/haskell-vim'
    use 'amiorin/vim-textile'
    use 'tommcdo/vim-exchange'
    use 'fatih/vim-go'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-orgmode/orgmode'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'mfussenegger/nvim-dap'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use "windwp/nvim-autopairs"
    use 'numToStr/Comment.nvim'
    use 'dhruvasagar/vim-table-mode'
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
end)
