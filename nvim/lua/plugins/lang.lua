return {

  { "exu/pgsql.vim", ft = "sql" },
  -- Autotabs for terraform and markdown table format
  { "godlygeek/tabular", ft = { "puppet", "markdown", "terraform" } },
  { "hashivim/vim-terraform", ft = "terraform" },
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    init = function()
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
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "vim-plug" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
      },
    },
  },
}
