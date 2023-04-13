local status, indent = pcall(require, "indent_blankline")
if (not status) then return end

return {
    -- indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    confg = function()
        indent.setup {
            char = '┊',
            show_trailing_blankline_indent = false,
        }
    end
}
