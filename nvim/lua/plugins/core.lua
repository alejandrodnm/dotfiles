-- change trouble config
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LSP Server Settings
      ---@type lspconfig.options
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
      },
    },
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
  -- interative rename
  { "smjonas/inc-rename.nvim", config = true },
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
      -- disable the keymap to grep files
      { "<leader>/", false },
      -- disable telescope git mappings
      { "<leader>gc", false },
      { "<leader>gs", false },
      -- find files
      { "<Leader>fg", "<cmd>Telescope git_status<cr>", desc = "Git status files" },
      {
        "<Leader>ch",
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

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-e>"] = cmp.mapping.confirm({ select = true }),
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
      vim.api.nvim_set_keymap("n", "<Leader>lh", ":write <bar> edit <bar> TSBufEnable highlight<CR>", { silent = true })
    end,
  },
  { "simnalamburt/vim-mundo" },
  {
    "szw/vim-maximizer",
    init = function()
      vim.g.maximizer_set_default_mapping = 0
      vim.g.maximizer_set_mapping_with_bang = 1
      vim.api.nvim_set_keymap("n", "<C-w>z", ":MaximizerToggle!<CR>", { silent = true })
    end,
  },
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.strip_whitelines_at_eof = 1
      vim.g.show_spaces_that_precede_tabs = 1
    end,
  },
  { "mrjones2014/dash.nvim", build = "make install", config = true },
  {
    "simrat39/symbols-outline.nvim",
    opts = {},
    init = function()
      vim.api.nvim_set_keymap("n", "<Leader>cs", ":SymbolsOutline<CR>", { silent = true })
    end,
  },
  {
    "tpope/vim-fugitive",
    init = function()
      vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { silent = true, desc = "Git status" })
      vim.api.nvim_set_keymap("n", "<Leader>gd", ":Gvdiffsplit<CR>", { silent = true, desc = "Git diff" })
      vim.api.nvim_set_keymap("n", "<Leader>gl", ":0Gclog<CR>", { silent = true, desc = "Git log" })
      vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", { silent = true, desc = "Git blame" })
      vim.api.nvim_set_keymap("n", "<Leader>gr", ":Gread<CR>", { silent = true, desc = "Git restore" })
      vim.api.nvim_set_keymap("n", "<Leader>ga", ":Gwrite<CR>", { silent = true, desc = "Git add" })
      vim.api.nvim_set_keymap("n", "<Leader>gc", ":Git commit<CR>", { silent = true, desc = "Git commit" })
    end,
  },
  --GBrowse support
  { "tpope/vim-rhubarb" },
  { "tpope/vim-endwise" },
  {
    "mileszs/ack.vim",
    init = function()
      if vim.fn.executable("rg") == 1 then
        vim.g.ackprg = "rg --vimgrep --no-heading"
      end
    end,
  },
  {
    "alok/notational-fzf-vim",
    init = function()
      vim.g.nv_search_paths = { "~/dev/adn/notes" }
      vim.g.nv_use_short_pathnames = 1
    end,
  },
  { "jamessan/vim-gnupg" },

  { "exu/pgsql.vim", ft = "sql" },
  -- Autotabs for terraform and markdown table format
  { "godlygeek/tabular", ft = { "puppet", "markdown" } },
  { "hashivim/vim-terraform", ft = "terraform" },
}

--[[
-- Themes
Plug('jdkanani/vim-material-theme')
Plug('terryma/vim-multiple-cursors')
Plug('tpope/vim-unimpaired')  -- Mappings
Plug('vim-airline/vim-airline')  -- Status line info
Plug('vim-airline/vim-airline-themes')


]]
--
