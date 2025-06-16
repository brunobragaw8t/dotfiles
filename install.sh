#!/bin/bash
DOTFILES_DIR="$HOME/dotfiles"

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup
ln -s "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf

