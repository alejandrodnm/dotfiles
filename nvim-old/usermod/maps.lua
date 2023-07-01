-- Change the <leader> key to comma instead of \ "
vim.g.mapleader = ','

vim.g.maplocalleader = '\\'
-- vim.keymap.set('n', '<localleader>', ":WhichKey '\\' <CR>", {
--   silent = true,
--   desc = 'Local leader options (WhichKey)'
-- })

-- Insert space in normal mode
vim.keymap.set('n', '<Space>', 'i<Space><Right><Esc>')

-- Quit
vim.keymap.set('n', '<Leader>q', ':quit<CR>')
vim.keymap.set('n', '<Leader>k', ':bdelete<CR>')

-- Only
vim.keymap.set('n', '<Leader>o', ':only<CR>')

-- Move to first character
vim.keymap.set('n', '<C-l>', '$')
-- Move to last character
vim.keymap.set('n', '<C-h>', '^')

-- Move to first character
vim.keymap.set('n', '<C-j>', '<C-e>')
-- Move to last character
vim.keymap.set('n', '<C-k>', '<C-y>')

-- Close lists
vim.keymap.set('n', '<Leader>i', ':lclose <bar> cclose <bar> pclose <bar> NERDTreeClose <CR>')

-- Paste from 0 register
vim.keymap.set('n', '<Leader>p', '"0p<CR>')
vim.keymap.set('v', '<Leader>p', '"0p<CR>')

-- sudo save
-- vim.keymap.set('c', 'w!!', "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- Tabs
vim.keymap.set('n', '<Leader>tt', ':$tabnew<CR>')
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>')

-- Replace \n with enter
vim.keymap.set('n', '<Leader>n', ":'<,'>s/\\n/^M/g")

-- Jumps and zz
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '{{', '{{zz')
vim.keymap.set('n', '}}', '}}zz')
vim.keymap.set('n', '[[', '[[zz')
vim.keymap.set('n', ']]', ']]zz')

-- Show tabs
vim.keymap.set('n', '<Leader><Space>', ':set invlist<CR>')
