{ config, pkgs, ... }:

{
  imports = [
      ./zsh.nix 
      ./config.nix
      ./vim.nix
  ];

  home.username = "mathias";
  home.homeDirectory = "/home/mathias";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    vim
    vagrant
    packer
    ansible
    terraform
    git
    gh
    zsh
    oh-my-zsh
    #zsh-history-substring-search
    #zsh-fzf-tab
    #zsh-syntax-highlighting
    #zsh-autosuggestions
    tilix
    unrar
    unzip
    curl
    wget
    gnupg
    htop
    btop
    docker
    kubectl
    minikube
    lazygit
    lsd
    bat
    awscli2
    eza
    tmux
  ];

  home.file = {
    "./oh-my-zsh/themes/bullet-train.zsh-theme".source = ./sources/bullet-train.zsh-theme;
    "ohmyzsh.sh".source = ./sources/ohmyzsh.sh;
    ".zshrc".source = ./sources/.zshrc;
  };

  programs.home-manager.enable = true;
}
