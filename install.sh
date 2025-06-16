#!/bin/bash
DOTFILES_DIR="$HOME/dotfiles"

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.backup
ln -s "$DOTFILES_DIR/bash/.bashrc" ~/.bashrc

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf

[ -f ~/.config/Cursor/User/settings.json ] && mv ~/.config/Cursor/User/settings.json ~/.config/Cursor/User/settings.json.backup
ln -s "$DOTFILES_DIR/cursor/user-settings.json" ~/.config/Cursor/User/settings.json

[ -f ~/.config/Cursor/User/keybindings.json ] && mv ~/.config/Cursor/User/keybindings.json ~/.config/Cursor/User/keybindings.json.backup
ln -s "$DOTFILES_DIR/cursor/user-keybindings.json" ~/.config/Cursor/User/keybindings.json
