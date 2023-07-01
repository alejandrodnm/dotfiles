local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.vim/plugged")
-- Themes
Plug("crusoexia/vim-monokai")
Plug("jdkanani/vim-material-theme")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" }) -- Experimental syntax

-- Plug('MunifTanjim/nui.nvim')
-- Plug('rcarriga/nvim-notify')
Plug("folke/which-key.nvim")
-- Plug('folke/noice.nvim') -- UI messages
Plug("smjonas/inc-rename.nvim") -- interative rename
Plug("junegunn/vim-peekaboo") -- show \" and @ register content
Plug("vim-test/vim-test")
Plug("terryma/vim-multiple-cursors")
Plug("scrooloose/nerdcommenter") -- Comment blocks of codes
Plug("scrooloose/nerdtree") -- File system explorer
Plug("Xuyuanp/nerdtree-git-plugin")
Plug("ryanoasis/vim-devicons")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")
Plug("tpope/vim-fugitive") -- Git support
Plug("tpope/vim-rhubarb") --GBrowse support
Plug("tpope/vim-endwise")
Plug("mileszs/ack.vim") -- Search folders with ag
Plug("tpope/vim-unimpaired") -- Mappings
Plug("vim-airline/vim-airline") -- Status line info
Plug("vim-airline/vim-airline-themes")
Plug("airblade/vim-gitgutter") -- Shows git signs
Plug("junegunn/fzf.vim") -- Fuzzy search
Plug("junegunn/fzf")
Plug("ntpeters/vim-better-whitespace") -- Showing and removing trailing whitespaces
Plug("https://github.com/alok/notational-fzf-vim") -- Note taking
Plug("szw/vim-maximizer")
Plug("Yggdroot/indentLine")
Plug("jamessan/vim-gnupg")
Plug("nvim-treesitter/nvim-treesitter-context")

-- LSP Support
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

-- Autocompletion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("saadparwaiz1/cmp_luasnip")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp-signature-help")
Plug("hrsh7th/cmp-vsnip")

--  Snippets
Plug("L3MON4D3/LuaSnip")
Plug("rafamadriz/friendly-snippets")

Plug("VonHeikemen/lsp-zero.nvim", { ["branch"] = "v2.x" })

Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.0" })
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })

Plug("folke/trouble.nvim")

-- Formatter and linters
Plug("jose-elias-alvarez/null-ls.nvim")
-- Debugger
Plug("mfussenegger/nvim-dap")
Plug("rcarriga/nvim-dap-ui")
Plug("theHamsta/nvim-dap-virtual-text")

Plug("mrjones2014/dash.nvim", { ["do"] = "make install" }) -- search Dash from telescope

Plug("simnalamburt/vim-mundo") -- undo visualization

Plug("simrat39/symbols-outline.nvim") -- lsp symbols window

-- GO
Plug("fatih/vim-go", { ["for"] = "go" })
Plug("sebdah/vim-delve", { ["for"] = "go" })

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
Plug("elixir-editors/vim-elixir")
Plug("mhinz/vim-mix-format", { ["for"] = "elixir" })

-- Haskell
-- Plug 'ndmitchell/ghcid', {'rtp': 'plugins/nvim'}
-- Plug 'neovimhaskell/haskell-vim'

-- Markdown
Plug("plasticboy/vim-markdown", { ["for"] = "markdown" })
Plug("iamcco/markdown-preview.nvim", {
	["do"] = function()
		vim.call("mkdp#util#install")
	end,
	["for"] = { "markdown", "vim-plug" },
})

Plug("exu/pgsql.vim", { ["for"] = "sql" })

Plug("rust-lang/rust.vim", { ["for"] = "rust" })
Plug("simrat39/rust-tools.nvim", { ["for"] = "rust" })

Plug("godlygeek/tabular", { ["for"] = { "puppet", "markdown" } }) -- Autotabs for puppet and markdown table format

