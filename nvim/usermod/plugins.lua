local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
-- Themes
Plug('crusoexia/vim-monokai')
Plug('jdkanani/vim-material-theme')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- Experimental syntax

Plug('folke/which-key.nvim')
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
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-vsnip'                             )

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
Plug('rcarriga/nvim-dap-ui')
Plug('theHamsta/nvim-dap-virtual-text')

Plug('mrjones2014/dash.nvim', {['do'] = 'make install'}) -- search Dash from telescope

Plug('simnalamburt/vim-mundo') -- undo visualization

Plug('simrat39/symbols-outline.nvim') -- lsp symbols window
-- Debugger
-- Plug 'mfussenegger/nvim-dap' -- debugger
-- Plug 'theHamsta/nvim-dap-virtual-text'
-- Plug 'puremourning/vimspector'

-- GO
Plug('fatih/vim-go', {['for'] = 'go'})
Plug('sebdah/vim-delve', {['for'] = 'go'})

-- Python
-- Plug 'fisadev/vim-isort'  -- Python imports
-- Plug 'vim-scripts/indentpython.vim'
-- Plug 'davidhalter/jedi'
-- Plug 'zchee/deoplete-jedi'
-- Plug 'ambv/black', {'rtp': 'vim'}

-- JS and related
-- Plug 'pangloss/vim-javascript'
-- Plug 'leafgarland/typescript-vim'
-- Plug 'peitalin/vim-jsx-typescript'
-- Plug 'jparise/vim-graphql'
-- Plug 'hail2u/vim-css3-syntax'
-- Plug 'cakebaker/scss-syntax.vim'

-- Elixir
Plug('elixir-editors/vim-elixir')
Plug('mhinz/vim-mix-format', {['for'] = 'elixir'})

-- Haskell
-- Plug 'ndmitchell/ghcid', {'rtp': 'plugins/nvim'}
-- Plug 'neovimhaskell/haskell-vim'

-- Markdown
Plug('plasticboy/vim-markdown', {['for'] = 'markdown'})
Plug('iamcco/markdown-preview.nvim', {
  ['do'] = function()
    vim.call('mkdp#util#install')
  end,
  ['for'] = {'markdown', 'vim-plug'}
})

Plug('exu/pgsql.vim', {['for'] = 'sql'})

Plug('rust-lang/rust.vim', {['for'] = 'rust'})
Plug('simrat39/rust-tools.nvim', {['for'] = 'rust'})

Plug('godlygeek/tabular', {['for'] = {'puppet', 'markdown'}})  -- Autotabs for puppet and markdown table format

-- Plug 'hashivim/vim-terraform'
-- Plug 'rodjek/vim-puppet'
-- Plug 'jalvesaq/Nvim-R'
-- Plug 'lervag/vimtex', {'for': 'latex'}  -- Support for latex files and projects

vim.call('plug#end')

-- Terraform
-- vim.g.terraform_fmt_on_save = 1
-- vim.g.terraform_align = 1

-- Highlight is broken so we have to specified the whole config
-- https://github.com/simrat39/symbols-outline.nvim/issues/185#issuecomment-1312618041
require("symbols-outline").setup({
  symbols = {
    File = {hl = "@text.uri" },
    Module = {hl = "@namespace" },
    Namespace = {hl = "@namespace" },
    Package = {hl = "@namespace" },
    Class = {hl = "@type" },
    Method = {hl = "@method" },
    Property = {hl = "@method" },
    Field = {hl = "@field" },
    Constructor = {hl = "@constructor" },
    Enum = {hl = "@type" },
    Interface = {hl = "@type" },
    Function = {hl = "@function" },
    Variable = {hl = "@constant" },
    Constant = {hl = "@constant" },
    String = {hl = "@string" },
    Number = {hl = "@number" },
    Boolean = {hl = "@boolean" },
    Array = {hl = "@constant" },
    Object = {hl = "@type" },
    Key = {hl = "@type" },
    Null = {hl = "@type" },
    EnumMember = {hl = "@field" },
    Struct = {hl = "@type" },
    Event = {hl = "@type" },
    Operator = {hl = "@operator" },
    TypeParameter = {hl = "@parameter" },
  },
})

require('telescope').setup({
  pickers = {
    lsp_references = { show_line = false },
    lsp_implementations = { show_line = false },
  },
})

require('telescope').load_extension('fzf')

require("which-key").setup()
