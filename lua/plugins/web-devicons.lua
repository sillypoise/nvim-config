local status_1, icons = pcall(require, "nvim-web-devicons")
if (not status_1) then return end

return {
    -- adds file type icons to plugins
    'nvim-tree/nvim-web-devicons',
    config = function()
        icons.setup {
            -- your personnal icons can go here (to override)
            -- DevIcon will be appended to `name`
            override = {
            },
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true
        }
    end
}
