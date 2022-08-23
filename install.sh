#!/usr/bin/env bash

[[ "$(whoami)" = "root" ]] && echo "Script must be run as a normal user." && exit

# Colors
GREEN="\033[1;32m"
END="\033[0m"

## wget is for downloading TLuncher directly from their website.
## All the other packages are java packages recommended by TLauncher
## (They use java 8, but instead i'm installing the most recent java version).
# Downloading packages
pkgs=(
	wget
	jdk-openjdk
	jre-openjdk
	jre-openjdk-headless
	java-openjfx
)
sudo pacman -S --noconfirm --needed "${pkgs[@]}"

# Downloading TLauncher
echo -e "\n${GREEN}Downloading TLauncher...${END}"

wget https://tlauncher.org/jar -P src/
unzip src/jar -d src/tlauncher.d
mv src/tlauncher.d/*.jar src/tlauncher.d/tlauncher.jar

# Moving TLauncher files
echo -e "\n${GREEN}Installing TLauncher...${END}"
sudo mkdir /usr/share/tlauncher
sudo mv src/tlauncher.d/* /usr/share/tlauncher

sudo mv src/tlauncher /usr/bin/
sudo mv src/tlauncher.png /usr/share/icons
sudo mv src/tlauncher.desktop /usr/share/applications

echo -e "\n${GREEN}Installation Complete!${END}"