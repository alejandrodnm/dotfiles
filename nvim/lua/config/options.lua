-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Change the <leader> key to comma instead of \ "
vim.g.mapleader = ","

vim.g.maplocalleader = "\\"

vim.g.noswapfile = true

-- Highlight column at 80 characters
vim.o.colorcolumn = "80"
-- Disable error bells
vim.o.errorbells = false
vim.o.ruler = true
vim.o.signcolumn = "auto:2"
vim.o.laststatus = 2
vim.o.wrap = true
vim.o.fillchars = "horiz:-,vert:|"
