{ config, pkgs, ... }:

{
  home.username = "vocus";
  home.homeDirectory = "/home/vocus";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    firefox
    kitty
    rofi-wayland
    vesktop
    keepassxc

    # For hyprland
    dunst
    grim
    slurp

    # Fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

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

  programs.git = {
    enable = true;
    userName = "vocus";
    userEmail = "zenyabtw@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    initExtra = ''
      PS1="[%n@%m %~ ]  "
    '';
  };

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";
    settings = {
      background = "#000000";
      foreground = "#ffffff";
      background_opacity = "0.8";
    };
    shellIntegration.enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
}
