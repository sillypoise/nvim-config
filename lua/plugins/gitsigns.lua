local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

return {
    -- visualize diffs in buf
    'lewis6991/gitsigns.nvim',
    config = function()
        vim.keymap.set('n', ']h', function()
            gitsigns.next_hunk()
        end)
        vim.keymap.set('n', '[h', function()
            gitsigns.prev_hunk()
        end)
        vim.keymap.set('n', '<leader>ph', function()
            gitsigns.preview_hunk()
        end)

        gitsigns.setup {
            signs = {
                -- add = { text = '' },
                -- change = { text = '' },
                -- delete = { text = '' },
                -- topdelete = { text = '' },
                -- changedelete = { text = '' },
                -- add = { text = '+' },
                -- change = { text = '~' },
                -- delete = { text = '_' },
                -- topdelete = { text = '‾' },
                -- changedelete = { text = '~' },
            },
        }
    end
}
