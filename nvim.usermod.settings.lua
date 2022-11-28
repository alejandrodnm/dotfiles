local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
-- Themes
Plug('crusoexia/vim-monokai')
Plug('jdkanani/vim-material-theme')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- Experimental syntax

Plug('liuchengxu/vim-which-key') -- leader key suggestions
Plug('junegunn/vim-peekaboo') -- show \" and @ register content
Plug('vim-test/vim-test')
Plug('terryma/vim-multiple-cursors')
Plug('scrooloose/nerdcommenter')  -- Comment blocks of codes
Plug('scrooloose/nerdtree')  -- File system explorer
Plug('Xuyuanp/nerdtree-git-plugin')
Plug('ryanoasis/vim-devicons')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('tpope/vim-fugitive')  -- Git support
Plug('tpope/vim-rhubarb') --GBrowse support
Plug('tpope/vim-endwise')
Plug('mileszs/ack.vim') -- Search folders with ag
Plug('tpope/vim-unimpaired')  -- Mappings
Plug('vim-airline/vim-airline')  -- Status line info
Plug('vim-airline/vim-airline-themes')
Plug('airblade/vim-gitgutter')  -- Shows git signs
Plug('junegunn/fzf.vim') -- Fuzzy search
Plug('junegunn/fzf')
Plug('ludovicchabant/vim-gutentags') -- ctags handling
Plug('ntpeters/vim-better-whitespace') -- Showing and removing trailing whitespaces
Plug('https://github.com/alok/notational-fzf-vim') -- Note taking
Plug('szw/vim-maximizer')
Plug('Yggdroot/indentLine')
Plug('jamessan/vim-gnupg')
Plug('nvim-treesitter/nvim-treesitter-context')

-- (The latter must be installed before it can be used.)
-- Plug 'google/vim-maktaba'
-- Plug 'google/vim-codefmt'
-- `:help :Glaive` for usage.
-- Plug 'google/vim-glaive'

-- LSP Support
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')

--  Snippets
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

Plug('VonHeikemen/lsp-zero.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.0'})
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

Plug('folke/trouble.nvim')

-- Formatter and linters
Plug('jose-elias-alvarez/null-ls.nvim')
-- Debugger
Plug('mfussenegger/nvim-dap')

Plug('mrjones2014/dash.nvim', {['do'] = 'make install'}) -- search Dash from telescope

Plug('simnalamburt/vim-mundo') -- undo visualization

Plug('simrat39/symbols-outline.nvim') -- lsp symbols window
-- Debugger
-- Plug 'mfussenegger/nvim-dap' -- debugger
-- Plug 'theHamsta/nvim-dap-virtual-text'
-- Plug 'puremourning/vimspector'

-- Kotlin
-- Plug 'udalov/kotlin-vim'

-- GO
-- Plug 'zchee/deoplete-go', {'do': 'make'}
Plug('fatih/vim-go', {['for'] = 'go'})
Plug('alejandrodnm/vim-delve', {['for'] = 'go'})

-- Python
-- Plug 'fisadev/vim-isort'  -- Python imports
-- Plug 'vim-scripts/indentpython.vim'
-- Plug 'davidhalter/jedi'
-- Plug 'zchee/deoplete-jedi'
-- Plug 'ambv/black', {'rtp': 'vim'}

-- Elm
-- Plug 'pbogut/deoplete-elm'
-- Plug 'elmcast/elm-vim'

-- JS and related
-- Plug 'pangloss/vim-javascript'
-- Plug 'leafgarland/typescript-vim'
-- Plug 'peitalin/vim-jsx-typescript'
-- Plug 'jparise/vim-graphql'
-- Plug 'hail2u/vim-css3-syntax'
-- Plug 'cakebaker/scss-syntax.vim'

-- ReasonML
-- Plug 'reasonml-editor/vim-reason-plus'

-- Elixir
-- Plug 'elixir-editors/vim-elixir'

Plug('mhinz/vim-mix-format', {['for'] = 'elixir'})
-- Haskell
-- Plug 'ndmitchell/ghcid', {'rtp': 'plugins/nvim'}
-- Plug 'neovimhaskell/haskell-vim'

Plug('plasticboy/vim-markdown', {['for'] = 'markdown'})
Plug('iamcco/markdown-preview.nvim', {
  ['do'] = function()
    vim.call('mkdp#util#install')
  end,
  ['for'] = {'markdown', 'vim-plug'}
})

Plug('exu/pgsql.vim', {['for'] = 'sql'})

Plug('rust-lang/rust.vim', {['for'] = 'rust'})

Plug('godlygeek/tabular', {['for'] = {'puppet', 'markdown'}})  -- Autotabs for puppet and markdown table format

-- Plug 'hashivim/vim-terraform'
-- Plug 'rodjek/vim-puppet'
-- Plug 'raichoo/purescript-vim'
-- Plug 'jalvesaq/Nvim-R'
-- Plug 'lervag/vimtex', {'for': 'latex'}  -- Support for latex files and projects

vim.call('plug#end')
--
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

lsp.on_attach(function(_, bufnr)
  local map = function(mode, lhs, rhs)
    local opts = {remap = false, buffer = bufnr}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- LSP actions
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('n', '<Leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  map('n', '<Leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<cr>')
  map('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('x', '<Leader>la', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  map('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')

  -- Diagnostics
  map('n', '<Leader>ld', '<cmd>TroubleToggle<cr>')
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end)

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require('telescope').setup({
  pickers = {
    lsp_references = { show_line = false },
    lsp_implementations = { show_line = false },
  },
})

require('telescope').load_extension('fzf')

require("symbols-outline").setup()

require("trouble").setup{}

require("null-ls").setup({
	debug = true,
  sources = {
    require("null-ls").builtins.diagnostics.golangci_lint.with({
      -- Remove the --fast argument
      args = {
          "run",
          "--fix=false",
          "--out-format=json",
          "$DIRNAME",
          "--path-prefix",
          "$ROOT",
      },
    }),
    require("null-ls").builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
  },
})
