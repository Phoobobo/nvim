local packer = require('packer')
packer.startup(
  function(use)
    -- 包管理器
    use("wbthomason/packer.nvim")
    -- 颜色主题
    use("folke/tokyonight.nvim")
    -- 文件侧边栏
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- 顶部tab
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- 底部信息栏
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("arkav/lualine-lsp-progress")
    -- 模糊搜索
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
end)
