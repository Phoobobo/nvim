-- Modern notification UI
-- https://github.com/rcarriga/nvim-notify
local ok, notify = pcall(require, "notify")
if not ok then
  return
end

notify.setup({
  background_colour = "#000000",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "wrapped-compact",
  stages = "fade_in_slide_out",
  timeout = 3000,
  top_down = false,  -- notifications stack from bottom-right
})

-- Replace the built-in vim.notify with nvim-notify
vim.notify = notify

-- Telescope integration: browse notification history with <leader>fn
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  telescope.load_extension("notify")
end
