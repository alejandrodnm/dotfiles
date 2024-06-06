-- Keymaps are automatically loaded on the VeryLazy eventmap
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set('n', '<localleader>', ":WhichKey '\\' <CR>", {
--   silent = true,
--   desc = 'Local leader options (WhichKey)'
-- })

-- Insert space in normal mode
vim.keymap.set("n", "<space>", "i<space><right><esc>")

-- Quit
vim.keymap.del("n", "<leader>qq")
vim.keymap.set("n", "<leader>qq", ":quit<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit all" })

-- vim.keymap.set("n", "<Leader>k", ":bdelete<CR>")

-- Only
vim.keymap.set("n", "<Leader>o", ":only<CR>")

-- Move to first character
-- vim.keymap.set("n", "<C-l>", "$")
-- Move to last character
-- vim.keymap.set("n", "<C-h>", "^")

-- sudo save
-- vim.keymap.set('c', 'w!!', "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- Tabs
vim.keymap.set("n", "<leader>tt", ":$tabnew<CR>", { desc = "Tab new" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Tab close" })

-- Replace \n with enter
vim.keymap.set("n", "<Leader>cn", ":'<,'>s/\\n/\r/g", { desc = "Replace \\n with new line" })

-- Jumps and zz
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "{{", "{{zz")
vim.keymap.set("n", "}}", "}}zz")
vim.keymap.set("n", "[[", "[[zz")
vim.keymap.set("n", "]]", "]]zz")

-- Remove general keymap
vim.keymap.del("n", "<leader>bb")
-- Set find buffers mapping. This didn't work when setting it on Telescope spec
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
--
-- Paste from 0 register
vim.keymap.set("n", "<Leader>p", '"0p<CR>')
vim.keymap.set("v", "<Leader>p", '"0p<CR>')

-- Delete the move up and down keymaps
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
