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
