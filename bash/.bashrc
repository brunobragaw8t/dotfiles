# General

## Aliases
alias open='xdg-open'

## Scripts
alias pp='bash ~/dotfiles/bash/scripts/pick-project.sh'

# Neovim

## Aliases
alias vim='nvim'

# lazygit

## Aliases
alias lg='lazygit'

# OpenCode

## Aliases
alias oc='opencode'

# tmux

if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new -c ~/repos
fi
