-- change trouble config
return {

  { "ahmedkhalf/project.nvim", enabled = false },
  {
    "stevearc/dressing.nvim",
    opts = {
      select = {
        telescope = nil,
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
    keys = {
      { "<leader>p", mode = { "n", "x" }, false },
      {
        "<leader>P",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        mode = { "n", "x" },
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
      setup = {
        rust_analyzer = function()
          return true
        end,
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
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
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
      -- disable the keymap to change buffers
      { ",,", false },
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
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
      opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
      opts.defaults.mappings.i["<C-h>"] = actions.results_scrolling_left
      opts.defaults.mappings.i["<C-l>"] = actions.results_scrolling_right
      opts.defaults.mappings.i["<M-l>"] = actions.complete_tag
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-e>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-c>"] = cmp.mapping.abort(),

        -- This is using luasnip instead of the builtin snippets
        --
        --   ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
        --       cmp.select_next_item()
        --     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        --     -- this way you will only jump inside the snippet region
        --     elseif luasnip.expand_or_locally_jumpable() then
        --       luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        --   ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --       luasnip.jump(-1)
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        -- })
      })
    end,
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      for _, source in ipairs(opts.sources) do
        if source.name == "copilot" then
          source.priority = -100
        end
      end
    end,
    keys = {
      {
        "<Tab>",
        false,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<S-Tab>",
        false,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
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
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        -- markdown = { "vale" },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        --   sql_formatter = {
        --     command = "pg_format",
        --     args = "-f 1 -u 1 -U 1 -s 2 --no-space-function --no-extra-line --nogrouping -k",
        --   },
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
      formatters_by_ft = {
        -- sql = { "sql_formatter" },
        -- pgsql = { "sql_formatter" },
        -- python = { "black" },
        c = { "clang_format" },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = {
      { "<leader>h", "<cmd>Telescope harpoon marks<cr>", desc = "NeoTree" },
      {
        "<leader>HE",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
    },
  },
}
