-- Bootstrap lazy.nvim (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Core settings and keymaps must be loaded BEFORE lazy so that mapleader is
-- set before any plugin that reads it at load time.
require("basic")
require("keybindings")

-- Load plugins (lua/plugins.lua).  Each plugin's config callback is
-- responsible for requiring its own plugin-config/* file.
require("lazy").setup("plugins", {
  -- Show a nice icon while installing
  install = { colorscheme = { "tokyonight", "habamax" } },
  -- Don't auto-check for updates on startup (do it manually with :Lazy)
  checker = { enabled = false },
  -- Disable built-in plugins we don't need
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
