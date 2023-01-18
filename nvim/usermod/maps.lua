-- Change the <leader> key to comma instead of \ "
vim.g.mapleader = ','
vim.keymap.set('n', '<leader>', ":WhichKey ',' <CR>", {
  silent = true,
  desc = 'Leader options (WhichKey)'
})

vim.g.maplocalleader = '\\'
vim.keymap.set('n', '<localleader>', ":WhichKey '\\' <CR>", {
  silent = true,
  desc = 'Local leader options (WhichKey)'
})

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
