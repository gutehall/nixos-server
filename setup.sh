#!/bin/bash

# Clone the repository
git clone https://github.com/gutehall/nixos-server
cd nixos-server

# Replace the configuration files with those from the repository
sudo cp -r configuration/* /etc/nixos/

# Optionally, you can customize the configuration files here
# For example:
# sed -i 's/original_text/replacement_text/g' /etc/nixos/configuration.nix

# Activate the new configuration
sudo nixos-rebuild switch

# Install Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
