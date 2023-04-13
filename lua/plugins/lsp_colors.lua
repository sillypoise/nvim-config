local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

return {
    -- creates missing LSP diagnostics highlight groups for unsupported color schemes
    "folke/lsp-colors.nvim",
    config = function()
        colors.setup {
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
        }
    end
}
