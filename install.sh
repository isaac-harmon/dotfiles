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

echo
echo "This can also setup the Nix package manager if desired. This will require temporarily disabling Selinux to install."
echo

while true; do

	read -p "Do you want to install Nix? (y/n) " nix

	case $nix in
		[yYnN] ) break;;
		* ) echo "Invalid response";;
	esac

done

# Installing packages
echo
sudo dnf copr enable dejan/lazygit
echo
sudo dnf copr enable atim/starship
echo
sudo dnf copr enable lihaohong/yazi
echo
sudo dnf install fastfetch foot git lazygit neovim starship stow yazi zoxide zsh

# Cloning Git repos
git clone https://github.com/isaac-harmon/dotfiles.git ~/.dotfiles
mkdir ~/.dotfiles/.config/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/.config/zsh/zsh-syntax-highlighting

# Managing symlinks
stow ~/.dotfiles
rm ~/install-fedora.sh
rm ~/Assets

# Installing Nix
case $nix in
	[yY] ) sudo setenforce 0
		sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
esac

# Ending output
echo
echo " Done! Launch Foot to begin developing!"
case $nix in
	[yY] ) echo "(IMPORTANT! Make sure to reboot soon to re-enable Selinux)"
esac
