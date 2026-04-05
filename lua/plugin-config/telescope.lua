local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
    -- Nice icons for telescope UI
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    -- Window styling
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    layout_config = {
      horizontal = { preview_width = 0.55, results_width = 0.8 },
      vertical   = { mirror = false },
      width      = 0.87,
      height     = 0.80,
      preview_cutoff = 120,
    },
    -- Window keymaps
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      hidden = true,   -- also show dot-files
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter    = true,
      case_mode               = "smart_case",
    },
  },
})

-- Load the faster native FZF sorter when available
pcall(telescope.load_extension, "fzf")

-- Notify extension (browse notification history)
pcall(telescope.load_extension, "notify")
