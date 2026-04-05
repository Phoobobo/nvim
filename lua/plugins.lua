-- Plugin list for lazy.nvim
-- https://github.com/folke/lazy.nvim
return {

  ---------------------------------------------------------------------------
  -- Colour scheme (loaded eagerly so it's ready before any other UI plugin)
  ---------------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorscheme")
    end,
  },

  ---------------------------------------------------------------------------
  -- Notification UI  (load early so vim.notify is replaced before plugins
  -- that might emit notifications during their own setup)
  ---------------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 900,
    config = function()
      require("plugin-config.notify")
    end,
  },

  ---------------------------------------------------------------------------
  -- File tree
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("plugin-config.nvim-tree")
    end,
  },

  ---------------------------------------------------------------------------
  -- Buffer tabs
  ---------------------------------------------------------------------------
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "moll/vim-bbye",
    },
    event = "VeryLazy",
    config = function()
      require("plugin-config.bufferline")
    end,
  },

  ---------------------------------------------------------------------------
  -- Status line
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "arkav/lualine-lsp-progress",
    },
    event = "VeryLazy",
    config = function()
      require("plugin-config.lualine")
    end,
  },

  ---------------------------------------------------------------------------
  -- Fuzzy finder
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Native FZF sorter: much faster on large codebases
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    cmd = "Telescope",
    config = function()
      require("plugin-config.telescope")
    end,
  },

  ---------------------------------------------------------------------------
  -- Dashboard
  ---------------------------------------------------------------------------
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugin-config.dashboard")
    end,
  },

  ---------------------------------------------------------------------------
  -- Project management
  ---------------------------------------------------------------------------
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin-config.project")
    end,
  },

  ---------------------------------------------------------------------------
  -- Treesitter: parsing / syntax highlighting / indent / folding
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugin-config.nvim-treesitter")
    end,
  },

  ---------------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------------
  { "williamboman/mason.nvim",           lazy = false },
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("lsp.setup")
    end,
  },

  ---------------------------------------------------------------------------
  -- Completion (nvim-cmp) + LuaSnip snippets + Copilot source
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- LuaSnip snippet engine
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      "saadparwaiz1/cmp_luasnip",
      -- Copilot as a cmp source (optional – silent without auth)
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("lsp.cmp")
    end,
  },

  ---------------------------------------------------------------------------
  -- Formatting / linting via none-ls (null-ls community fork)
  ---------------------------------------------------------------------------
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("lsp.null-ls")
    end,
  },

  ---------------------------------------------------------------------------
  -- Markdown preview
  ---------------------------------------------------------------------------
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  ---------------------------------------------------------------------------
  -- Symbol tree
  ---------------------------------------------------------------------------
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("plugin-config.symbols-outline")
    end,
  },

  ---------------------------------------------------------------------------
  -- Auto-close brackets / quotes
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- AI: GitHub Copilot inline suggestions
  -- Authenticate once with :Copilot auth
  -- Free GitHub Copilot tier works out of the box.
  ---------------------------------------------------------------------------
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("plugin-config.copilot")
    end,
  },

  -- Copilot as a nvim-cmp source (shown with a  icon)
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- AI: Copilot Chat panel  (<leader>cc to open)
  ---------------------------------------------------------------------------
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    cmd = { "CopilotChat", "CopilotChatOpen" },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<CR>",  desc = "Copilot Chat toggle" },
      { "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = { "n", "v" }, desc = "Copilot Explain" },
      { "<leader>cr", "<cmd>CopilotChatReview<CR>",  mode = { "n", "v" }, desc = "Copilot Review" },
      { "<leader>cf", "<cmd>CopilotChatFix<CR>",     mode = { "n", "v" }, desc = "Copilot Fix" },
      { "<leader>co", "<cmd>CopilotChatOptimize<CR>", mode = { "n", "v" }, desc = "Copilot Optimize" },
      { "<leader>ct", "<cmd>CopilotChatTests<CR>",   mode = { "n", "v" }, desc = "Copilot Tests" },
      { "<leader>cd", "<cmd>CopilotChatDocs<CR>",    mode = { "n", "v" }, desc = "Copilot Docs" },
    },
    config = function()
      require("plugin-config.copilot-chat")
    end,
  },

  ---------------------------------------------------------------------------
  -- Git: hunk signs + blame in gutter
  ---------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugin-config.gitsigns")
    end,
  },

  ---------------------------------------------------------------------------
  -- Keymap hints popup
  ---------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugin-config.which-key")
    end,
  },

  ---------------------------------------------------------------------------
  -- Indent guide lines with scope highlight
  ---------------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugin-config.indent-blankline")
    end,
  },

  ---------------------------------------------------------------------------
  -- Inline hex / CSS colour preview
  ---------------------------------------------------------------------------
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugin-config.colorizer")
    end,
  },

  ---------------------------------------------------------------------------
  -- Diagnostics, references, quickfix list UI
  ---------------------------------------------------------------------------
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      { "<leader>tx", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Diagnostics (project)" },
      { "<leader>tX", "<cmd>Trouble diagnostics_buffer toggle<CR>",       desc = "Diagnostics (buffer)" },
      { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<CR>",       desc = "Symbols (Trouble)" },
      { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP refs/defs" },
      { "<leader>tL", "<cmd>Trouble loclist toggle<CR>",                   desc = "Location list" },
      { "<leader>tq", "<cmd>Trouble qflist toggle<CR>",                    desc = "Quickfix list" },
    },
    config = function()
      require("plugin-config.trouble")
    end,
  },
}
