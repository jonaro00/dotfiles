########################

# Node, pip and stuff
export PATH="$HOME/.local/bin:$PATH"
# Add cargo bins to PATH
source "$HOME/.cargo/env"

########################

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(git ripgrep rust starship)
source $ZSH/oh-my-zsh.sh

########################

# zoxide plugin modification, use 'c' instead of 'z'
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd c)"
else
  echo '[oh-my-zsh] zoxide not found, please install it from https://github.com/ajeetdsouza/zoxide'
fi

# atuin shell history
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget

# cargo shuttle completions
eval "$(cargo shuttle generate -s zsh)"

########################

export EDITOR=/usr/bin/nano

alias zshconfig="$EDITOR ~/.zshrc"

alias py=python3
alias python=python3

alias aptgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove"

#######################

if [ -n "$WSL_DISTRO_NAME" ]; then
    source ~/.zshrc-wsl
fi

if [ -f ~/.zshrc-local.sh ]; then
    source ~/.zshrc-local.sh
fi

#######################
