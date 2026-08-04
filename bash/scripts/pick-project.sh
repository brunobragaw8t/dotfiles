#!/bin/bash

if [ ! -d "$HOME/repos" ]; then
    echo "Error: ~/repos directory does not exist"
    exit 1
fi

if [ -z "$TMUX" ]; then
    echo "Error: This script must be run inside a tmux session"
    exit 1
fi

if ! command -v fzf &> /dev/null; then
    echo "Error: fzf is not installed. Please install fzf first."
    exit 1
fi

cd "$HOME/repos" || exit 1

selected_dir=$(find . -maxdepth 1 -type d -not -path . | sed 's|./||' | sort | fzf --prompt="🔎 " --height=40% --border)

if [ -z "$selected_dir" ]; then
    echo "No directory selected. Exiting."
    exit 1
fi

if [ ! -d "$selected_dir" ]; then
    echo "No directories found in ~/repos"
    exit 1
fi

selected_path="$HOME/repos/$selected_dir"

tmux send-keys -t 0 "cd '$selected_path' && lazygit" C-m
tmux split-window -h -c "$selected_path" "opencode; exec \$SHELL"
tmux split-window -h -c "$selected_path" "nvim; exec \$SHELL"
tmux split-window -h -c "$selected_path" "$SHELL" # Left empty to run other scripts
tmux split-window -h -c "$selected_path" "$SHELL" # Left empty to run dev server

tmux select-layout even-horizontal
tmux rename-window "$selected_dir"
