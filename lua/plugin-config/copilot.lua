-- GitHub Copilot inline suggestions
-- https://github.com/zbirenbaum/copilot.lua
--
-- AUTHENTICATION (one-time):
--   :Copilot auth
--
-- The plugin is completely silent when not authenticated – the config
-- works out of the box for users without a subscription.  GitHub Copilot
-- has a FREE individual tier (limited completions / month).
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup({
  -- Inline ghost-text suggestions as you type
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",        -- Alt+l  → accept full suggestion
      accept_word = "<M-w>",   -- Alt+w  → accept next word
      accept_line = "<M-j>",   -- Alt+j  → accept next line
      next = "<M-]>",          -- Alt+]  → next suggestion
      prev = "<M-[>",          -- Alt+[  → previous suggestion
      dismiss = "<C-]>",       -- Ctrl+] → dismiss
    },
  },

  -- Copilot panel (list of multiple suggestions)
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4,
    },
  },

  -- File-type opt-outs (don't suggest in secret/config files)
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    ["."] = false,
  },

  -- Use the Node.js binary from PATH
  copilot_node_command = "node",
  server_opts_overrides = {},
})
