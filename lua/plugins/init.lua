return {
    --* [[ LSP ]]
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- LSP Support
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
            -- Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
            'jose-elias-alvarez/null-ls.nvim',
            -- creates missing LSP diagnostics highlight groups for unsupported color schemes
            "folke/lsp-colors.nvim"
        },
    },

    --* [[ Git ]]
    'tpope/vim-rhubarb',

    --* [[ Editor ]]
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- vim sugar for unix shell commands
    'tpope/vim-eunuch',

    -- tmux Navigation
    'christoomey/vim-tmux-navigator',

    --* [[ Appereance ]]
    -- status line
    'rebelot/heirline.nvim',

    -- lsp UIs
    "glepnir/lspsaga.nvim",

}
