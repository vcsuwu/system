{pkgs, ...}:
{
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
}
