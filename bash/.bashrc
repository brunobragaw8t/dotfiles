# Neovim

## Aliases
alias vim='nvim'

# Lazygit

## Aliases
alias lg='lazygit'

# OpenCode

## Aliases
alias oc='opencode'

# Scripts

alias pp='bash ~/dotfiles/bash/scripts/pick-project.sh'

# Tmux

if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new
fi
