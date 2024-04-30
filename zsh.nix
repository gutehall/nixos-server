{ config, lib, pkgs, ... }:

{
    programs.zsh = { 
        
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
       cheat () { curl "http://cheat.sh/$1"; } 
      '';
      shellAliases = { 
         ll = "ls -l";
	       ls = "lsd";
       };

      oh-my-zsh = { 
        enable = true;
        plugins = [ 
          "git" 
          "aws" 
          "minikube" 
          "colored-man-pages" 
          "colorize" 
        ];
        theme = "bullet-train";
        customPkgs = with pkgs; [
          zsh-git-prompt
          zsh-nix-shell
          zsh-vi-mode
          zsh-completions
          zsh-command-time
          zsh-powerlevel10k
          zsh-fast-syntax-highlighting
          nix-zsh-completions
        ];
      };  
   };
}