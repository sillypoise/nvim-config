return {
    -- github copilot
    'github/copilot.vim',
    config = function()
        -- disable
        vim.keymap.set('n', '<leader>dc', ':Copilot disable<CR>')
        -- enable
        vim.keymap.set('n', '<leader>ec', ':Copilot enable<CR>')
    end
}
