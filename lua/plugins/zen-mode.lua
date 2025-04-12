return {
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        twilight = {
          enabled = false,
        },
        alacritty = {
          enabled = true,
          font = "24",
        },
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" } },
    },
  },
  {
    "folke/twilight.nvim",
    opts = {},
    keys = {},
  },
}
