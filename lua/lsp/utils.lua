local M = {}

-- Build LSP capabilities, enhanced with nvim-cmp completions when available.
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
M.capabilities = ok
  and cmp_nvim_lsp.default_capabilities()
  or vim.lsp.protocol.make_client_capabilities()

local format_augroup = vim.api.nvim_create_augroup("phoobobo_lsp_format", { clear = false })

-- Shared on_attach called for every LSP server.
-- Binds keymaps and enables format-on-save.
---@param client table LSP client object
---@param bufnr integer  Buffer number
M.on_attach = function(client, bufnr)
  require("config.keymaps").mapLSP(bufnr)

  if client:supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = format_augroup,
      buffer = bufnr,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_augroup,
      buffer = bufnr,
      desc = "Format with LSP before saving",
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = false,
          id = client.id,
        })
      end,
    })
  end
end

return M
