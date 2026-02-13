#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

[[ "$(id -u)" -eq 0 ]] && echo "Script must be run as a normal user." && exit

info_msg() {
  echo -e "\n\033[1;32m${1}\033[0m"
}

info_msg "Installing Packages ..."
sudo pacman -Sy --noconfirm --needed wget git unzip jre-openjdk

cleanup() {
    info_msg "Cleaning up previous tlauncher-arch installation ..."
    [[ -d "$HOME/tlauncher-arch" ]] && rm -rf "$HOME/tlauncher-arch"
    [[ -d "/usr/share/tlauncher" ]] && sudo rm -rf /usr/share/tlauncher
    [[ -f "/usr/bin/tlauncher" ]] && sudo rm -f /usr/bin/tlauncher
    [[ -f "/usr/share/icons/tlauncher.png" ]] && sudo rm -f /usr/share/icons/tlauncher.png
    [[ -f "/usr/share/applications/tlauncher.desktop" ]] && sudo rm -f /usr/share/applications/tlauncher.desktop
}

# If previous clone exists, ask user whether to cleanup
if [[ -d "$HOME/tlauncher-arch" ]]; then
    read -p "If your previous attempt had failed in middle, you can retry with cleanup. Do you want to cleanup? (y/N): " do_cleanup
    if [[ "$do_cleanup" =~ ^[Yy]$ ]]; then
        cleanup
    else
        info_msg "Skipping cleanup."
    fi
fi

info_msg "Cloning Repo ..."
git clone https://github.com/mttomaz/tlauncher-arch.git "$HOME/tlauncher-arch"
cd "$HOME/tlauncher-arch" || exit

info_msg "Downloading TLauncher ..."
wget https://tlauncher.org/jar -P src/
unzip src/jar -d src/tlauncher.d
mv src/tlauncher.d/*.jar src/tlauncher.d/tlauncher.jar

info_msg "Installing TLauncher ..."
sudo mkdir /usr/share/tlauncher
sudo mv src/tlauncher.d/* /usr/share/tlauncher

sudo mv src/tlauncher /usr/bin/
sudo mv src/tlauncher.png /usr/share/icons
sudo mv src/tlauncher.desktop /usr/share/applications

# Check if NVIDIA GPU is present
if lspci | grep -i 'nvidia' >/dev/null 2>&1; then
    read -p "Use NVIDIA GPU by default? (Y/n): " use_nvidia
    use_nvidia=${use_nvidia:-Y}

    if [[ "$use_nvidia" =~ ^[Yy]$ ]]; then
        sudo sed -i 's|exec java -jar /usr/share/tlauncher/tlauncher.jar|exec env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia java -jar /usr/share/tlauncher/tlauncher.jar|' /usr/bin/tlauncher
    fi
fi

cd "$OLDPWD" || exit
rm -rf "$HOME/tlauncher-arch"
info_msg "Installation Complete!"
