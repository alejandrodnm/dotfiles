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
