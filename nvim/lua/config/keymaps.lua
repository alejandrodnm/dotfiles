-- Keymaps are automatically loaded on the VeryLazy eventmap
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set('n', '<localleader>', ":WhichKey '\\' <CR>", {
--   silent = true,
--   desc = 'Local leader options (WhichKey)'
-- })

-- Insert space in normal mode
vim.keymap.set("n", "<Space>", "i<Space><Right><Esc>")

-- Quit
vim.keymap.set("n", "<Leader>q", ":quit<CR>")
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
vim.keymap.set("n", "<Leader>tt", ":$tabnew<CR>")
vim.keymap.set("n", "<Leader>tc", ":tabclose<CR>")

-- Replace \n with enter
-- vim.keymap.set("n", "<Leader>n", ":'<,'>s/\\n/^M/g")

-- Jumps and zz
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "{{", "{{zz")
vim.keymap.set("n", "}}", "}}zz")
vim.keymap.set("n", "[[", "[[zz")
vim.keymap.set("n", "]]", "]]zz")

-- Show tabs
vim.keymap.set({ "n", "v" }, "<Leader>/", function()
  return MiniComment.operator() .. "_"
end, { expr = true, desc = "Comment line" })

-- Remove general keymap
vim.keymap.del("n", "<leader>bb")
-- Set find buffers mapping. This didn't work when setting it on Telescope spec
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
--
-- Paste from 0 register
vim.keymap.set("n", "<Leader>p", '"0p<CR>')
vim.keymap.set("v", "<Leader>p", '"0p<CR>')