Plug("hashivim/vim-terraform")
-- Plug 'rodjek/vim-puppet'
-- Plug 'jalvesaq/Nvim-R'
-- Plug 'lervag/vimtex', {'for': 'latex'}  -- Support for latex files and projects

vim.call("plug#end")

require("inc_rename").setup()

-- Terraform
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

-- Highlight is broken so we have to specified the whole config
-- https://github.com/simrat39/symbols-outline.nvim/issues/185#issuecomment-1312618041
require("symbols-outline").setup({
	symbols = {
		File = { hl = "@text.uri" },
		Module = { hl = "@namespace" },
		Namespace = { hl = "@namespace" },
		Package = { hl = "@namespace" },
		Class = { hl = "@type" },
		Method = { hl = "@method" },
		Property = { hl = "@method" },
		Field = { hl = "@field" },
		Constructor = { hl = "@constructor" },
		Enum = { hl = "@type" },
		Interface = { hl = "@type" },
		Function = { hl = "@function" },
		Variable = { hl = "@constant" },
		Constant = { hl = "@constant" },
		String = { hl = "@string" },
		Number = { hl = "@number" },
		Boolean = { hl = "@boolean" },
		Array = { hl = "@constant" },
		Object = { hl = "@type" },
		Key = { hl = "@type" },
		Null = { hl = "@type" },
		EnumMember = { hl = "@field" },
		Struct = { hl = "@type" },
		Event = { hl = "@type" },
		Operator = { hl = "@operator" },
		TypeParameter = { hl = "@parameter" },
	},
})

require("telescope").setup({
	pickers = {
		lsp_references = { show_line = false },
		lsp_implementations = { show_line = false },
	},
	extensions = {
		dash = {
			file_type_keywords = { sql = { "psql" } },
		},
	},
})

require("telescope").load_extension("fzf")
-- require('telescope').load_extension('noice')

