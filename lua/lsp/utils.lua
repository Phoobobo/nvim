local M = {}

-- Build LSP capabilities, enhanced with nvim-cmp completions when available.
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
M.capabilities = ok
  and cmp_nvim_lsp.default_capabilities()
  or vim.lsp.protocol.make_client_capabilities()

-- Shared on_attach called for every LSP server.
-- Binds keymaps and enables format-on-save.
---@param client table LSP client object
---@param bufnr integer  Buffer number
M.on_attach = function(client, bufnr)
  local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  require("keybindings").mapLSP(buf_map)

  -- Format on save (only for servers that support it).
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false, bufnr = bufnr })
      end,
    })
  end
end

return M
