#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

if [ -f ~/.var/app/dev.zed.Zed/config/zed/settings.json ]; then
  mv ~/.var/app/dev.zed.Zed/config/zed/settings.json ~/.var/app/dev.zed.Zed/config/zed/settings.json.backup_$TIMESTAMP
fi
ln -s "$SCRIPT_DIR/user-settings.json" ~/.var/app/dev.zed.Zed/config/zed/settings.json

if [ -f ~/.var/app/dev.zed.Zed/config/zed/keymap.json ]; then
  mv ~/.var/app/dev.zed.Zed/config/zed/keymap.json ~/.var/app/dev.zed.Zed/config/zed/keymap.json.backup_$TIMESTAMP
fi
ln -s "$SCRIPT_DIR/user-keymap.json" ~/.var/app/dev.zed.Zed/config/zed/keymap.json
