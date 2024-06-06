{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nur.nixosModules.nur
  ];

  home.username = "vocus"; home.homeDirectory = "/home/vocus";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    firefox
    keepassxc
    nekoray
    vesktop
    hyprpaper
    kitty
    rofi-wayland
    telegram-desktop
    xdg-utils
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    (nerdfonts.override { fonts = [ "JetBrainsMono" "IosevkaTerm" ]; })
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL=1;
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
    dotDir = ".config/zsh";
    initExtra = ''
      PS1="[%n@%m %~ ]  "
    '';
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.kitty = {
    enable = true;
    font.name = "IosevkaTerm Nerd Font Mono";
    settings = {
      cursor = "#ffffff";
      background = "#000000";
      foreground = "#ffffff";
      background_opacity = "0.8";
      window_padding_width = 5;
      placement_strategy = "top-left";
      disable_ligatures = "always";
      window_margin_width = 10;
    };
    shellIntegration.enableZshIntegration = true;
  };

  programs.firefox = {
    enable = true;
    profiles.main = {
      isDefault = true;
      name = "vocus";
      extensions = with config.nur.repos.rycee.firefox-addons; [
        ublock-origin
      ];
      search = {
        default = "DuckDuckGo";
	force = true;
      };
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
	"browser.aboutwelcome.enabled" = false;
	"browser.tabs.firefox-view" = false;
	"browser.startup.firstrunSkipsHomepage" = false;
	"browser.startup.homepage" = "chrome://browser/content/blanktab.html";
	"browser.newtabpage.enabled" = false;
	"browser.sessionstore.resume_from_crash" = false;
	"datareporting.policy.firstRunURL" = "";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";
      exec-once = [
        "firefox"
      ];
      bind = [
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
	"$mod, TAB, workspace, previous"
	"$mod, C, killactive"
	"$mod SHIFT, Q, exit"
	"$mod, R, exec, $menu"
	"$mod, Return, exec, $terminal"
      ];
      general = {
        gaps_in = 10;
	gaps_out = 20;
      };
      input = {
        kb_layout = "us,ru";
	kb_options = "grp:alt_shift_toggle";
      };
      animations = {
        enabled = false;
      };
      misc = {
        disable_hyprland_logo = true;
      };
      binds = {
        allow_workspace_cycles = true;
      };
    };
  };

  programs.home-manager.enable = true;

}
