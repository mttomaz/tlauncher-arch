# TLauncher
This is a repo that i made to install TLauncher on Arch Linux directly from their [site](https://tlauncher.org/).

## How to install

1. Clone and enter the repo
    ```c 
    git clone https://github.com/MatheusTT/tlauncher-arch.git && cd tlauncher-arch
    ```
2. Change the permissions of the script
    ```c 
    chmod +x ./install.sh
    ```
3. Install tlauncher
    ```c
    ./install.sh
    ```
## Or you can simply do this:
```c
wget https://pastebin.com/raw/TUgwsQdx -O - | tr -d '\r' | sh
```

## Usage
After the installation, you can just type `tlauncher` in the terminal to launch tlauncher.

If you wanna update type `tlauncher --update` or `tlauncher -u`, for downloading the last version of tlauncher _(It's not the best way of doing this, but it will do it for now)_.

If you wanna remove TLauncher from your system type `tlauncher --remove` or `tlauncher -r`, and then the tlauncher files will be removed and you can opt to remove the java packages, and/or the $HOME/.tlauncher dir.