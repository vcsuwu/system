{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        "col.inactive_border" = "rgba(aaaaaaff)";
	"col.active_border" = "rgba(aaaaaaff)";
	gaps_in = 5;
	gaps_out = 10;
      };
      decoration = {
        drop_shadow = false;
	blur = {
	  enabled = false;
	};
      };
      animations = {
        enabled = false;
      };
      input = {
        kb_layout = "us,ru";
	kb_options = "grp:alt_shift_toggle";
      };
      misc = {
        disable_hyprland_logo = true;
	force_default_wallpaper = 0;
      };
      binds = {
        allow_workspace_cycles = true;
      };
      "$mod" = "SUPER";
      bind =
      [
        "$mod SHIFT, C, killactive"
	"$mod, Return, exec, kitty"
	"$mod, R, exec, rofi -show drun"
	"$mod SHIFT, Q, exit"
	"$mod, TAB, workspace, previous"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    };
  };

}
