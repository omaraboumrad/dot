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

export DOCKER_DEFAULT_PLATFORM=linux/amd64
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
