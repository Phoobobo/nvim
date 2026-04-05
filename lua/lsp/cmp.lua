local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load VS Code-style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- copilot-cmp source (silent when Copilot is not authenticated)
local copilot_cmp_ok, copilot_cmp = pcall(require, "copilot_cmp")
if copilot_cmp_ok then
  copilot_cmp.setup()
end

-- Build the completion sources list. Copilot appears first (highest priority)
-- only when the copilot-cmp module was loaded successfully.
local function build_sources()
  local primary = {}
  if copilot_cmp_ok then
    table.insert(primary, { name = "copilot", priority = 1000 })
  end
  table.insert(primary, { name = "nvim_lsp", priority = 900 })
  table.insert(primary, { name = "luasnip",  priority = 800 })
  return cmp.config.sources(primary, {
    { name = "buffer" },
    { name = "path" },
  })
end

-- Format completion items: show a source label and the Copilot icon
local kind_icons = {
  Text          = "󰊄",
  Method        = "󰆧",
  Function      = "󰊕",
  Constructor   = "",
  Field         = "󰜢",
  Variable      = "󰀫",
  Class         = "󰠱",
  Interface     = "",
  Module        = "",
  Property      = "󰜢",
  Unit          = "󰑭",
  Value         = "󰎠",
  Enum          = "",
  Keyword       = "󰌋",
  Snippet       = "",
  Color         = "󰏘",
  File          = "󰈙",
  Reference     = "󰈇",
  Folder        = "󰉋",
  EnumMember    = "",
  Constant      = "󰏿",
  Struct        = "󰙅",
  Event         = "",
  Operator      = "󰆕",
  TypeParameter = "",
  Copilot       = "",  -- 
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      item.kind = (kind_icons[item.kind] or "") .. " " .. (item.kind or "")
      item.menu = ({
        copilot  = "[Copilot]",
        nvim_lsp = "[LSP]",
        luasnip  = "[Snippet]",
        buffer   = "[Buffer]",
        path     = "[Path]",
      })[entry.source.name] or entry.source.name
      return item
    end,
  },

  sources = build_sources(),
  mapping = require("keybindings").cmp(cmp),

  -- Don't complete inside comments
  enabled = function()
    local ctx = require("cmp.config.context")
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    end
    return not ctx.in_treesitter_capture("comment")
      and not ctx.in_syntax_group("Comment")
  end,
})

-- `/` search uses buffer source
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

-- `:` cmdline uses path + cmdline sources
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
