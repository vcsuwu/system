{ config, pkgs, ... }:

{

  home.username = "vocus";
  home.homeDirectory = "/home/vocus";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./modules/home/packages.nix
    ./modules/home/xdg.nix
    ./modules/home/programs/programs.nix
  ];

  programs.home-manager.enable = true;
}
