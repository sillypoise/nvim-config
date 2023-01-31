-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

-- PLUGINS

require('packer').startup(function(use)

    --* [[ Package Manager ]]
    use 'wbthomason/packer.nvim'

    --* [[ LSP ]]
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- LSP Support
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
            -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
            use 'jose-elias-alvarez/null-ls.nvim',
            -- creates missing LSP diagnostics highlight groups for unsupported color schemes
            use "folke/lsp-colors.nvim",
        },
    }

    --* [[ Autocompletion ]]
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional,

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Other
            use 'windwp/nvim-autopairs' -- Optional
        }
    }

    --* [[ Treesitter ]]
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {
                with_sync = true
            })
        end
    }
    -- additiona text objects via treesitter
    use {

        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    -- treesitter Playground
    use 'nvim-treesitter/playground'
    -- Use treesitter to autoclose and autorename html tag
    use 'windwp/nvim-ts-autotag'

    --* [[ Telescope ]]
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    -- fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    -- Telescope file browser
    use { "nvim-telescope/telescope-file-browser.nvim" }

    --* [[ Git ]]
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    -- visualize diffs in buf
    use 'lewis6991/gitsigns.nvim'
    -- for git blame & browse
    use 'dinhhuy258/git.nvim'

    --* [[ Editor ]]
    -- diagnostics UI
    use 'folke/trouble.nvim'
    -- commenting functionality
    use 'numToStr/Comment.nvim'
    -- ddd indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim' -- detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'
    -- undo tree
    use "mbbill/undotree"
    -- harpoon
    use "theprimeagen/harpoon"

    --* [[ Appereance ]]
    -- lsp UIs
    use "glepnir/lspsaga.nvim"
    -- vscode-like pictograms
    use "onsails/lspkind.nvim"
    -- adds file type icons to plugins
    use 'nvim-tree/nvim-web-devicons'
    -- highlights color definitions
    use "norcalli/nvim-colorizer.lua"
    -- zen mode
    use 'folke/zen-mode.nvim'
    -- dim lines for zen mode
    use 'folke/twilight.nvim'

    --* themes
    -- atom
    use 'navarasu/onedark.nvim'
    -- nord
    use 'shaunsingh/nord.nvim'

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')

    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='

    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='

    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,

    pattern = vim.fn.expand '$MYVIMRC',
})
