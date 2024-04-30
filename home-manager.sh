#!/usr/bin/env bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Install Home Manager as a module
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Set up Home Manager configuration
# mkdir -p /etc/nixos
# cat <<EOF > /etc/nixos/configuration.nix
# { config, pkgs, ... }:

# {
#   imports =
#     [ # Include the results of the hardware scan.
#       ./hardware-configuration.nix
#       ./home-manager-path.nix
#     ];

#   home-manager.users.<username> = {
#     packages = with pkgs; [
#       # Add packages you want to install for your user here
#       emacs
#       git
#       # Add more packages as needed
#     ];

#     # Add any other user-specific configurations here
#   };
# }
# EOF

# # Create home-manager-path.nix
# cat <<EOF > /etc/nixos/home-manager-path.nix
# { pkgs, ... }:
# {
#   imports =
#     [ <home-manager> ];
# }
# EOF

# Reload the NixOS configuration
nixos-rebuild switch
