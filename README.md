# Startup
## 0. Install neovim
### Mac
`brew install neovim`
### Ubuntu
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
### windows先安装linux子系统
1. 安装windows terminal
2. `wsl --install -d ubuntu-20.04`
## 1. Install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## 2. Set nvim config
Clone this repo under ~/.config/
## 3. Install plugins
1. enter nvim
```
nvim
```
2. Sync packages by typing
`:PackerSync`

If some package update failed, just rerun :PackerSync

## 3. Install NertFonts
### Mac
1. Install Fonts
```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```
2. Setup Terminal Profile

### Ubuntu
1. Install Fonts
```
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
```
2. Set Terminal Profile
    1. Open Terminal Preferences
    2. Select one Profile
    3. Set custom font to "Hack Nerd Font Mono"
    4. Restart Terminal
### Windows

## 4. Set compatible colortheme of Terminal
*ubuntu no need*

*It is highly recommended that you install iterm2 for your mac.*
### Install iterm2
```
brew install iterm2 --cask
cd ~/
mkdir ~/iterm2 ; cd ~/iterm2\
```
### Install colortheme

```
git clone https://github.com/mbadolato/iTerm2-Color-Schemes
mv iterm2 .iterm2
```
in iterm2 Preferences, import the colors from the repo just cloned.
restart iterm2.
