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
    dependencies = { "nvim-lua/plenary.nvim" },
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
  -- Completion (nvim-cmp) + LuaSnip snippets
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- LuaSnip snippet engine (replaces vim-vsnip)
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      "saadparwaiz1/cmp_luasnip",
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
}
