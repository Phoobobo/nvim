-- Which-key: shows available keymaps in a popup after a prefix
-- https://github.com/folke/which-key.nvim
local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup({
  preset = "modern",   -- "default" | "modern" | "helix"
  delay = 500,         -- ms before popup appears
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  win = {
    border = "rounded",
    padding = { 1, 2 },
  },
  layout = {
    width = { min = 20 },
    spacing = 3,
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
})

-- Register group labels so which-key shows meaningful headings
wk.add({
  { "<leader>c",  group = "Copilot" },
  { "<leader>g",  group = "Git" },
  { "<leader>b",  group = "Buffer" },
  { "<leader>t",  group = "Trouble" },
  { "<leader>f",  group = "Format / Find" },
  { "g",          group = "Go to" },
  { "]",          group = "Next" },
  { "[",          group = "Prev" },
})
