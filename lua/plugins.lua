-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- Status line
    use({
        'nvim-lualine/lualine.nvim',
        requries = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- LSP Stuff
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'mfussenegger/nvim-jdtls'

    -- Markdown preview
    use 'davidgranstrom/nvim-markdown-preview'

    -- Colorscheme
    use 'folke/tokyonight.nvim'
    use 'Shatur/neovim-ayu'
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
    }

    use 'tpope/vim-fugitive'
    use 'mbbill/undotree'

    -- Fun practice
    use 'ThePrimeagen/vim-be-good'

    --Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end)
