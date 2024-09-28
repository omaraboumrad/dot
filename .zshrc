export ZSH="/Users/xterm/.oh-my-zsh"

ZSH_THEME="xterm"

plugins=(git fzf docker fzf-docker docker-compose)

set -o vi

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF Nord theme
# export FZF_DEFAULT_OPTS='--color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# K8S
alias k="kubectl"
export do="--dry-run=client -o yaml"
export now="--force --grace-period=0"
export KSHELL="bash"

# Compose
alias dcps='docker compose ps -a --format "table {{.Service}}\t{{.Status}}" | awk '\''BEGIN { RED="\033[1;31m"; GREEN="\033[1;32m"; NC="\033[0m" } /Exited/ { printf RED $0 NC "\n"; next } /Up/ { printf GREEN $0 NC "\n"; next } { print $0 }'\'

export DOCKER_DEFAULT_PLATFORM=linux/amd64
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xterm/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/xterm/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xterm/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/xterm/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Created by `pipx` on 2024-07-05 14:06:27
export PATH="$PATH:/Users/xterm/.local/bin"
