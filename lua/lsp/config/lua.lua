-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
local utils = require("lsp.utils")

return {
  on_setup = function(server)
    server.setup({
      capabilities = utils.capabilities,
      on_attach = utils.on_attach,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Expose all Neovim runtime Lua files so lua_ls understands
            -- built-in modules (vim.*, etc.).  The broad "" pattern is
            -- intentional: it mirrors the recommended lua_ls configuration
            -- from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
