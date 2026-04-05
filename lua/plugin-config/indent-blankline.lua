-- Indent guide lines with active scope highlight
-- https://github.com/lukas-reineke/indent-blankline.nvim
local ok, ibl = pcall(require, "ibl")
if not ok then
  return
end

-- Gradient colour hooks for the indent lines
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
end)

ibl.setup({
  indent = {
    -- Use a thin bar character
    char = "│",
    highlight = highlight,
  },
  scope = {
    -- Highlight the current scope with a distinct colour
    enabled = true,
    show_start = true,
    show_end = false,
    injected_languages = false,
    highlight = { "Function", "Label" },
    priority = 500,
  },
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "nvim-tree",
      "NvimTree",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
