return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          replace_netrw = true,
          layout = {
            layout = {
              position = "right",
            },
          },
        },
      },
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    explorer = {
      replace_netrw = true, -- Replace netrw with the snacks explorer
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
