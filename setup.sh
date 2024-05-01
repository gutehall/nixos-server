#!/bin/bash

# Install Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

# Replace the configuration files with those from the repository
# sudo rm -rf /etc/nixos/configuration.nix
# sudo cp *.nix /etc/nixos/

# Insert support for the configuration
config_to_insert='
nix.nixPath = [
  "nixos-config=/home/mathias/nixos"
];
'

# Insert the configuration into the file
sudo sed -i "/^}/i $config_to_insert" "/etc/nixos/configuration.nix"

# Optionally, you can customize the configuration files here
# For example:
# sed -i 's/original_text/replacement_text/g' /etc/nixos/configuration.nix

# Activate the new configuration
sudo nixos-rebuild switch --use-remote-sudo -I nixos-config=/home/mathias/nixos
