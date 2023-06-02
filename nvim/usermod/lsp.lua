local lsp = require('lsp-zero').preset({
  float_border = 'rounded',
  call_servers = 'local',
  configure_diagnostics = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = true,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

local function lsp_mappings (_, bufnr)
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
  vim.keymap.set('n', '<leader>ln', function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true, remap = false, buffer = bufnr })
  map('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('x', '<Leader>la', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  map('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')

  -- Diagnostics
  map('n', '<Leader>ld', '<cmd>TroubleToggle<cr>')
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

  -- vim.keymap.set({"n", "i", "s"}, "<c-f>", function()
  --   if not require("noice.lsp").scroll(4) then
  --     return "<c-f>"
  --   end
  -- end, { silent = true, expr = true })

  -- vim.keymap.set({"n", "i", "s"}, "<c-b>", function()
  --   if not require("noice.lsp").scroll(-4) then
  --     return "<c-b>"
  --   end
  -- end, { silent = true, expr = true })
end

-- The specific language configs should go above this line otherwise the
-- mappings are removed.
lsp.on_attach(lsp_mappings)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E501'},
          maxLineLength = 120
        }
      }
    }
  }
}

lsp.setup()


local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'path'},
    {name = 'luasnip', keyword_length = 2},
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.confirm({select = true}),
    ['<C-n>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
  })
})

require('trouble').setup{}

require('null-ls').setup({
	debug = true,
  sources = {
    require('null-ls').builtins.diagnostics.golangci_lint.with({
      -- Remove the --fast argument
      args = {
          'run',
          '--fix=false',
          '--out-format=json',
          '$DIRNAME',
          '--path-prefix',
          '$ROOT',
      },
    }),
    require('null-ls').builtins.formatting.sqlfluff.with({
      extra_args = { '--dialect', 'postgres' }, -- change to your dialect
    }),
  },
})

local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/") or ""
local codelldb_path = path .. "adapter/codelldb"
local liblldb_path = path .. "lldb/lib/liblldb.dylib"

local rt = require('rust-tools')
rt.setup({
  server = {
    on_attach = function(x, bufnr)
      lsp_mappings(x, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<Leader>r', "<cmd>lua require('rust-tools').hover_actions.hover_actions()<CR>", { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<Leader>rr', "<cmd>lua require('rust-tools').code_action_group.code_action_group()<CR>", { buffer = bufnr })
    end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}
			}
		}
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  }
})

require("dapui").setup()
require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param _buf number
    --- @param _stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param _node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, _buf, _stackframe, _node)
      return variable.name .. ' = ' .. variable.value
    end,

    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
