return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "ibhagwan/fzf-lua",
  --   },
  --   opts = {
  --     windows = {
  --       width = 50,
  --     },
  --     -- Default configuration
  --     hints = { enabled = true },
  --
  --     ---@alias AvanteProvider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  --     provider = "claude", -- Recommend using Claude
  --     auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  --     claude = {
  --       endpoint = "https://api.anthropic.com",
  --       model = "claude-3-5-sonnet-20241022",
  --       max_tokens = 8192,
  --     },
  --     copilot = {
  --       model = "claude-3.5-sonnet",
  --       temperature = 0,
  --       max_tokens = 8192,
  --     },
  --
  --     -- File selector configuration
  --     --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
  --     file_selector = {
  --       provider = "snacks", -- Avoid native provider issues
  --       provider_opts = {},
  --     },
  --   },
  --   build = LazyVim.is_win() and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   lazy = true,
  --   dependencies = { "saghen/blink.compat" },
  --   opts = {
  --     sources = {
  --       default = { "avante_commands", "avante_mentions", "avante_files" },
  --       compat = {
  --         "avante_commands",
  --         "avante_mentions",
  --         "avante_files",
  --       },
  --       -- LSP score_offset is typically 60
  --       providers = {
  --         avante_commands = {
  --           name = "avante_commands",
  --           module = "blink.compat.source",
  --           score_offset = 90,
  --           opts = {},
  --         },
  --         avante_files = {
  --           name = "avante_files",
  --           module = "blink.compat.source",
  --           score_offset = 100,
  --           opts = {},
  --         },
  --         avante_mentions = {
  --           name = "avante_mentions",
  --           module = "blink.compat.source",
  --           score_offset = 1000,
  --           opts = {},
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   optional = true,
  --   ft = function(_, ft)
  --     vim.list_extend(ft, { "Avante" })
  --   end,
  --   opts = function(_, opts)
  --     opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
  --   end,
  -- },
  -- {
  --   "folke/which-key.nvim",
  --   optional = true,
  --   opts = {
  --     spec = {
  --       { "<leader>a", group = "ai" },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.compat",
  --   lazy = true,
  --   opts = {},
  --   config = function()
  --     -- monkeypatch cmp.ConfirmBehavior for Avante
  --     require("cmp").ConfirmBehavior = {
  --       Insert = "insert",
  --       Replace = "replace",
  --     }
  --   end,
  -- },
  {
    "GeorgesAlkhouri/nvim-aider",
    cmd = "Aider",
    -- Example key mappings for common actions:
    keys = {
      { "<leader>a/", "<cmd>Aider toggle<cr>", desc = "Toggle Aider" },
      { "<leader>as", "<cmd>Aider send<cr>", desc = "Send to Aider", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>Aider command<cr>", desc = "Aider Commands" },
      { "<leader>ab", "<cmd>Aider buffer<cr>", desc = "Send Buffer" },
      { "<leader>a+", "<cmd>Aider add<cr>", desc = "Add File" },
      { "<leader>a-", "<cmd>Aider drop<cr>", desc = "Drop File" },
      { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
      { "<leader>aR", "<cmd>Aider reset<cr>", desc = "Reset Session" },
      -- Example nvim-tree.lua integration if needed
      { "<leader>a+", "<cmd>AiderTreeAddFile<cr>", desc = "Add File from Tree to Aider", ft = "NvimTree" },
      { "<leader>a-", "<cmd>AiderTreeDropFile<cr>", desc = "Drop File from Tree from Aider", ft = "NvimTree" },
    },
    dependencies = {
      "folke/snacks.nvim",
      --- The below dependencies are optional
      "catppuccin/nvim",
      "nvim-tree/nvim-tree.lua",
      --- Neo-tree integration
      {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
          -- Example mapping configuration (already set by default)
          -- opts.window = {
          --   mappings = {
          --     ["+"] = { "nvim_aider_add", desc = "add to aider" },
          --     ["-"] = { "nvim_aider_drop", desc = "drop from aider" }
          --     ["="] = { "nvim_aider_add_read_only", desc = "add read-only to aider" }
          --   }
          -- }
          require("nvim_aider.neo_tree").setup(opts)
        end,
      },
    },
    config = true,
  },
}
