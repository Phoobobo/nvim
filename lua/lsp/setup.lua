local mason_status, mason = pcall(require, "mason")
if not mason_status then
  vim.notify("没有找到 mason")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
  lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  clangd = require("lsp.config.clangd"),
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- 自动安装 Language Servers
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local config = servers[server_name]
    if config == nil then
      return
    end
    local lspconfig = require("lspconfig")
    if config.on_setup then
      config.on_setup(lspconfig[server_name])
    else
      require("lspconfig")[server_name].setup({})
    end
  end,
})
