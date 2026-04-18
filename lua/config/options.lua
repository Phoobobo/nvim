local opt = vim.opt

opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.whichwrap = "<,>,[,]"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.autoread = true
opt.mouse = "a"

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true

opt.updatetime = 300
opt.timeoutlen = 500

opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
opt.shortmess:append("c")
opt.pumheight = 10
opt.cmdheight = 2

opt.termguicolors = true
opt.background = "dark"
opt.list = true
opt.listchars = { space = "·", tab = "--" }
opt.wildmenu = true
opt.showtabline = 2
opt.showmode = false
