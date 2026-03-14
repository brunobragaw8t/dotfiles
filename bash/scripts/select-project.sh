#!/bin/bash

if [ ! -d "$HOME/projects" ]; then
    echo "Error: ~/projects directory does not exist"
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

cd "$HOME/projects" || exit 1

selected_dir=$(find . -maxdepth 1 -type d -not -path . | sed 's|./||' | sort | fzf --prompt="🔎 " --height=40% --border)

if [ -z "$selected_dir" ]; then
    echo "No directory selected. Exiting."
    exit 1
fi

if [ ! -d "$selected_dir" ]; then
    echo "No directories found in ~/projects"
    exit 1
fi

selected_path="$HOME/projects/$selected_dir"

tmux split-window -h
tmux split-window -h
tmux split-window -h
tmux split-window -h
tmux select-layout even-horizontal

tmux send-keys -t 0 "cd '$selected_path' && lazygit" C-m
tmux send-keys -t 1 "cd '$selected_path' && opencode" C-m
tmux send-keys -t 2 "cd '$selected_path' && vim" C-m
tmux send-keys -t 3 "cd '$selected_path' && clear" C-m # Left empty to run dev server
tmux send-keys -t 4 "cd '$selected_path' && clear" C-m # Left empty to run other scripts

tmux rename-window "$selected_dir"
