
local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

-- nvim-tree.api.tree.toggle()
vim.keymap.set('n', '<leader>tt', '<cmd>:NvimTreeToggle<CR>')

nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        side = "right",
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "i", action = "cd"}
            },
        },
    },
    renderer = {
        group_empty = true,
    },
})
