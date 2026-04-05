-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- $跳到行尾不带空格 (交换 $ 和 g_)
map({ "v", "n" }, "$", "g_", { noremap = true, silent = true })
map({ "v", "n" }, "g_", "$", { noremap = true, silent = true })

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- 退出 / 保存
map("n", "qq", ":q<CR>", { noremap = true, silent = true })
map("n", "<leader>q", ":quitall<CR>", { noremap = true, silent = true })
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
map("n", "<leader>wq", ":wqa!<CR>", { noremap = true, silent = true })

-- 在折行上正确移动
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下快速滚动
map({ "n", "v" }, "<C-j>", "5j", { noremap = true, silent = true })
map({ "n", "v" }, "<C-k>", "5k", { noremap = true, silent = true })
map("n", "<C-u>", "10k", { noremap = true, silent = true })
map("n", "<C-d>", "10j", { noremap = true, silent = true })

-- magic search
map({ "n", "v" }, "/", "/\\v", { noremap = true, silent = false })

-- visual 模式缩进保持选中
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
map("v", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- visual 模式粘贴不覆盖寄存器
map("v", "p", '"_dP', { noremap = true, silent = true })

-- insert 模式跳到行首/行尾
map("i", "<C-h>", "<ESC>I", { noremap = true, silent = true })
map("i", "<C-l>", "<ESC>A", { noremap = true, silent = true })

--------------------------------------------------------------------
-- 分屏操作
--------------------------------------------------------------------
-- 取消 s 默认功能，用于分屏前缀
map("n", "s", "<Nop>", { noremap = true, silent = true })
map("n", "sv", ":vsp<CR>", { noremap = true, silent = true })
map("n", "sh", ":sp<CR>", { noremap = true, silent = true })

-- 关闭窗口
map("n", "wc", "<C-w>c", { noremap = true, silent = true })
map("n", "wo", "<C-w>o", { noremap = true, silent = true })

-- 窗口跳转
map("n", "wh", "<C-w>h", { noremap = true, silent = true })
map("n", "wj", "<C-w>j", { noremap = true, silent = true })
map("n", "wk", "<C-w>k", { noremap = true, silent = true })
map("n", "wl", "<C-w>l", { noremap = true, silent = true })

-- 调整分屏大小
map("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
map("n", "s,", ":vertical resize -10<CR>", { noremap = true, silent = true })
map("n", "s.", ":vertical resize +10<CR>", { noremap = true, silent = true })
map("n", "sj", ":resize +10<CR>", { noremap = true, silent = true })
map("n", "sk", ":resize -10<CR>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
map("n", "s=", "<C-w>=", { noremap = true, silent = true })

-- Terminal
map("n", "st", ":sp | terminal<CR>", { noremap = true, silent = true })
map("n", "stv", ":vsp | terminal<CR>", { noremap = true, silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map("t", "<A-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true })
map("t", "<A-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true })
map("t", "<A-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true })
map("t", "<A-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true })

--------------------------------------------------------------------
-- 插件快捷键 (returned as a table so plugin-config files can use them)
--------------------------------------------------------------------
local pluginKeys = {}

-- nvim-tree
map("n", "fe", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- bufferline
map("n", "bh", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })
map("n", "bl", ":BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "btp", ":BufferLineTogglePin<CR>", { noremap = true, silent = true, desc = "Toggle pin" })
map("n", "bp", ":BufferLinePick<CR>", { noremap = true, silent = true, desc = "Pick buffer" })
map("n", "bw", ":Bdelete!<CR>", { noremap = true, silent = true, desc = "Delete buffer" })
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", { noremap = true, silent = true, desc = "Close buffers to right" })
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true, desc = "Close buffers to left" })
map("n", "bpc", ":BufferLinePickClose<CR>", { noremap = true, silent = true, desc = "Pick-close buffer" })

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
map("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Live grep" })
map("n", "<C-e>", ":Telescope oldfiles<CR>", { noremap = true, silent = true, desc = "Recent files" })

pluginKeys.telescopeList = {
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

-- LSP keymaps (called from lsp/utils.lua on_attach)
pluginKeys.mapLSP = function(mapbuf)
  local o = { noremap = true, silent = true }
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", o)
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", o)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", o)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", o)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", o)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", o)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", o)
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", o)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", o)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", o)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })<CR>", o)
end

-- nvim-cmp (LuaSnip edition)
pluginKeys.cmp = function(cmp)
  local luasnip = require("luasnip")
  return {
    -- Trigger / dismiss completion
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Navigate items
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- Confirm selection
    ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    -- Scroll documentation popup
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- Tab: expand snippet or jump forward; Shift-Tab: jump backward
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

-- symbols-outline
map("n", "so", ":SymbolsOutline<CR>", { noremap = true, silent = true, desc = "Symbols outline" })
pluginKeys.outline = {
  close = { "<Esc>", "q" },
  goto_location = "<CR>",
  focus_location = "o",
  hover_symbol = "<C-space>",
  toggle_preview = "K",
  rename_symbol = "r",
  code_actions = "a",
}

-- Notifications history (requires nvim-notify + telescope)
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", { noremap = true, silent = true, desc = "Notification history" })

return pluginKeys
