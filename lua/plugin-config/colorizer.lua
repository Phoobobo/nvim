-- Inline colour preview for hex/RGB/CSS values
-- https://github.com/NvChad/nvim-colorizer.lua
local ok, colorizer = pcall(require, "colorizer")
if not ok then
  return
end

colorizer.setup({
  filetypes = {
    "*",          -- enable for all file types
    "!lazy",      -- except these
    "!mason",
  },
  user_default_options = {
    RGB      = true,    -- #RGB hex codes
    RRGGBB   = true,    -- #RRGGBB hex codes
    names    = true,    -- "red", "blue", etc.
    RRGGBBAA = true,    -- #RRGGBBAA hex codes
    AARRGGBB = false,
    rgb_fn   = true,    -- CSS rgb() and rgba() functions
    hsl_fn   = true,    -- CSS hsl() and hsla() functions
    css      = true,    -- Enable all CSS features
    css_fn   = true,    -- Enable all CSS *functions*
    mode     = "background",  -- Display colour: background | foreground | virtualtext
    tailwind = false,
    sass     = { enable = false },
    virtualtext = "■",
  },
  buftypes = {},
})
