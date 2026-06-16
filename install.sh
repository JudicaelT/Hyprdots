#!/bin/bash

set -e

BOLD_YELLOW="\e[1;33m"
BOLD_GREEN="\e[1;32m"
BOLD_RED="\e[1;31m"
NC="\e[0m"
CONFIG_DIR=~/.config
SOURCE_CONFIG_DIR="$(pwd)/.config"

if ! test -d $SOURCE_CONFIG_DIR; then
    echo -e "${BOLD_RED}Could not find ${SOURCE_CONFIG_DIR}. Exiting...${NC}"
    return 1
fi

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
    wofi
    zoxide
)

echo -e "${BOLD_YELLOW}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║                                                        ║"
echo "║                  Hyprdots installer                    ║"
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
        ;;
    *)
        echo -e "${BOLD_RED}Installation cancelled.${NC}"
        exit 0
        ;;
esac

for package in "${PACKAGES[@]}"; do
    echo -e "${BOLD_YELLOW}Installing ${package}...${NC}"

    if yay -S --noconfirm --needed "$package"; then
        echo -e "${BOLD_GREEN}✓ ${package} installed${NC}"
    else
        echo -e "${BOLD_RED}✗ Failed to install ${package}${NC}"
        exit 1
    fi
done

echo -e "${BOLD_YELLOW}Setting up ~/.config folder...${NC}"

if ! test -d $CONFIG_DIR/ags; then
    echo -e "${BOLD_YELLOW}Initializing AGS...${NC}"
    ags init
fi

echo -e "${BOLD_YELLOW}Cleaning AGS directory...${NC}"
rm -rf $CONFIG_DIR/ags/app.ts
rm -rf $CONFIG_DIR/ags/env.d.ts
rm -rf $CONFIG_DIR/ags/.gitignore
rm -rf $CONFIG_DIR/ags/package.json
rm -rf $CONFIG_DIR/ags/style.css
rm -rf $CONFIG_DIR/ags/tsconfig.json
rm -rf $CONFIG_DIR/ags/widget/

echo -e "${BOLD_YELLOW}Updating AGS configuration...${NC}"
cp -rf "$SOURCE_CONFIG_DIR/ags/"* "$CONFIG_DIR/ags/"

echo -e "${BOLD_YELLOW}Copying configuration files...${NC}"
for config in "$SOURCE_CONFIG_DIR"/*; do
    [ "$(basename "$config")" = "ags" ] && continue
    cp -rf "$config" "$CONFIG_DIR/"
done

echo
echo -e "${BOLD_GREEN}All done! You may now restart your computer.${NC}"
