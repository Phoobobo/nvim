# Startup
1. Install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
2. Install plugins
```
nvim
:PackerSync
```
If some package update failed, just rerun :PackerSync

3. Install NertFonts
- Mac
- Ubuntu
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
