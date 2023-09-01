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
    -- This is the original but outdated in terms of font/icons
    -- "simrat39/symbols-outline.nvim",
    "anstadnik/symbols-outline.nvim",
    opts = {},
    keys = {
      { "<Leader>cs", ":SymbolsOutline<CR>", silent = true, desc = "Show symbols" },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
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
  { "jdkanani/vim-material-theme" },
  { "terryma/vim-multiple-cursors" },
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        lazy = false,
        main = "litee.lib",
        config = true,
      },
    },
    config = function(_, opts)
      require("litee.lib").setup()
      require("litee.gh").setup(opts)
    end,
    opts = {
      -- deprecated, around for compatability for now.
      jump_mode = "invoking",
      -- remap the arrow keys to resize any litee.nvim windows.
      map_resize_keys = false,
      -- do not map any keys inside any gh.nvim buffers.
      disable_keymaps = false,
      -- the icon set to use.
      icon_set = "default",
      -- any custom icons to use.
      icon_set_custom = nil,
      -- whether to register the @username and #issue_number omnifunc completion
      -- in buffers which start with .git/
      git_buffer_completion = true,
      -- defines keymaps in gh.nvim buffers.
      keymaps = {
        -- when inside a gh.nvim panel, this key will open a node if it has
        -- any futher functionality. for example, hitting <CR> on a commit node
        -- will open the commit's changed files in a new gh.nvim panel.
        open = "<CR>",
        -- when inside a gh.nvim panel, expand a collapsed node
        expand = "zo",
        -- when inside a gh.nvim panel, collpased and expanded node
        collapse = "zc",
        -- when cursor is over a "#1234" formatted issue or PR, open its details
        -- and comments in a new tab.
        goto_issue = "gd",
        -- show any details about a node, typically, this reveals commit messages
        -- and submitted review bodys.
        details = "d",
        -- inside a convo buffer, submit a comment
        submit_comment = "<C-s>",
        -- inside a convo buffer, when your cursor is ontop of a comment, open
        -- up a set of actions that can be performed.
        actions = "<C-a>",
        -- inside a thread convo buffer, resolve the thread.
        resolve_thread = "<C-r>",
        -- inside a gh.nvim panel, if possible, open the node's web URL in your
        -- browser. useful particularily for digging into external failed CI
        -- checks.
        goto_web = "gx",
      },
    },
    init = function()
      local wk = require("which-key")
      wk.register({
        g = {
          u = {
            name = "+Github",
            c = {
              name = "+Commits",
              c = { "<cmd>GHCloseCommit<cr>", "Close" },
              e = { "<cmd>GHExpandCommit<cr>", "Expand" },
              o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
              p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
              z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
            },
            i = {
              name = "+Issues",
              p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
            },
            l = {
              name = "+Litee",
              t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
            },
            r = {
              name = "+Review",
              b = { "<cmd>GHStartReview<cr>", "Begin" },
              c = { "<cmd>GHCloseReview<cr>", "Close" },
              d = { "<cmd>GHDeleteReview<cr>", "Delete" },
              e = { "<cmd>GHExpandReview<cr>", "Expand" },
              s = { "<cmd>GHSubmitReview<cr>", "Submit" },
              z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
            },
            p = {
              name = "+Pull Request",
              c = { "<cmd>GHClosePR<cr>", "Close" },
              d = { "<cmd>GHPRDetails<cr>", "Details" },
              e = { "<cmd>GHExpandPR<cr>", "Expand" },
              o = { "<cmd>GHOpenPR<cr>", "Open" },
              p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
              r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
              t = { "<cmd>GHOpenToPR<cr>", "Open To" },
              z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
            },
            t = {
              name = "+Threads",
              c = { "<cmd>GHCreateThread<cr>", "Create" },
              n = { "<cmd>GHNextThread<cr>", "Next" },
              t = { "<cmd>GHToggleThread<cr>", "Toggle" },
            },
          },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
