#!/bin/bash

# Install Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
# export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

sudo mv /etc/nixos /etc/nixos.bak 
sudo ln -s ~/nixos/ /etc/nixos
sudo nixos-rebuild switch