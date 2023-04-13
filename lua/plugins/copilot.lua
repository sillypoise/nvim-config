return {
    -- github copilot
    'github/copilot.vim',
    config = function()
        -- disable
        vim.keymap.set('n', '<leader>dc', ':CopilotDisable<CR>')
        -- enable
        vim.keymap.set('n', '<leader>ec', ':CopilotEnable<CR>')
    end
}
