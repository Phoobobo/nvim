<div align="center">

# ✨ Phoobobo's Neovim Configuration

**A blazing-fast, batteries-included Neovim setup powered by [lazy.nvim](https://github.com/folke/lazy.nvim)**

[![CI](https://github.com/Phoobobo/nvim/actions/workflows/ci.yml/badge.svg)](https://github.com/Phoobobo/nvim/actions/workflows/ci.yml)
[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green?logo=neovim)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Config-Lua-blue?logo=lua)](https://www.lua.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

---

## 🚀 Highlight Features

### 🤖 GitHub Copilot — AI-Powered Coding

Get AI inline suggestions as you type. Works with the **free GitHub Copilot tier** — no Pro subscription required!

```
┌──────────────────────────────────────────────────────┐
│  function fibonacci(n)                               │
│    if n <= 1 then return n end                       │
│    return fibonacci(n-1) + fibonacci(n-2)  ← ghost  │
│                                             text     │
└──────────────────────────────────────────────────────┘
```

| Keymap      | Action                          |
|-------------|----------------------------------|
| `Alt+l`     | Accept full suggestion           |
| `Alt+w`     | Accept next word only            |
| `Alt+j`     | Accept next line only            |
| `Alt+[/]`   | Cycle through suggestions        |
| `<leader>cc`| Open **Copilot Chat** panel      |
| `<leader>ce`| Explain selected code            |
| `<leader>cr`| Review selected code             |
| `<leader>cf`| Fix bugs in selection            |
| `<leader>ct`| Generate unit tests              |

> **First-time setup:** Run `:Copilot auth` once to sign in with your GitHub account.  
> The config starts and works without authentication — Copilot suggestions simply won't appear until you authenticate.

---

### 🔍 Telescope — Fuzzy Find Everything

Powered by native **FZF** for instant results across millions of files.

```
┌─ Find Files ──────────────────────────────────────────┐
│ > src/comp                                            │
│ ──────────────────────────────────────────────────    │
│ ▶ src/components/Button.tsx          [12 lines]       │
│   src/components/Card.tsx            [34 lines]       │
│   src/components/Modal.tsx           [56 lines]       │
└───────────────────────────────────────────────────────┘
```

| Keymap    | Action              |
|-----------|----------------------|
| `Ctrl+p`  | Find files (FZF)    |
| `Ctrl+f`  | Live grep (ripgrep) |
| `Ctrl+e`  | Recent files        |
| `<leader>fn` | Notification history |

---

### ⌨️ Which-Key — Never Forget a Shortcut

Press `<Space>` and pause to see a popup of every available keybinding.

```
                          Normal mode
 ╭──────────────────────────────────────────────────╮
 │  <leader>                                        │
 │  c  +Copilot   g  +Git       t  +Trouble         │
 │  b  +Buffer    f  +Format    w  Save              │
 │  q  Quit all   rn Rename     ca Code action       │
 ╰──────────────────────────────────────────────────╯
```

---

### 📊 Git Integration — gitsigns

See git changes directly in the sign column with per-hunk staging.

```
 ▎ function greet(name) {          ← added line
 ▎   return `Hello, ${name}!`      ← added line
   }                               ← unchanged
  function bye() {                ← modified
```

| Keymap         | Action                     |
|----------------|----------------------------|
| `]g` / `[g`    | Next / prev hunk           |
| `<leader>gs`   | Stage hunk                 |
| `<leader>gr`   | Reset hunk                 |
| `<leader>gp`   | Preview hunk               |
| `<leader>gb`   | Blame line (full message)  |
| `<leader>gB`   | Toggle inline blame        |
| `<leader>gd`   | Diff this file             |

---

### 🏷️ LSP + Mason — One-Click Language Servers

Auto-install any language server with `:Mason`. Diagnostics, go-to-definition, hover docs, and more — zero manual config.

```
  function calculateTotal(items) {
          ^^^^^^^^^^^^^^^^^
          ⚠ Parameter 'items' implicitly has an 'any' type.  [7006]
```

| Keymap        | Action                  |
|---------------|--------------------------|
| `gd`          | Go to definition         |
| `gh`          | Hover documentation      |
| `gr`          | Find references          |
| `gi`          | Go to implementation     |
| `gp`          | Open diagnostic float    |
| `gj` / `gk`   | Next / prev diagnostic   |
| `<leader>rn`  | Rename symbol            |
| `<leader>ca`  | Code action              |
| `<leader>f`   | Format current buffer    |

---

### 🩺 Trouble — Beautiful Diagnostics List

Replace the bare quickfix list with a fully-styled panel.

```
 PROBLEMS  2 errors  3 warnings
 ──────────────────────────────────────────
  src/api.ts
   ✖ 12:4  Type 'string' is not assignable…
   ✖ 45:1  Cannot find name 'fetch'
  src/utils.ts
   ⚠ 8:3   'any' type detected
```

| Keymap        | Action                        |
|---------------|-------------------------------|
| `<leader>tx`  | Toggle project diagnostics    |
| `<leader>tX`  | Toggle buffer diagnostics     |
| `<leader>ts`  | Toggle symbol list            |
| `<leader>tl`  | Toggle LSP refs/definitions   |
| `<leader>tq`  | Toggle quickfix               |

---

### 🌈 Indent Guides + Colour Preview

Rainbow indent guides make nesting depth immediately obvious.  
`nvim-colorizer` renders hex/CSS values inline.

```lua
local config = {          │ ← scope highlight
  colors = {              │
    primary  = "#E06C75", ■ ← red preview
    success  = "#98C379", ■ ← green preview
    warning  = "#E5C07B", ■ ← yellow preview
  },                      │
}                         │
```

---

### ⚡ Fast Startup with lazy.nvim

Plugins load only when needed (by event, command, or filetype). Cold-start time is typically **< 50 ms**.

```
$ nvim --startuptime /tmp/nvim.log src/main.ts
...
028.3  000.3: sourcing $VIMRUNTIME/filetype.vim
045.6  016.3: opening buffers
085.2  039.6: first screen update   ← total cold-start time
085.2  000.0: --- NVIM STARTED ---  ← ~85 ms on a modern machine
```
> This is a representative example. Actual times vary by hardware and number of loaded LSP servers.

Run `:Lazy` to open the plugin manager UI, check for updates, and profile startup.

---

## 📦 Installation

### Requirements

| Tool        | Version  | Install                              |
|-------------|----------|--------------------------------------|
| **Neovim**  | **≥ 0.9.0** | `brew install neovim` / apt below — lazy.nvim requires 0.9+ |
| Git         | any      | system package manager               |
| Node.js     | ≥ 16     | [nvm](https://github.com/nvm-sh/nvm) |
| `make`      | any      | build tools (for FZF native sorter)  |
| Nerd Font   | any      | see below                            |

### macOS

```bash
brew install neovim node
```

### Ubuntu / Debian

```bash
# Neovim stable PPA
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update && sudo apt-get install neovim

# Node.js (for Copilot + Mason LSPs)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt-get install -y nodejs

# Build tools (for telescope-fzf-native)
sudo apt-get install -y build-essential
```

### Windows

```powershell
# Install Windows Terminal + WSL first
wsl --install -d Ubuntu-22.04
# Then follow the Ubuntu instructions inside WSL
```

### Clone and configure

```bash
# 1. Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# 2. Clone this repo
git clone https://github.com/Phoobobo/nvim.git ~/.config/nvim

# 3. Launch Neovim — lazy.nvim bootstraps itself and installs plugins
nvim
```

On first launch lazy.nvim will:
1. Clone itself
2. Install all plugins (takes ~1-2 min on first run)
3. Open Neovim ready to use

### Enable Copilot (free tier)

```
:Copilot auth
```

Follow the device-activation URL in your browser. Done. Suggestions appear automatically in insert mode.

---

## 🎹 Keymap Cheat-Sheet

> Press `<Space>` in normal mode and wait 500 ms to see a which-key popup for the current context.

### Core

| Keymap        | Action                   |
|---------------|--------------------------|
| `<leader>w`   | Save                     |
| `<leader>q`   | Quit all                 |
| `<leader>wq`  | Save-all and quit        |
| `qq`          | Quit                     |

### Windows & Splits

| Keymap       | Action                    |
|--------------|---------------------------|
| `sv` / `sh`  | Vertical / horizontal split |
| `wh/j/k/l`   | Jump to window            |
| `wc` / `wo`  | Close / close others      |
| `s=`         | Equalise splits           |

### Buffers

| Keymap        | Action                    |
|---------------|---------------------------|
| `bh` / `bl`   | Prev / next buffer        |
| `bw`          | Delete buffer             |
| `bp`          | Pick buffer by letter     |
| `btp`         | Toggle pin                |

### AI (Copilot)

| Keymap        | Action                    |
|---------------|---------------------------|
| `<leader>cc`  | Toggle chat               |
| `<leader>ce`  | Explain code              |
| `<leader>cr`  | Review code               |
| `<leader>cf`  | Fix code                  |
| `<leader>co`  | Optimise code             |
| `<leader>ct`  | Generate tests            |
| `<leader>cd`  | Generate docs             |

---

## 🎨 Nerd Fonts Setup

Icons require a [Nerd Font](https://www.nerdfonts.com/).

### macOS

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# Then set "Hack Nerd Font Mono" in your terminal settings
```

### Ubuntu

```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts && ./install.sh Hack
# Restart terminal, then set "Hack Nerd Font Mono" in preferences
```

---

## 🛠 Plugin Overview

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (lazy-loading) |
| [tokyonight](https://github.com/folke/tokyonight.nvim) | Colour scheme |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [mason](https://github.com/williamboman/mason.nvim) | LSP installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [none-ls](https://github.com/nvimtools/none-ls.nvim) | Formatter / linter |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | 🤖 AI inline suggestions |
| [CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | 🤖 AI chat panel |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git hunk signs + blame |
| [which-key](https://github.com/folke/which-key.nvim) | Keymap hint popup |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Beautiful notifications |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Rainbow indent guides |
| [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) | Inline colour preview |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list panel |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) | Start screen |
| [symbols-outline](https://github.com/simrat39/symbols-outline.nvim) | Symbol tree |

---

## 🤝 Contributing

Issues and PRs are welcome. Please open an issue before large changes.

---

<div align="center">
Made with ❤️ and Lua
</div>
