{ config, lib, pkgs, ... }:

{
   programs.zsh = {
     enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "bullet-train";
        plugins = [
          "git"
          "aws"
          "minikube"
          "colored-man-pages"
          "colorize"
        ];
      };
    };
 }