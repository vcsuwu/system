{ pkgs, config, ... }:
{
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
      PS1="[%n@%m %~ ]  "
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
}
