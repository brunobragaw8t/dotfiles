#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p ~/.config/alacritty
if [ -f ~/.config/alacritty/alacritty.toml ]; then
  mv ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.backup_$TIMESTAMP
fi
ln -s "$SCRIPT_DIR/alacritty.toml" ~/.config/alacritty/alacritty.toml
