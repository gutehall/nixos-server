{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
    aliases = {
      ci = "commit";
      co = "checkout";
      gs = "status";
      gpl = "pull";
  };
}