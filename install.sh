#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.backup_$TIMESTAMP
fi
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

mkdir -p ~/.config/alacritty
if [ -f ~/.config/alacritty/alacritty.toml ]; then
  mv ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.backup_$TIMESTAMP
fi
ln -s "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml

if [ -f /etc/bashrc.local ]; then
  mv /etc/bashrc.local /etc/bashrc.local.backup_$TIMESTAMP
fi
sudo ln -s "$DOTFILES_DIR/bash/.bashrc" /etc/bashrc.local

if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.backup_$TIMESTAMP
fi
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf

if [ -f ~/.var/app/dev.zed.Zed/config/zed/settings.json ]; then
  mv ~/.var/app/dev.zed.Zed/config/zed/settings.json ~/.var/app/dev.zed.Zed/config/zed/settings.json.backup_$TIMESTAMP
fi
ln -s "$DOTFILES_DIR/zed/user-settings.json" ~/.var/app/dev.zed.Zed/config/zed/settings.json

if [ -f ~/.var/app/dev.zed.Zed/config/zed/keymap.json ]; then
  mv ~/.var/app/dev.zed.Zed/config/zed/keymap.json ~/.var/app/dev.zed.Zed/config/zed/keymap.json.backup_$TIMESTAMP
fi
ln -s "$DOTFILES_DIR/zed/user-keymap.json" ~/.var/app/dev.zed.Zed/config/zed/keymap.json
