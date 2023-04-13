local status, trouble = pcall(require, "trouble")
if (not status) then return end

return {
    -- diagnostics UI
    'folke/trouble.nvim',
    config = function()
        trouble.setup()

        vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>",
            { silent = true }
        )
    end
}
