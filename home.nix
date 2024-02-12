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
