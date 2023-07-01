return {
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
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
}
