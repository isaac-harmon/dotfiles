#!/usr/bin/bash

# Heading
echo "WARNING! This install script is intended for Fedora. It likely will not work on other distrobutions."
echo "This will install my development environment, doing the following with sudo privileges when nesseccary:"
echo "	* Install the required packages, enabling copr repos for those required"
echo "	* Copy my dotfiles repo to ~/.dotfiles"
echo "	* Manually install zsh plugins"
echo "	* Use Gnu stow to setup dotfile symlinks"
echo

# User Input
while true; do

	read -p "Do you want to proceed? (y/n) " yn

	case $yn in
		[yY] ) break;;
		[nN] ) exit;;
		* ) echo "Invalid response";;
	esac

done

# Installing packages
echo
echo --- Installing Lazygit repository ---
echo
sudo dnf copr enable dejan/lazygit

echo
echo --- Installing Starship repository ---
echo
sudo dnf copr enable atim/starship

echo
echo --- Installing Yazi repository ---
echo
sudo dnf copr enable lihaohong/yazi

echo
echo --- Installing packages ---
echo
sudo dnf install fastfetch foot git lazygit neovim starship stow yazi zoxide zsh

# Cloning Git repos
echo
echo --- Cloning dotfiles repository ---
echo

git clone https://github.com/isaac-harmon/dotfiles.git ~/.dotfiles


mkdir ~/.dotfiles/.config/zsh

echo
echo --- Cloning Zsh Autosuggestions repository ---
echo
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/.config/zsh/zsh-autosuggestions

echo
echo --- Cloning Zsh Syntax Highlighting repository ---
echo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/.config/zsh/zsh-syntax-highlighting

# Managing symlinks
mv ~/.bashrc ~/.bashrc.bak
mv ~/.zshrc ~/.zshrc.bak
stow ~/.dotfiles

# Deleting unnesseccary symlinks
rm ~/install-fedora.sh
rm ~/Assets

# Ending output
echo
echo " Done! Launch Foot to begin developing!"
