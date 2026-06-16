#!/bin/bash

set -e

BOLD_YELLOW="\e[1;33m"
BOLD_GREEN="\e[1;32m"
BOLD_RED="\e[1;31m"
NC="\e[0m"
CONFIG_DIR=~/.config
SOURCE_CONFIG_DIR="$(pwd)/.config"
PACKAGES=(
    aylurs-gtk-shell
    htop
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    kitty
    lazydocker
    lazygit
    nautilus
    neofetch
    neovim
    nodejs
    npm
    ripgrep
    starship
    wofi
    zoxide
)

if ! test -d $SOURCE_CONFIG_DIR; then
    echo -e "${BOLD_RED}Could not find ${SOURCE_CONFIG_DIR}. Exiting...${NC}"
    exit 1
fi

print_recap() {
    echo -e "${BOLD_YELLOW}"
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║                                                        ║"
    echo "║                Arch Hyprdots installer                 ║"
    echo "║                                                        ║"
    echo "╠════════════════════════════════════════════════════════╣"
    echo "║  The following packages will be installed:             ║"

    for package in "${PACKAGES[@]}"; do
        printf "║   - %-50s ║\n" "$package"
    done

    echo "╚════════════════════════════════════════════════════════╝"
    echo -e "${NC}"

    read -rp "Continue? [y/N]: " confirm

    case "$confirm" in [yY]|[yY][eE][sS])
            echo -e "${BOLD_GREEN}Starting installation...${NC}"
            echo
            ;;
        *)
            echo -e "${BOLD_RED}Installation cancelled.${NC}"
            exit 0
            ;;
    esac
}
print_recap

install_packages() {
    for package in "${PACKAGES[@]}"; do
        echo -e "${BOLD_YELLOW}Installing ${package}...${NC}"

        if yay -S --noconfirm --needed "$package"; then
            echo -e "${BOLD_GREEN}✓ ${package} installed${NC}"
        else
            echo -e "${BOLD_RED}✗ Failed to install ${package}${NC}"
            exit 1
        fi
    done
}
install_packages

setup_config_dir() {
    if ! test -d $CONFIG_DIR/ags; then
        echo -e "${BOLD_YELLOW}Initializing AGS...${NC}"
        ags init
        echo
    fi
    echo -e "${BOLD_YELLOW}Copying configuration files...${NC}"
    rm -rf $CONFIG_DIR/ags/app.ts
    rm -rf $CONFIG_DIR/ags/env.d.ts
    rm -rf $CONFIG_DIR/ags/.gitignore
    rm -rf $CONFIG_DIR/ags/package.json
    rm -rf $CONFIG_DIR/ags/style.css
    rm -rf $CONFIG_DIR/ags/tsconfig.json
    rm -rf $CONFIG_DIR/ags/widget/
    cp -rf "$SOURCE_CONFIG_DIR/ags/"* "$CONFIG_DIR/ags/"
    for config in "$SOURCE_CONFIG_DIR"/*; do
        # We do not override the entire ags folder because it contains auto-generated code.
        if [[ "$(basename "$config")" != "ags" ]]; then
            cp -rf "$config" "$CONFIG_DIR/";
        fi
    done
}
setup_config_dir

echo
echo -e "${BOLD_GREEN}All done! You may now restart your computer.${NC}"
