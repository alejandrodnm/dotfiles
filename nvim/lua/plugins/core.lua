-- change trouble config
return {
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
    keys = {
      { "<leader>p", false },
      {
        "<leader>P",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    opts = {},
    keys = {
      { "<leader>tt", false },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File",
      },
    },
  },
  -- interative rename
  { "smjonas/inc-rename.nvim", config = true },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = { "W391", "E501" },
                  maxLineLength = 120,
                },
              },
            },
          },
        },
        rust_analyzer = {
          keys = {
            { "<leader>cR", false },
            { "<leader>cr", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- Change rename from `<leader>cr` to `<leader>cR`
      keys[#keys + 1] = { "<leader>cr", false }

      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>cn",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>cn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.formatting.sqlfmt,
      })
    end,
  },
  { "rcarriga/nvim-notify", enabled = false },
  { "akinsho/bufferline.nvim", opts = { options = { mode = "tabs" } } },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")

      opts.inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }

      opts.sections = vim.tbl_extend("force", opts.sections, {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = {
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.fg("Debug"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {},
        lualine_z = {
          { "progress", separator = "", padding = { left = 0, right = 0 } },
          { "location", padding = { left = 0, right = 0 } },
        },
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          keys = {
            "f",
            "F",
            "t",
            "T",
            ";",
          },
        },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { ",,", false },
      -- disable the keymap to grep files
      { "<leader>/", false },
      -- disable telescope git mappings
      { "<leader>gc", false },
      { "<leader>gs", false },
      -- find files
      { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Git status files" },
      {
        "<leader>ch",
        '<cmd>lua require("dash.providers.telescope").dash({ bang = false, initial_text = "" })<cr>',
        desc = "Dash",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-c>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function()
      -- Needed for trees-context floating win border
      -- https://github.com/neovim/neovim/issues/17996#issuecomment-1186208986
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#021316" })
    end,
  },
  { "echasnovski/mini.pairs", enabled = false },
}
