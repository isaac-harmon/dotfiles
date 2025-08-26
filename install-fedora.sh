#!/usr/bin/bash

echo " <-- Adding repositories -->"
echo

sudo dnf copr enable dejan/lazygit
echo

sudo dnf copr enable atim/starship
echo

sudo dnf copr enable lihaohong/yazi
echo

echo " <-- Installing required packages -->"
sudo dnf install fastfetch foot git lazygit neovim starship yazi zoxide zsh

echo " <-- Downloading Zsh Plugins -->"
mkdir ~/.config/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting

echo " Done! Launch Foot to begin developing!"
