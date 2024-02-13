{ config, pkgs, ...}:

{
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
	pkgs.xdg-desktop-portal-hyprland
      ];
    config.common.default = "*";
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/other/desktop";
      publicShare = "${config.home.homeDirectory}/other/public";
      templates = "${config.home.homeDirectory}/other/templates";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/installs";
      music = "${config.home.homeDirectory}/media/music";
      pictures = "${config.home.homeDirectory}/media/pics";
      videos = "${config.home.homeDirectory}/media/vids";
    }; 
  };
}
