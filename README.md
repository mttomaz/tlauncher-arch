<div align="center">

# tlauncher-arch
[![stars](https://img.shields.io/github/stars/mttomaz/tlauncher-arch?color=7E9CD8&style=for-the-badge)](https://github.com/mttomaz/tlauncher-arch/stargazers)
[![issues](https://img.shields.io/github/issues/mttomaz/tlauncher-arch?color=FF5D62&style=for-the-badge)](https://github.com/mttomaz/tlauncher-arch/issues)
[![size](https://img.shields.io/github/repo-size/mttomaz/tlauncher-arch?color=76946A&style=for-the-badge)](https://github.com/mttomaz/tlauncher-arch)
[![license](https://img.shields.io/github/license/mttomaz/tlauncher-arch?color=957FB8&style=for-the-badge)](https://github.com/mttomaz/tlauncher-arch/blob/master/LICENSE)

</div>

This is a repo that i made to install TLauncher on Arch Linux directly from their [site](https://tlauncher.org/).

> [!Warning]
> This script is only a tool to facilitate the download of TLauncher.
> The use of TLauncher is entirely at your own risk. I am not responsible
> for any issues that may arise from the use of TLauncher. If you are curious
> about why this warning even exists, see [this](https://github.com/MatheusTT/tlauncher-arch/issues/1) issue.

## Installing
Run the following command to install TLauncher:

```bash
curl -fsSl https://raw.githubusercontent.com/mttomaz/tlauncher-arch/master/install.sh | sh
```

## Usage
After the installation, you can just type `tlauncher` in the terminal to launch tlauncher.

If you wanna update type `tlauncher --update` or `tlauncher -u`, for downloading the last version of tlauncher _(It's not the best way of doing this, but it will do it for now)_.

If you wanna remove TLauncher from your system type `tlauncher --remove` or `tlauncher -r`, and then the tlauncher files will be removed and you can opt to remove the java packages, and/or the $HOME/.tlauncher dir.
