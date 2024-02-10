alias "cls"="clear"
alias "nix-edit"="sudo vim /etc/nixos/configuration.nix; sudo cp /etc/nixos/configuration.nix /home/peridot/dotfiles/configuration.nix"
alias "nix-refresh"="sudo nixos-rebuild switch"
eval "$(direnv hook bash)"
