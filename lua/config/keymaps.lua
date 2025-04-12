-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Escape with jk
vim.keymap.set("i", "jk", "<Esc>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Swap ; with space (e.g. next occurence)
vim.keymap.set("n", "<Space>", ";")

-- Centered vertical page movment
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Buffers
-- jump to previous buffer
-- vim.keymap.set("n", "<leader>f", "<C-^>", { noremap = true, silent = true })

-- Centered next/prev search movement
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Windows
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all but active windows" })
vim.keymap.set("n", "<leader>wh", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>w=", "<C-w>=")
vim.keymap.set("n", "<leader>w_", "<C-w>_")
vim.keymap.set("n", "<leader>w|", "<C-w>|")
vim.keymap.set("n", "<leader>wq", "<C-w>q")
vim.keymap.set("n", "<leader>wr", "<C-w>r")
vim.keymap.set("n", "<leader>w+", "<C-w>+", { noremap = false })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { noremap = false })

local osc52 = require("osc52")

vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>yy", "<leader>y_", { remap = true })
vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)

-- Function to get the current file's path relative to the monorepo root
local function copy_file_path()
  -- Get the working directory (assumed to be the monorepo root)
  local root_dir = vim.fn.getcwd()
  -- Get the current file's absolute path
  local file_path = vim.fn.expand("%:p")
  -- Get the relative path from the root directory
  local relative_path = vim.fn.fnamemodify(file_path, ":~:.")
  -- Copy the relative path to the clipboard using OSC52
  osc52.copy(relative_path)
  print("Copied: " .. relative_path)
end

-- Map the keybinding to copy the file path to clipboard
vim.keymap.set("n", "<leader>yf", copy_file_path, { desc = "Copy file path to clipboard using OSC52" })
