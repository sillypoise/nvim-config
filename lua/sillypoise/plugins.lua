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

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- LSP
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
            -- LSP UIs
            use "glepnir/lspsaga.nvim",
            -- vscode-like pictograms
            use "onsails/lspkind.nvim"
        },

    }


    -- Autocompletion

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional,

            -- Snippets
            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }


    -- Appereance
    use 'shaunsingh/nord.nvim' -- Nord Theme

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
