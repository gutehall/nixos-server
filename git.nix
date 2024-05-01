  # programs.git = {
  #   enable = true;
  #   userName = "";
  #   userEmail = "";
  #   aliases = {
  #     ci = "commit";
  #     co = "checkout";
  #     s = "status";
  #   };
  # };

{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };
}