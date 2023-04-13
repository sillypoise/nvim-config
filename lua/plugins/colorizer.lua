local status_1, colorizer = pcall(require, "colorizer")
if (not status_1) then return end

return {
    -- highlights color definitions
    "norcalli/nvim-colorizer.lua",
    config = function()
        colorizer.setup({
            '*',
            javascript = { hsl_fn = true }
        })
    end
}
