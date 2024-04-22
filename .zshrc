# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="jonathan"

# Plugins
plugins=(
	git
	direnv
)

source $ZSH/oh-my-zsh.sh

# My Aliases
alias "cls"="clear"
alias "nix-edit"="sudo vim /etc/nixos/configuration.nix; sudo cp /etc/nixos/configuration.nix /home/peridot/dotfiles/configuration.nix"
alias "nix-refresh"="sudo nixos-rebuild switch"
alias "nix-clean"="sudo nix-collect-garbage -d"
alias "gs"="git status"
alias "ga"="git add"
alias "gc"="git commit -m"

# Direnv hook
eval "$(direnv hook bash)"

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt APPEND_HISTORY
setopt HIST_NO_STORE
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"
