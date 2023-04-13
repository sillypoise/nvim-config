return {
    --nvim tree
    'nvim-tree/nvim-tree.lua',
    config = function()
        -- nvim-tree.api.tree.toggle()
        vim.keymap.set('n', '<leader>tt', '<cmd>:NvimTreeToggle<CR>')

        require('nvim-tree').setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                side = "right",
                mappings = {
                    list = {
                        { key = "u", action = "dir_up" },
                        { key = "i", action = "cd" }
                    },
                },
            },
            renderer = {
                group_empty = true,
            },
        })
    end
}
