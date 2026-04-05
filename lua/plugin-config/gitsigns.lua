-- Git signs in the gutter + inline blame
-- https://github.com/lewis6991/gitsigns.nvim
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end

gitsigns.setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
    changedelete = { text = "▎" },
    untracked    = { text = "▎" },
  },
  signs_staged = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
    changedelete = { text = "▎" },
  },

  -- Show blame annotation at end of line. Toggle with <leader>gB.
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 800,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> • <summary>",

  -- Preview hunk in floating window
  preview_config = {
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Navigation between hunks
    map("n", "]g", function()
      if vim.wo.diff then return "]g" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr = true, desc = "Next git hunk" })

    map("n", "[g", function()
      if vim.wo.diff then return "[g" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr = true, desc = "Prev git hunk" })

    -- Hunk actions
    map("n", "<leader>gs", gs.stage_hunk,        { desc = "Stage hunk" })
    map("n", "<leader>gr", gs.reset_hunk,        { desc = "Reset hunk" })
    map("n", "<leader>gS", gs.stage_buffer,      { desc = "Stage buffer" })
    map("n", "<leader>gR", gs.reset_buffer,      { desc = "Reset buffer" })
    map("n", "<leader>gp", gs.preview_hunk,      { desc = "Preview hunk" })
    map("n", "<leader>gb", function()
      gs.blame_line({ full = true })
    end,                                          { desc = "Blame line (full)" })
    map("n", "<leader>gB", gs.toggle_current_line_blame, { desc = "Toggle blame" })
    map("n", "<leader>gd", gs.diffthis,          { desc = "Diff this" })
    map("n", "<leader>gD", function()
      gs.diffthis("~")
    end,                                          { desc = "Diff against HEAD~" })

    -- Visual range stage/reset
    map("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,                                          { desc = "Stage selected hunks" })
    map("v", "<leader>gr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,                                          { desc = "Reset selected hunks" })

    -- Text object: ih = inner hunk
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
  end,
})
