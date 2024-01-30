########################

# Node, pip and stuff
export PATH="$HOME/.local/bin:$PATH"
# Add cargo bins to PATH
source "$HOME/.cargo/env"

########################

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(git ripgrep rust starship python)
source $ZSH/oh-my-zsh.sh
# custom git aliases
alias gpsupu='git push --set-upstream upstream $(git_current_branch)'

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
eval "$(cargo-shuttle generate shell zsh)"

# ssh agent
eval $(ssh-agent) > /dev/null

########################

export EDITOR="/home/jonaro00/.local/bin/nvim"
alias vim=nvim
alias nv=nvim
alias v=nvim

alias zshconfig="$EDITOR ~/.zshrc"

alias py=python3
alias python=python3

alias aptgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove"

alias cs='cargo shuttle'
alias rs='rust-script'
alias makeiu='USE_PANAMAX=disable make images && USE_PANAMAX=disable make up'
if which docker > /dev/null && [ $(docker context show) = "desktop-linux" ]; then
    export DOCKER_HOST="unix://$HOME/.docker/desktop/docker.sock"
fi

#######################

if [ -n "$WSL_DISTRO_NAME" ]; then
    source ~/.zshrc-wsl
fi

if [ -f ~/.zshrc-local ]; then
    source ~/.zshrc-local
fi

#######################

