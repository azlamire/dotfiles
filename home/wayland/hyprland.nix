{ config, pkgs, ... }:
{
  home = {
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "Vanilla-DMZ";
      };
    };
  };  
  services.hyprpaper = {
      enable = true;
      settings = {
          ipc = "on";
          splash = false;
          splash_offset = 2.0;


          wallpaper = {
            monitor = "eDP-1";
            path = "/home/yahal/Pictures/wallpapers/wallhaven-4gyy33_1920x1080.png";
            fit_mode = "cover";
          };
      };
  };
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      monitor= "eDP-1,preferred,auto,1";

      exec-once = [
        "activate-linux"
        "waybar"
        "hyprctl dispatch -- exec [workspace 1 silent] firefox;"
        "hyprctl dispatch -- exec [workspace 2 silent] kitty --session /etc/nixos/home/wayland/start-scripts/frontend.kitty-session;"
        "hyprctl dispatch -- exec [workspace 3 silent] kitty --session /etc/nixos/home/wayland/start-scripts/backend.kitty-session;"
        "hyprctl dispatch -- exec [workspace 4 silent] kitty --session /etc/nixos/home/wayland/start-scripts/dev.kitty-session;"
        "hyprctl dispatch -- exec [workspace 10 silent] kitty --session /etc/nixos/home/wayland/start-scripts/others.kitty-session;"
      ];

      "env" = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 0;
        "col.active_border" = "rgba(ff1212d9) rgba(ff9f00ff) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      input = {
        kb_layout = "us, ru";
        kb_options = "grp:win_space_toggle";
      };
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1"
          "quick,0.15,0,0.1,1"
        ];
        
        animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear,fade"
          "workspacesIn,1,1.21,almostLinear,fade"
          "workspacesOut,1,1.94,almostLinear,fade"
          "zoomFactor,1,7,quick"
        ];
      };
      decoration = {
        rounding = 10;
      };
      bind = [
          "$mainMod, R, exec, $terminal"
          "$mainMod, Q, killactive,"
          "$mainMod, C, exec, wofi --show drun"
          "$mainMod, V, togglefloating,"
          ", F11, exec, flameshot gui"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
           [
              "$mainMod, ${toString (i+1)}, workspace, ${toString (i+1)}"
              "$mainMod SHIFT, ${toString (i+1)}, movetoworkspace, ${toString (i+1)}"
            ]
          )
          9)
      );
    };
  };
}
