#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.backup_$TIMESTAMP
fi
ln -s "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf
