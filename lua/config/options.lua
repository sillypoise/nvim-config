-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ";"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 20
vim.opt.shell = "zsh"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- limit popup UI height
vim.o.pumheight = 10

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- No Wrap lines
vim.opt.wrap = false

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Open Split on Right
vim.opt.splitright = true

-- Disable animations
vim.g.snacks_animate = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Finding files - Search down into subfolders
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
