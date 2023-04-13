local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

return {
    {
        -- dim lines for zen mode
        'folke/twilight.nvim',
    },
    {
        -- zen mode
        'folke/zen-mode.nvim',
        config = function()
            zenMode.setup {
                window = {
                    backdrop = 0.8,
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true
                    },
                    plugins = {
                        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                        alacritty = {
                            enabled = true,
                            font = "14", -- font size
                        },
                    }
                }
            }

            vim.keymap.set('n', '<leader>wz', '<cmd>ZenMode<cr>', { silent = true })
        end
    }
}