require("which-key").setup()
-- WhichKey: checking conflicting keymaps ~
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **",xg"**
-- - rhs: `:lua DebugNearest()<CR>`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **",db"**
-- - rhs: `<Cmd>lua require("dap").toggle_breakpoint()<CR>`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"]x"**
-- - rhs: `<Plug>(unimpaired-xml-decode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"]C"**
-- - rhs: `<Plug>(unimpaired-string-decode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"]u"**
-- - rhs: `<Plug>(unimpaired-url-decode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"]y"**
-- - rhs: `<Plug>(unimpaired-string-decode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"[x"**
-- - rhs: `<Plug>(unimpaired-xml-encode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"[C"**
-- - rhs: `<Plug>(unimpaired-string-encode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"[u"**
-- - rhs: `<Plug>(unimpaired-url-encode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"[y"**
-- - rhs: `<Plug>(unimpaired-string-encode)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"<lt>s"**
-- - rhs: `<Plug>(unimpaired-enable)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"{"**
-- - rhs: ` `
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"}"**
-- - rhs: ` `

vim.g.rustfmt_autosave = 1

-- require("noice").setup({
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true, -- use a classic bottom cmdline for search
--     command_palette = true, -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = false, -- add a border to hover docs and signature help
--   },
-- })

-- Markdown

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = vim.api.nvim_create_augroup("markdown_settings", { clear = true }),
	callback = function()
		vim.opt.formatoptions:remove({ "q" })
		vim.opt_local.formatlistpat = "^\\s*\\d+\\.\\s+\\|^\\s*[-*+]\\s+"
		vim.opt.textwidth = 79
	end,
})

vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_new_list_item_indent = 0

-- Typescript/Javascript

local js_settings = vim.api.nvim_create_augroup("js_settings", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
	pattern = "*.tsx",
	callback = function()
		vim.bo.filetype = "typescript.tsx"
	end,
	group = js_settings,
})

vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
	pattern = "*.jsx",
	callback = function()
		vim.bo.filetype = "javascript.jsx"
	end,
	group = js_settings,
})

-- Define the highlight group attributes
local highlight_attrs = {
	fg = "#E06C75", -- dark red
}

-- Set the highlight group attributes
vim.api.nvim_set_hl(0, "tsxTagName", highlight_attrs)

highlight_attrs = {
	fg = "#F99575", -- orange
}

vim.api.nvim_set_hl(0, "tsxCloseString", highlight_attrs)
vim.api.nvim_set_hl(0, "tsxCloseTag", highlight_attrs)
vim.api.nvim_set_hl(0, "tsxCloseTagName", highlight_attrs)
vim.api.nvim_set_hl(0, "tsxAttributeBraces", highlight_attrs)
vim.api.nvim_set_hl(0, "tsxEqual", highlight_attrs)

highlight_attrs = {
	fg = "#F8BD7F", -- yellow
	cterm = { italic = true },
}

vim.api.nvim_set_hl(0, "tsxAttrib", highlight_attrs)

-- Indent
vim.g.indentLine_char_list = { "|", "¦", "┆", "┊" }
vim.g.indentLine_enabled = 0

-- Maximizer
vim.g.maximizer_set_default_mapping = 0
vim.keymap.set("n", "<silent><C-w>z", ":MaximizerToggle!<CR>")
vim.g.maximizer_set_mapping_with_bang = 1

-- Notational
vim.g.nv_search_paths = { "~/dev/adn/notes" }
vim.g.nv_use_short_pathnames = 1

-- vim-better-whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.strip_whitelines_at_eof = 1
vim.g.show_spaces_that_precede_tabs = 1

-- pgsql
vim.g.sql_type_default = "pgsql"

-- Git
-- Fugitive
vim.api.nvim_create_user_command("Browse", "silent exe '!open ' . '<args>'", { nargs = 1 })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gd", ":Gvdiffsplit<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gl", ":0Gclog<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gr", ":Gread<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gw", ":Gwrite<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gc", ":Git commit<CR>", { silent = true })

-- GitGutter
vim.g.gitgutter_map_keys = 0
vim.api.nvim_set_keymap("n", "]c", "<Plug>(GitGutterNextHunk)", { silent = true })
vim.api.nvim_set_keymap("n", "[c", "<Plug>(GitGutterPrevHunk)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gg", ":GitGutterAll<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ga", "<Plug>(GitGutterStageHunk)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gu", "<Plug>(GitGutterUndoHunk)", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gp", "<Plug>(GitGutterPreviewHunk)", { silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>gm",
	':Gdiff main <bar> let g:gitgutter_diff_base = "main"<CR>',
	{ silent = true }
)

-- Set updatetime to reduce the time to make signs appear
vim.o.updatetime = 100

-- Search modified git files
vim.api.nvim_set_keymap("n", "<Leader>gf", "<cmd>lua require('telescope.builtin').git_status()<CR>", { silent = true })

-- Current buffer symbols
vim.api.nvim_set_keymap("n", "<Leader>tb", ":SymbolsOutline<CR>", { silent = true })

-- Airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_section_z = "%3p%% %4l%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# %3v"
vim.g["airline#extensions#default#section_truncate_width"] = {
	b = 100,
	x = 100,
	y = 150,
	z = 45,
	warning = 80,
	error = 80,
}
vim.g["airline#extensions#default#layout"] = {
	{ "a", "c" },
	{ "x", "z", "error", "warning" },
}

-- NERDTree
vim.api.nvim_set_keymap("n", "<Leader>e", ":NERDTreeToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>E", ":NERDTreeFind<CR>", { silent = true })
vim.g.NERDTreeIgnore = { "\\.pyc$", "__pycache__" }
vim.g.NERDTreeWinSize = 50

-- Debugger DAP
vim.keymap.set("n", "<leader>dt", '<CMD>lua require("dapui").toggle()<CR>')
vim.keymap.set("n", "<leader>dc", '<CMD>lua require("dap").continue()<CR>')
vim.keymap.set("n", "<leader>dr", '<CMD>lua require("dap").run_last()<CR>')
vim.keymap.set("n", "<leader>db", '<CMD>lua require("dap").toggle_breakpoint()<CR>')
vim.keymap.set("n", "<leader>dbl", '<CMD>lua require("dap").list_breakpoints()<CR>')
vim.keymap.set("n", "<leader>dbc", '<CMD>lua require("dap").clear_breakpoints()<CR>')
vim.keymap.set("n", "<leader>dt", '<CMD>lua require("dapui").toggle()<CR>')
vim.keymap.set("n", "<leader>de", '<CMD>lua require("dapui").eval()<CR>')
vim.keymap.set("n", "<leader>dn", '<CMD>lua require("dap").step_over()<CR>')
vim.keymap.set("n", "<leader>ds", '<CMD>lua require("dap").step_into()<CR>')
vim.keymap.set("n", "<leader>do", '<CMD>lua require("dap").step_out()<CR>')
vim.keymap.set("n", "<Leader>dl", '<CMD>lua require("dap").repl.open()<CR>')
vim.keymap.set({ "n", "v" }, "<Leader>dh", '<CMD>lua require("dap.ui.widgets").hover()<CR>')
vim.keymap.set({ "n", "v" }, "<Leader>dp", '<CMD>lua require("dap.ui.widgets").preview()<CR>')
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>dv", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

vim.g.multi_cursor_use_default_mapping = 0
vim.g.multi_cursor_start_word_key = "<C-c>"
vim.g.multi_cursor_select_all_word_key = "<A-n>"
vim.g.multi_cursor_start_key = "g<C-n>"
vim.g.multi_cursor_select_all_key = "g<A-n>"
vim.g.multi_cursor_next_key = "<C-c>"
vim.g.multi_cursor_prev_key = "<C-p>"
vim.g.multi_cursor_skip_key = "<C-x>"
vim.g.multi_cursor_quit_key = "<Esc>"

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "rust", "markdown", "lua", "vim", "elixir" }, -- one of "all", "language", or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
})

require("treesitter-context").setup({ separator = "-" })

-- Needed for trees-context floating win border
-- https://github.com/neovim/neovim/issues/17996#issuecomment-1186208986
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#021316" })
vim.api.nvim_set_keymap("n", "<Leader>lh", ":write <bar> edit <bar> TSBufEnable highlight<CR>", { silent = true })

-- NERDCommenter
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1
-- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDDefaultAlign = "left"
-- Disable mappings and add Toggle manually
vim.g.NERDCreateDefaultMappings = 0
vim.api.nvim_set_keymap("n", "<leader>/", "<plug>NERDCommenterToggle", {})
vim.api.nvim_set_keymap("v", "<leader>/", "<plug>NERDCommenterToggle", {})

-- JSON FORMAT
vim.api.nvim_set_keymap("n", "<Leader>j", ":!python3 -m json.tool<CR>", { silent = true })

-- vim-markdown
vim.g.vim_markdown_folding_disabled = 1

-- Ack
if vim.fn.executable("rg") == 1 then
	vim.g.ackprg = "rg --vimgrep --no-heading"
end

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>Telescope grep_string<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>u", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {})
vim.api.nvim_set_keymap(
	"n",
	"<Leader>h",
	'<cmd>lua require("dash.providers.telescope").dash({ bang = false, initial_text = "" })<cr>',
	{}
)
vim.api.nvim_set_keymap("n", "z=", "<cmd>Telescope spell_suggest<cr>", {})
vim.api.nvim_set_keymap("n", "<Leader>c", ":History:<CR>", {})
vim.api.nvim_set_keymap("n", "<C-P>", "@:<CR>", {})

-- Find command
--column: Show column number
--line-number: Show line number
--no-heading: Do not show file headings in results
--fixed-strings: Search term as a literal string
--ignore-case: Case insensitive search
--no-ignore: Do not respect .gitignore, etc...
--hidden: Search hidden files and folders
--follow: Follow symlinks
--glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
--color: Search color options
vim.api.nvim_create_user_command(
	"Find",
	"call fzf#vim#grep('rg --column --color \"always\" --line-number --no-heading --hidden --follow ' .. <q-args>, 1, <bang>0)",
	{ bang = true, nargs = "*" }
)

-- Rg command
vim.cmd(
	"command! -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. shellescape(<q-args>), 1, { 'options': '--delimiter : --nth 2..' })"
)

vim.api.nvim_create_user_command(
	"Rg",
	"call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. shellescape(<q-args>), 1, { 'options': '--delimiter : --nth 2..' })",
	{ nargs = "*" }
)

-- vim-test
vim.g.delve_new_command = "tabnew"

function DebugNearest()
	vim.g.test_go_runner = "delve"
	vim.cmd("TestNearest")
	vim.g.test_go_runner = nil
end

function DlvTestRun(...)
	vim.fn["delve#dlvTest"](select(1, ...), "-- -test.v  -test.count=1 --test.run=" .. unpack(..., 2))
end

vim.api.nvim_set_keymap("n", "<leader>xn", ":TestNearest<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xf", ":TestFile<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xs", ":TestSuite<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xl", ":TestLast<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xv", ":TestVisit<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xg", ":lua DebugNearest()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xgb", ":DlvToggleBreakpoint<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>xgc", ":DlvClearAll<CR>", {})

-- Mix-format
vim.g.mix_format_on_save = 1
vim.g.mix_format_silent_errors = 1

-- Golang
vim.api.nvim_command("autocmd FileType go nmap <Leader>se :GoDeclsDir<CR>")
vim.api.nvim_command("autocmd FileType go nmap <Leader>si <Plug>(go-info)")
vim.api.nvim_command("autocmd FileType go nmap <Leader>sm <Plug>(go-implements)")
vim.api.nvim_command("autocmd FileType go nmap <leader>st <Plug>(go-test-func)")
vim.api.nvim_command("autocmd FileType go nmap <leader>sy <Plug>(go-test)")
vim.api.nvim_command("autocmd FileType go nmap <leader>sd <Plug>(go-doc)")
vim.api.nvim_command("autocmd FileType go nmap <leader>sp <Plug>(go-channelpeers)")
vim.api.nvim_command("autocmd FileType go nmap <leader>sc <Plug>(go-callers)")

-- Mundo
vim.api.nvim_command("nmap <leader>m :MundoToggle<CR>")

function DeleteHiddenBuffers()
	local bufnrs = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(bufnrs) do
		if vim.api.nvim_buf_is_valid(bufnr) and not vim.api.nvim_buf_get_option(bufnr, "buflisted") then
			vim.api.nvim_buf_delete(bufnr, { force = true })
		end
	end
end

vim.api.nvim_set_keymap("n", "<leader>z", ":lua DeleteHiddenBuffers()<CR>", { noremap = true, silent = true })

function CreateCenteredFloatingWindow()
	local width = math.floor(vim.api.nvim_get_option("columns") * 0.6)
	local height = math.floor(vim.api.nvim_get_option("lines") * 0.6)
	local top = math.floor((vim.api.nvim_get_option("lines") - height) / 2) - 1
	local left = math.floor((vim.api.nvim_get_option("columns") - width) / 2)
	local opts = {
		relative = "editor",
		row = top,
		col = left,
		width = width,
		height = height,
		style = "minimal",
	}

	local top_line = "╭" .. string.rep("─", width - 2) .. "╮"
	local mid_line = "│" .. string.rep(" ", width - 2) .. "│"
	local bot_line = "╰" .. string.rep("─", width - 2) .. "╯"
	local lines = { top_line }
	for _ = 1, height - 2 do
		table.insert(lines, mid_line)
	end
	table.insert(lines, bot_line)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
	vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_win_set_option(0, "winhl", "Normal:Floating")

	opts.row = opts.row + 1
	opts.height = opts.height - 2
	opts.col = opts.col + 2
	opts.width = opts.width - 4
	vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, opts)

	vim.api.nvim_command("autocmd BufWipeout <buffer> execute 'bw " .. buf .. "'")
end

vim.g.peekaboo_window = "lua CreateCenteredFloatingWindow()"
