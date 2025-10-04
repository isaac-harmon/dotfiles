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
echo --- Installing VS Codium Repository ---
echo
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

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
sudo dnf install codium fastfetch lazygit git starship stow zoxide

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
