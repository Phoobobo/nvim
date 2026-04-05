-- Trouble: diagnostics, references, quickfix, and location list
-- https://github.com/folke/trouble.nvim
local ok, trouble = pcall(require, "trouble")
if not ok then
  return
end

trouble.setup({
  modes = {
    -- Document diagnostics (current file)
    diagnostics_buffer = {
      mode = "diagnostics",
      filter = { buf = 0 },
    },
  },
  icons = {
    indent        = { middle = " ", last = " ", top = " ", ws = "│  " },
    folder_closed = "",
    folder_open   = "",
    kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      String        = " ",
      Struct        = "󰆼 ",
      TypeParameter = " ",
      Variable      = "󰀫 ",
    },
  },
})
