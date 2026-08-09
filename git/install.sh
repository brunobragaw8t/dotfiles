#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.backup_$TIMESTAMP
fi
ln -s "$SCRIPT_DIR/.gitconfig" ~/.gitconfig
