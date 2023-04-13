local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- try heirline

-- status line
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = 'nightfly',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end
}
