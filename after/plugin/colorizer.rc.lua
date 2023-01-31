local status_1, colorizer = pcall(require, "colorizer")
if (not status_1) then return end

colorizer.setup({
    '*';
    javascript = { hsl_fn = true }
})
