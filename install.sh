#!/bin/bash
DOTFILES_DIR="$HOME/dotfiles"

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

mkdir ~/.config/alacritty
[ -f ~/.config/alacritty/alacritty.toml ] && mv ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.backup
ln -s "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml

sudo ln -s "$DOTFILES_DIR/bash/.bashrc" /etc/bashrc.local

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf

[ -f ~/.config/Cursor/User/settings.json ] && mv ~/.config/Cursor/User/settings.json ~/.config/Cursor/User/settings.json.backup
ln -s "$DOTFILES_DIR/cursor/user-settings.json" ~/.config/Cursor/User/settings.json

[ -f ~/.config/Cursor/User/keybindings.json ] && mv ~/.config/Cursor/User/keybindings.json ~/.config/Cursor/User/keybindings.json.backup
ln -s "$DOTFILES_DIR/cursor/user-keybindings.json" ~/.config/Cursor/User/keybindings.json

[ -f ~/.config/zed/settings.json ] && mv ~/.config/zed/settings.json ~/.config/zed/settings.json.backup
ln -s "$DOTFILES_DIR/zed/user-settings.json" ~/.config/zed/settings.json

[ -f ~/.config/zed/keymap.json ] && mv ~/.config/zed/keymap.json ~/.config/zed/keymap.json.backup
ln -s "$DOTFILES_DIR/zed/user-keymap.json" ~/.config/zed/keymap.json
