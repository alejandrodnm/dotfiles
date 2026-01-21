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
  { "rcarriga/nvim-notify", enabled = false },
  { "akinsho/bufferline.nvim", opts = { options = { mode = "tabs" } } },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icons = LazyVim.config.icons
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
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {},
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
          -- { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          { LazyVim.lualine.pretty_path({ length = 10 }) },
        },
        lualine_x = {

          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
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
        lualine_z = {},
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
      {
        "ThePrimeagen/harpoon",
        config = function()
          require("telescope").load_extension("harpoon")
        end,
      },
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
    -- opts = function(_, opts)
    --   local actions = require("telescope.actions")
    --   opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
    --   opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
    --   opts.defaults.mappings.i["<C-h>"] = actions.results_scrolling_left
    --   opts.defaults.mappings.i["<C-l>"] = actions.results_scrolling_right
    --   opts.defaults.mappings.i["<M-l>"] = actions.complete_tag
    -- end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function()
      -- Needed for trees-context floating win border
      -- https://github.com/neovim/neovim/issues/17996#issuecomment-1186208986
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#021316" })
    end,
  },
  { "nvim-mini/mini.pairs", enabled = false },
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
        -- sqlfluff = {
        --   args = { "fix", "--dialect=postgres", "--config=/Users/adn/.sqlfluff", "-" },
        --   stdin = true,
        --   cwd = require("conform.util").root_file({
        --     ".git",
        --   }),
        -- },
      },
      formatters_by_ft = {
        sql = {},
        -- pgsql = { "sql_formatter" },
        -- python = { "black" },
        c = { "clang_format" },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      { "<leader>h", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon" },
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
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     debug = false, -- Enable debugging
  --     model = "claude-3.5-sonnet",
  --     -- See Configuration section for rest
  --   },
  -- },
  {
    "snacks.nvim",
    ---@type snacks.Config
    opts = {
      scroll = { enabled = false },
      ---@type table<string, snacks.win.Config>
      styles = {
        zen = {
          backdrop = { transparent = false, blend = 40 },
        },
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      require("outline").setup({
        providers = {
          priority = { "lsp", "coc", "markdown", "norg", "treesitter" },
        },
      })
    end,
    event = "VeryLazy",
    dependencies = {
      "epheien/outline-treesitter-provider.nvim",
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
    },
  },
}
