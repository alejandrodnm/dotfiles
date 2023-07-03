return {
  { "simnalamburt/vim-mundo" },
  {
    "szw/vim-maximizer",
    keys = {
      { "<C-w>z", ":MaximizerToggle!<CR>", silent = true, desc = "Maximize buffer" },
    },
    init = function()
      vim.g.maximizer_set_default_mapping = 0
      vim.g.maximizer_set_mapping_with_bang = 1
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
    keys = {
      { "<Leader>cs", ":SymbolsOutline<CR>", silent = true, desc = "Show symbols" },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<Leader>gs", ":Git<CR>", silent = true, desc = "Git status" },
      { "<Leader>gd", ":Gvdiffsplit<CR>", silent = true, desc = "Git diff" },
      { "<Leader>gl", ":0Gclog<CR>", silent = true, desc = "Git log" },
      { "<Leader>gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
      { "<Leader>gr", ":Gread<CR>", silent = true, desc = "Git restore" },
      { "<Leader>ga", ":Gwrite<CR>", silent = true, desc = "Git add" },
      { "<Leader>gc", ":Git commit<CR>", silent = true, desc = "Git commit" },
    },
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
