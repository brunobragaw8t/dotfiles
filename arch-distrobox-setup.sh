#!/bin/bash

set -euo pipefail

REPO_URL="https://github.com/brunobragaw8t/dotfiles"
DOTFILES_DIR="$HOME/dotfiles"

SUDO=""
if [ "$(id -u)" -ne 0 ]; then
  SUDO="sudo"
fi

echo "==> Installing packages via pacman"
$SUDO pacman -Syu --noconfirm --needed \
  base-devel \
  curl \
  wget \
  unzip \
  fzf \
  ripgrep \
  fd \
  eza \
  alacritty \
  wl-clipboard \
  tmux \
  git \
  lazygit \
  opencode \
  neovim \
  tree-sitter \
  bun

echo "==> Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash

echo "==> Cloning dotfiles repo"
git clone "$REPO_URL" "$DOTFILES_DIR"

echo "==> Linking configs"
mkdir -p ~/.config/alacritty
ln -s "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf

echo "==> Cloning nvim config"
git clone https://github.com/brunobragaw8t/nvim ~/.config/nvim

echo "==> Wiring up bash config"
echo "" >> ~/.bashrc
echo "# Custom .bashrc" >> ~/.bashrc
echo '[ -f "$HOME/dotfiles/bash/.bashrc" ] && source "$HOME/dotfiles/bash/.bashrc"' >> ~/.bashrc

echo "==> Exporting alacritty to host"
distrobox-export --app alacritty

echo "==> Done. Restart your shell to pick up the new .bashrc."
