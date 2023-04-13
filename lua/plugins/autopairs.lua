local status_1, autopairs = pcall(require, "nvim-autopairs")
if (not status_1) then return end

return {
    'windwp/nvim-autopairs',
    config = function()
        autopairs.setup({
            check_ts = true,
            disable_filetype = { "TelescopePrompt", "vim" },
            fast_wrap = {},
        })
    end
}
