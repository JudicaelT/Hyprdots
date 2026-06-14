#!/bin/bash

set -e

BOLD_YELLOW="\e[1;33m"
BOLD_GREEN="\e[1;32m"
BOLD_RED="\e[1;31m"
NC="\e[0m"

packages=(
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

for package in "${packages[@]}"; do
    printf "║   - %-50s║\n" "$package"
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

for package in "${packages[@]}"; do
    echo -e "${BOLD_YELLOW}Installing ${package}...${NC}"

    if yay -S --noconfirm --needed "$package"; then
        echo -e "${BOLD_GREEN}✓ ${package} installed${NC}"
    else
        echo -e "${BOLD_RED}✗ Failed to install ${package}${NC}"
        exit 1
    fi
done

echo
echo -e "${BOLD_GREEN}All done! You may now restart your computer.${NC}"
