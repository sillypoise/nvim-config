local status, harpoon = pcall(require, "harpoon")
if (not status) then return end


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup()

vim.keymap.set("n", "<leader>ha", mark.add_file);
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu);
vim.keymap.set("n", "<leader>hf", function() ui.nav_file(1) end);
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end);
vim.keymap.set("n", "<leader>ht", function() ui.nav_file(3) end);
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end);
