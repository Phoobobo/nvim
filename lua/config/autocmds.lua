local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("phoobobo_general", { clear = true })

autocmd("TextYankPost", {
  group = general,
  desc = "Highlight yanked text briefly",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general,
  desc = "Reload files changed outside Neovim",
  command = "checktime",
})

autocmd("VimResized", {
  group = general,
  desc = "Keep split sizes balanced after resizing the window",
  command = "tabdo wincmd =",
})
