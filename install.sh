#!/bin/bash

set -e

BOLD_YELLOW="\e[1;33m"
BOLD_GREEN="\e[1;32m"
BOLD_RED="\e[1;31m"
NC="\e[0m"

CONFIG_DIR=~/.config
HYPRDOTS_CONFIG_DIR=.config
FONT_DIR=~/.local/share/fonts

DNF_PACKAGES=(
    fastfetch
    gobject-introspection-devel
    golang
    gtk3-devel
    gtk4-devel
    gtk-layer-shell-devel
    gtk4-layer-shell-devel
    htop
    hyprland
    hyprland-guiutils
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    kitty
    lazygit
    meson
    nautilus
    neovim
    ninja
    nodejs
    npm
    ripgrep
    sass
    sassc
    tree-sitter-cli
    vala
    valadoc
    wayland-protocols-devel
    wofi
    zoxide
)

if ! test -d $HYPRDOTS_CONFIG_DIR; then
    echo -e "${BOLD_RED}Could not find ${HYPRDOTS_CONFIG_DIR}. Exiting...${NC}"
    exit 1
fi

print_welcome() {
    echo -e "${BOLD_YELLOW}"
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║                                                        ║"
    echo "║                Fedora Hyprdots installer               ║"
    echo "║                                                        ║"
    echo "╠════════════════════════════════════════════════════════╣"
    echo "║  The following packages will be installed:             ║"

    for package in "${DNF_PACKAGES[@]}"; do
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
print_welcome

install_packages() {
    sudo dnf copr enable -y lionheartp/Hyprland
    sudo dnf copr enable -y dejan/lazygit

    echo -e "${BOLD_YELLOW}Installing starship...${NC}"
    curl -sS https://starship.rs/install.sh | sh
    for package in "${DNF_PACKAGES[@]}"; do
        echo -e "${BOLD_YELLOW}Installing dnf ${package}...${NC}"

        if sudo dnf install -y "$package"; then
            echo -e "${BOLD_GREEN}✓ ${package} installed${NC}"
        else
            echo -e "${BOLD_RED}✗ Failed to install ${package}${NC}"
            exit 1
        fi
    done

    echo -e "${BOLD_YELLOW}Installing lazydocker...${NC}"
    go install github.com/jesseduffield/lazydocker@latest

    echo -e "${BOLD_YELLOW}Installing aylurs-gtk-shell...${NC}"
    local TMP_DIR
    TMP_DIR=$(mktemp -d)

    git clone https://github.com/aylur/astal.git "$TMP_DIR/astal"
    meson setup "$TMP_DIR/astal/lib/astal/io/build" "$TMP_DIR/astal/lib/astal/io"
    meson install -C "$TMP_DIR/astal/lib/astal/io/build"
    meson setup "$TMP_DIR/astal/lib/astal/gtk3/build" "$TMP_DIR/astal/lib/astal/gtk3"
    meson install -C "$TMP_DIR/astal/lib/astal/gtk3/build"
    meson setup "$TMP_DIR/astal/lib/astal/gtk4/build" "$TMP_DIR/astal/lib/astal/gtk4"
    meson install -C "$TMP_DIR/astal/lib/astal/gtk4/build"

    git clone https://github.com/aylur/ags.git "$TMP_DIR/ags"
    npm install --prefix "$TMP_DIR/ags"
    meson setup "$TMP_DIR/ags/build" "$TMP_DIR/ags"
    meson install -C "$TMP_DIR/ags/build"
}
install_packages

copy_dotfiles() {
    if ! test -d $CONFIG_DIR/ags; then
        echo -e "${BOLD_YELLOW}Initializing AGS...${NC}"
        # 'ags init' fails for some reason, so we have to run this
        /usr/bin/npx -y @ts-for-gir/cli generate * \
            --ignoreVersionConflicts \
            --outdir /home/judi/.config/ags/@girs \
            -g /usr/local/share/gir-1.0 \
            -g /usr/share/gir-1.0 \
            -g /usr/share/*/gir-1.0 \
            -g
        echo
    fi
    echo -e "${BOLD_YELLOW}Copying dotfiles...${NC}"
    rm -rf $CONFIG_DIR/ags/app.ts
    rm -rf $CONFIG_DIR/ags/env.d.ts
    rm -rf $CONFIG_DIR/ags/.gitignore
    rm -rf $CONFIG_DIR/ags/package.json
    rm -rf $CONFIG_DIR/ags/style.css
    rm -rf $CONFIG_DIR/ags/tsconfig.json
    rm -rf $CONFIG_DIR/ags/widget/
    cp -rf "$HYPRDOTS_CONFIG_DIR/ags/"* "$CONFIG_DIR/ags/"
    for config in "$HYPRDOTS_CONFIG_DIR"/*; do
        # We do not override the entire ags folder because it contains auto-generated code.
        if [[ "$(basename "$config")" != "ags" ]]; then
            cp -rf "$config" "$CONFIG_DIR/";
        fi
    done
    cp .bashrc ~/
}
copy_dotfiles

install_fonts() {
    echo -e "${BOLD_YELLOW}Installing fonts...${NC}"
    mkdir -p $FONT_DIR

    curl -L \
        https://github.com/JudicaelT/Hyprdots/raw/refs/heads/main/.local/share/fonts/JetBrainsMono.zip?download= \
        -o $FONT_DIR/JetBrainsMono.zip
    unzip -qo $FONT_DIR/JetBrainsMono.zip -d $FONT_DIR/JetBrainsMono
    rm -rf $FONT_DIR/JetBrainsMono.zip

    curl -L \
        https://github.com/JudicaelT/Hyprdots/raw/refs/heads/main/.local/share/fonts/Nelphim-Font.zip?download= \
        -o $FONT_DIR/Nelphim-Font.zip
    unzip -qo $FONT_DIR/Nelphim-Font.zip -d $FONT_DIR/Nelphim-Font
    rm -rf $FONT_DIR/Nelphim-Font.zip
}
install_fonts

echo
echo -e "${BOLD_GREEN}All done! You may now restart your computer.${NC}"
