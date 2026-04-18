vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local silent = { silent = true }
local silent_expr = { expr = true, silent = true }

map({ "n", "v" }, "$", "g_", silent)
map({ "n", "v" }, "g_", "$", silent)

map("c", "<C-j>", "<C-n>")
map("c", "<C-k>", "<C-p>")

map("n", "qq", "<cmd>q<CR>", silent)
map("n", "<leader>q", "<cmd>quitall<CR>", silent)
map("n", "<leader>w", "<cmd>w<CR>", silent)
map("n", "<leader>wq", "<cmd>wqa!<CR>", silent)

map("n", "j", "v:count == 0 ? 'gj' : 'j'", silent_expr)
map("n", "k", "v:count == 0 ? 'gk' : 'k'", silent_expr)

map({ "n", "v" }, "<C-j>", "5j", silent)
map({ "n", "v" }, "<C-k>", "5k", silent)
map("n", "<C-u>", "10k", silent)
map("n", "<C-d>", "10j", silent)

map({ "n", "v" }, "/", "/\\v", { silent = false })

map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)
map("v", "J", ":move '>+1<CR>gv-gv", silent)
map("v", "K", ":move '<-2<CR>gv-gv", silent)
map("v", "p", '"_dP', silent)

map("i", "<C-h>", "<ESC>I", silent)
map("i", "<C-l>", "<ESC>A", silent)

map("n", "s", "<Nop>", silent)
map("n", "sv", "<cmd>vsp<CR>", silent)
map("n", "sh", "<cmd>sp<CR>", silent)
map("n", "wc", "<C-w>c", silent)
map("n", "wo", "<C-w>o", silent)
map("n", "wh", "<C-w>h", silent)
map("n", "wj", "<C-w>j", silent)
map("n", "wk", "<C-w>k", silent)
map("n", "wl", "<C-w>l", silent)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", silent)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", silent)
map("n", "s,", "<cmd>vertical resize -10<CR>", silent)
map("n", "s.", "<cmd>vertical resize +10<CR>", silent)
map("n", "sj", "<cmd>resize +10<CR>", silent)
map("n", "sk", "<cmd>resize -10<CR>", silent)
map("n", "<C-Down>", "<cmd>resize +2<CR>", silent)
map("n", "<C-Up>", "<cmd>resize -2<CR>", silent)
map("n", "s=", "<C-w>=", silent)

map("n", "st", "<cmd>sp | terminal<CR>", silent)
map("n", "stv", "<cmd>vsp | terminal<CR>", silent)
map("t", "<Esc>", "<C-\\><C-n>", silent)
map("t", "<A-h>", "<C-\\><C-N><C-w>h", silent)
map("t", "<A-j>", "<C-\\><C-N><C-w>j", silent)
map("t", "<A-k>", "<C-\\><C-N><C-w>k", silent)
map("t", "<A-l>", "<C-\\><C-N><C-w>l", silent)

local plugin_keys = {}

map("n", "fe", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })

map("n", "bh", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer", silent = true })
map("n", "bl", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
map("n", "btp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin", silent = true })
map("n", "bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer", silent = true })
map("n", "bw", "<cmd>Bdelete!<CR>", { desc = "Delete buffer", silent = true })
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to right", silent = true })
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to left", silent = true })
map("n", "bpc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick-close buffer", silent = true })

map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files", silent = true })
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep", silent = true })
map("n", "<C-e>", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files", silent = true })
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Notification history", silent = true })

plugin_keys.telescopeList = {
  i = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    ["<C-c>"] = "close",
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

plugin_keys.mapLSP = function(bufnr)
  local opts = { buffer = bufnr, silent = true }

  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gh", vim.lsp.buf.hover, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gp", vim.diagnostic.open_float, opts)
  map("n", "gk", vim.diagnostic.goto_prev, opts)
  map("n", "gj", vim.diagnostic.goto_next, opts)
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ bufnr = bufnr })
  end, opts)
end

plugin_keys.cmp = function(cmp)
  local luasnip = require("luasnip")

  return {
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

map("n", "so", "<cmd>SymbolsOutline<CR>", { desc = "Symbols outline", silent = true })

plugin_keys.outline = {
  close = { "<Esc>", "q" },
  goto_location = "<CR>",
  focus_location = "o",
  hover_symbol = "<C-space>",
  toggle_preview = "K",
  rename_symbol = "r",
  code_actions = "a",
}

return plugin_keys
