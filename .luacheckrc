-- .luacheckrc – luacheck configuration for this Neovim config repository
-- https://luacheck.readthedocs.io/en/stable/config.html

-- Allow the global `vim` table provided by Neovim.
globals = { "vim" }

-- Allow reading / writing common Neovim-injected globals.
read_globals = { "vim" }

-- Don't enforce a line-length limit (handled by the formatter).
max_line_length = false

-- Ignore "unused argument" warnings – on_attach callbacks frequently
-- receive `client` and `bufnr` even when only one is used.
-- Ignore "unused loop variable" warnings.
ignore = {
  "212", -- unused argument
  "213", -- unused loop variable
}
