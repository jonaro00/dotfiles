#######################

# Node, pip and stuff
export PATH="$HOME/.local/bin:$PATH"
# Add cargo bins to PATH
source "$HOME/.cargo/env"

########################

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(direnv git python ripgrep rust starship)
source $ZSH/oh-my-zsh.sh
# custom git aliases
alias gpsupu='git push --set-upstream upstream $(git_current_branch)'
alias gsha='git rev-parse --short HEAD && git rev-parse HEAD'

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

# shuttle completions
eval "$(cargo-shuttle generate shell zsh)"
eval "$(shuttle generate shell zsh)"

# ssh agent
if [ -z "$SSH_AGENT_PID" ]; then
  eval "$(ssh-agent)" > /dev/null
  trap 'eval "$(ssh-agent -k)" > /dev/null' EXIT
fi

########################

if which nvim > /dev/null; then
    export EDITOR="$(which nvim)"
fi
alias vim=nvim
alias nv=nvim
alias v=nvim

alias zshconfig="${EDITOR:-nano} ~/.zshrc"

alias py=python3
alias python=python3

alias aptgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove -y"
alias aaa=aptgrade
alias disc='sudo dpkg -i $(ls -v ~/Downloads/discord*.deb | tail -1)'

alias s='shuttle'
alias cs='cargo shuttle'
alias rs='rust-script'

alias makeiu='make images && make up'
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

