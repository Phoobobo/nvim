-- encoding
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"

-- scrolling: keep 8 lines of context above/below cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight current line
vim.opt.cursorline = true

-- sign column always visible (prevents layout shift)
vim.opt.signcolumn = "yes"

-- right-hand ruler at 80 chars
vim.opt.colorcolumn = "80"

-- indentation: 2 spaces = 1 tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- command-line height
vim.opt.cmdheight = 2

-- reload file when changed externally
vim.opt.autoread = true

-- disable line wrapping
vim.opt.wrap = false

-- allow <Left>/<Right> to cross line boundaries
vim.opt.whichwrap = "<,>,[,]"

-- allow unsaved buffers to be hidden
vim.opt.hidden = true

-- mouse support
vim.opt.mouse = "a"

-- no backup / swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- faster CursorHold / plugin update events
vim.opt.updatetime = 300

-- key-sequence timeout (ms)
vim.opt.timeoutlen = 500

-- new splits appear below / to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- completion: show menu, don't auto-select, don't auto-insert
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- true colour
vim.opt.termguicolors = true

-- background
vim.opt.background = "dark"

-- show invisible characters (spaces as middle-dot)
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = "--" }

-- enhanced command-line completion
vim.opt.wildmenu = true

-- suppress completion messages
vim.opt.shortmess:append("c")

-- maximum items shown in popup menu
vim.opt.pumheight = 10

-- always show tabline
vim.opt.showtabline = 2

-- hide the mode indicator (lualine shows it instead)
vim.opt.showmode = false

-- undo persistence
vim.opt.undofile = true
