#!/usr/bin/bash

# Heading
echo "WARNING! This install script is intended for Fedora. It likely will not work on other distrobutions."
echo "This will install my development environment, doing the following with sudo privileges when nesseccary:"
echo "	* Install the required packages, enabling copr repos for those required"
echo "	* Copy my dotfiles repo to ~/.dotfiles"
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
echo --- Installing packages ---
echo
sudo dnf install fastfetch lazygit git starship stow zoxide

# Cloning Git repos
echo
echo --- Cloning dotfiles repository ---
echo

git clone https://github.com/isaac-harmon/dotfiles.git ~/.dotfiles

# Managing symlinks
mv ~/.bashrc ~/.bashrc.bak
stow ~/.dotfiles

# Ending output
echo
echo " Done! Launch Foot to begin developing!"
