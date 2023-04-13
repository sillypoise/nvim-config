return {
    {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                options = {
                    -- transparent = true,
                    darken = {
                        sidebars = {
                            enable = true,
                            list = { 'nvim-tree' }
                        }
                    }
                }
            })
            vim.cmd.colorscheme('github_dark')
        end
    }, {
    -- nord
    'shaunsingh/nord.nvim',
}, {
    -- atom
    'navarasu/onedark.nvim',
} }
