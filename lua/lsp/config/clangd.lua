-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
local utils = require("lsp.utils")

return {
  on_setup = function(server)
    server.setup({
      capabilities = utils.capabilities,
      on_attach = utils.on_attach,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        -- "iwyu" (Include What You Use) automatically adds missing #includes
        -- and removes unnecessary ones, keeping headers clean.
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
      },
    })
  end,
}
