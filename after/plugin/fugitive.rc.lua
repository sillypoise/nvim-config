local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gP", function()
    vim.cmd.Git('push')
end, opts)
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd.Git({ 'pull', '--rebase' })
end, opts)
vim.keymap.set("n", "<leader>T", ":Git push -u origin ", opts);
local sillypoise_fugitive = vim.api.nvim_create_augroup("sillypoise_fugitive", {})


local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = sillypoise_fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end
        vim.keymap.set("n", "<leader>gs", '<cmd>:G<CR>');

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>T", ":Git push -u origin ", opts);
    end,
})
