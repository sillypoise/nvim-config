local status, trouble = pcall(require, "trouble")
if (not status) then return end

trouble.setup()

vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true }
)
