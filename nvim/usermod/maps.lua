-- Change the <leader> key to comma instead of \ "
vim.g.mapleader = ','
-- vim.keymap.set('n', '<leader>', ":WhichKey ',' <CR>", {
--   silent = true,
--   desc = 'Leader options (WhichKey)'
-- })

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

-- Debugger DAP
vim.keymap.set('n', '<leader>dt', '<CMD>lua require("dapui").toggle()<CR>')
vim.keymap.set('n', '<leader>dc', '<CMD>lua require("dap").continue()<CR>')
vim.keymap.set('n', '<leader>dr', '<CMD>lua require("dap").run_last()<CR>')
vim.keymap.set('n', '<leader>db', '<CMD>lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>dbl', '<CMD>lua require("dap").list_breakpoints()<CR>')
vim.keymap.set('n', '<leader>dbc', '<CMD>lua require("dap").clear_breakpoints()<CR>')
vim.keymap.set('n', '<leader>dt', '<CMD>lua require("dapui").toggle()<CR>')
vim.keymap.set('n', '<leader>de', '<CMD>lua require("dapui").eval()<CR>')
vim.keymap.set('n', '<leader>dn', '<CMD>lua require("dap").step_over()<CR>')
vim.keymap.set('n', '<leader>ds', '<CMD>lua require("dap").step_into()<CR>')
vim.keymap.set('n', '<leader>do', '<CMD>lua require("dap").step_out()<CR>')
vim.keymap.set('n', '<Leader>dl', '<CMD>lua require("dap").repl.open()<CR>')
vim.keymap.set({'n', 'v'}, '<Leader>dh', '<CMD>lua require("dap.ui.widgets").hover()<CR>')
vim.keymap.set({'n', 'v'}, '<Leader>dp', '<CMD>lua require("dap.ui.widgets").preview()<CR>')
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>dv', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
