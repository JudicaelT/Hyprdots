<div align="center">
    <img src="https://raw.githubusercontent.com/JudicaelT/Hyprdots/main/.github/assets/hyprdots_screen_1.png"/>
    <img src="https://raw.githubusercontent.com/JudicaelT/Hyprdots/main/.github/assets/hyprdots_screen_2.png"/>
</div>

## Installation

> [!IMPORTANT]
> This branch contains the configurations and install scripts for Fedora.
> To install them on an arch-based distro, please check [the main branch](https://github.com/JudicaelT/Hyprdots/tree/main)
>
> These configurations have also been made with a **french AZERTY** keyboard in mind.
> Therefore, the experience might not be suitable for non-AZERTY keyboard users.
> We strongly recommend you edit the configuration files (once you've pulled them) to suit your needs.

> [!CAUTION]
> The install script will override the existing configs in ~/.config.
> If you don't want to lose your custom configurations, make sure to back them up before running ./install.sh

```shell
# The install script curl to fetch the fonts.
# Make sure curl is installed before proceeding.

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
- fastfetch
- gobject-introspection-devel
- golang
- gtk3-devel
- gtk4-devel
- gtk-layer-shell-devel
- gtk4-layer-shell-devel
- htop
- hyprland-guiutils
- hyprlock
- hyprpaper
- hyprpicker
- hyprshot
- json-glib-devel
- lazygit
- meson
- nautilus
- neovim
- ninja
- nodejs
- npm
- ripgrep
- tree-sitter-cli
- vala
- valadoc
- wayland-protocols-devel
- zoxide
