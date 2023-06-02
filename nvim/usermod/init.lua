-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('usermod.plugins')
require('usermod.lsp')
require('usermod.maps')

vim.o.swapfile = false
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false

-- Maintain undo history between sessions
vim.o.undofile = true

vim.cmd('filetype plugin indent on')

-- Use pl for prolog and not perl
vim.g.filetype_pl = 'prolog'

-- COLORS
-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- Show status bar on single window
vim.o.laststatus = 2
vim.wo.cursorline = true
vim.o.encoding = "UTF-8"
vim.cmd("syntax enable")
vim.g.airline_theme = 'deus'
vim.o.background = "dark"
vim.cmd("colorscheme material-theme")
vim.cmd("highlight Visual guifg=White guibg=LightBlue gui=none")
vim.cmd("highlight MatchParen gui=bold guibg=none guifg=LightMagenta")
vim.cmd("highlight Comment cterm=italic gui=italic")
-- Highlight search matches
vim.o.hlsearch = true
vim.cmd("highlight Search ctermbg=black ctermfg=cyan term=bold cterm=bold")

-- CURSOR
-- Set timeoutlen and ttimeoutlen for escape delay
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0

-- Enable clipboard with unnamedplus option
vim.o.clipboard = "unnamedplus"

-- Enable backspace in insert mode
vim.o.backspace = "indent,eol,start"

-- Use spaces instead of tabs
vim.o.expandtab = true
vim.o.smarttab = true

-- Set the number of spaces for each indentation level
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- TEXT, TAB AND INDENT RELATED
vim.o.linebreak = true
-- Highlight column at 80 characters
vim.o.colorcolumn = "80"
-- Display line numbers
vim.wo.number = true
-- Disable error bells
vim.o.errorbells = false
-- Show ruler with current line and column numbers
vim.o.ruler = true
-- Set number of lines to keep above and below cursor when scrolling
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
-- Enable confirmation prompts for some commands
vim.o.confirm = true
-- Enable reading and executing local .vimrc files
vim.o.exrc = true
-- Open new splits below and to the right
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = "auto:2"
