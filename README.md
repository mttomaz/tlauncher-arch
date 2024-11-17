# TLauncher
This is a repo that i made to install TLauncher on Arch Linux directly from their [site](https://tlauncher.org/).

### Warning !
This script is only a tool to facilitate the download of TLauncher. The use of TLauncher is entirely at your own risk. I am not responsible for any issues that may arise from the use of TLauncher. If you are curious about why this warning even exists, see [this](https://github.com/MatheusTT/tlauncher-arch/issues/1) issue.

## How to install

1. Clone and enter the repo
    ```bash
    git clone https://github.com/MatheusTT/tlauncher-arch.git && cd tlauncher-arch
    ```
2. Change the permissions of the script
    ```bash
    chmod +x ./install.sh
    ```
3. Install tlauncher
    ```bash
    ./install.sh
    ```

## Usage
After the installation, you can just type `tlauncher` in the terminal to launch tlauncher.

If you wanna update type `tlauncher --update` or `tlauncher -u`, for downloading the last version of tlauncher _(It's not the best way of doing this, but it will do it for now)_.

If you wanna remove TLauncher from your system type `tlauncher --remove` or `tlauncher -r`, and then the tlauncher files will be removed and you can opt to remove the java packages, and/or the $HOME/.tlauncher dir.
