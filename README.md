<div align="center">
    <img src="https://raw.githubusercontent.com/JudicaelT/Hyprdots/main/.github/assets/hyprdots_screen_1.png"/>
    <img src="https://raw.githubusercontent.com/JudicaelT/Hyprdots/main/.github/assets/hyprdots_screen_2.png"/>
</div>

## Installation

> [!IMPORTANT]
> This branch contains the configurations and install scripts for arch-based distros.
> To install them on Fedora, please check [the Fedora branch](https://github.com/JudicaelT/Hyprdots/tree/fedora)
>
> These configurations have also been made with a **french AZERTY** keyboard in mind.
> Therefore, the experience might not be suitable for non-AZERTY keyboard users.
> We strongly recommend you edit the configuration files (once you've pulled them) to suit your needs.

> [!CAUTION]
> The install script will override the existing configs in ~/.config.
> If you don't want to lose your custom configurations, make sure to back them up before running ./install.sh

```shell
# The install script uses yay to install the packages and curl to fetch the fonts.
# Make sure those are installed before proceeding.

git clone --recurse-submodules https://github.com/JudicaelT/Hyprdots.git
cd Hyprdots
chmod +x install.sh
./install.sh
```

## Dependencies

### Main packages

- hyprland
- aylurs-gtk-shell
- kitty
- starship
- wofi

### Other packages
- hyprlock
- hyprpaper
- hyprpicker
- hyprshot
- htop
- lazydocker
- lazygit
- libastal-meta
- nautilus
- neofetch
- neovim
- nodejs
- npm
- ripgrep
- sass
- tree-sitter-cli
- zoxide
