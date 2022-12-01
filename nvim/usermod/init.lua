-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('usermod.plugins')
require('usermod.lsp')
require('usermod.maps')

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


vim.o.swapfile = false
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false

-- Maintain undo history between sessions
vim.o.undofile = true
vim.o.undodir = '~/.local/share/nvim/undodir/'

vim.cmd('filetype plugin indent on')


-- Use pl for prolog and not perl
vim.g.filetype_pl = 'prolog'
