# My Aliases
alias "cls"="clear"
alias "nix-edit"="sudo vim /etc/nixos/configuration.nix; sudo cp /etc/nixos/configuration.nix /home/peridot/dotfiles/configuration.nix"
alias "nix-refresh"="sudo nixos-rebuild switch"
alias "nix-clean"="sudo nix-collect-garbage -d"
alias "gs"="git status"
alias "ga"="git add"
alias "gc"="git commit -m"

# Direnv Hook
eval "$(direnv hook bash)"

# History Settings
HISTFILE="$HOME/.bash_history"
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"
