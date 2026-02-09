{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    package = pkgs.swayfx-unwrapped;
    enable = true;
    xwayland = true;
    checkConfig = false;
    extraConfig = ''
      blur enable
    '';
    config = rec {
      startup = [
        { command = "waybar"; }
      ];
      modifier = "Mod4";
      terminal = "kitty";
      output = {
        eDP-1 = {
          bg = "~/Pictures/wallpapers/girl_train.png fill";
        };
      };
      bars = [
        {
          mode = "invisible"; 
        }
      ];
      window = {
        titlebar = false;
        border = 0;
      };
      keybindings = {
        "${modifier}+r" = "exec kitty";
        "${modifier}+c" = "exec tofi-drun --drun-launch=true";
        "${modifier}+q" = "kill";
        "F11" = "exec flameshot gui";
        "F1" = "exec brightnessctl set 10%-";
        "F2" = "exec brightnessctl set 10%+";
        "F4" = "pactl set-sink-volume bluez_output.20_D8_A4_B8_E4_DF.1 0%";
        "F5" = "pactl set-sink-volume bluez_output.20_D8_A4_B8_E4_DF.1 -10%";
        "F6" = "pactl set-sink-volume bluez_output.20_D8_A4_B8_E4_DF.1 +10%";

        "${modifier}+1" = "workspace number 1";        
        "${modifier}+2" = "workspace number 2";        
        "${modifier}+3" = "workspace number 3";        
        "${modifier}+4" = "workspace number 4";        
        "${modifier}+5" = "workspace number 5";        
        "${modifier}+6" = "workspace number 6";        
        "${modifier}+7" = "workspace number 7";        
        "${modifier}+8" = "workspace number 8";        
        "${modifier}+9" = "workspace number 9";        
        "${modifier}+0" = "workspace number 10";        
        
        "${modifier}+Shift+1" = "move container to workspace number 1";        
        "${modifier}+Shift+2" = "move container to workspace number 2";        
        "${modifier}+Shift+3" = "move container to workspace number 3";        
        "${modifier}+Shift+4" = "move container to workspace number 4";        
        "${modifier}+Shift+5" = "move container to workspace number 5";        
        "${modifier}+Shift+6" = "move container to workspace number 6";        
        "${modifier}+Shift+7" = "move container to workspace number 7";        
        "${modifier}+Shift+8" = "move container to workspace number 8";        
        "${modifier}+Shift+9" = "move container to workspace number 9";        
        "${modifier}+Shift+0" = "move container to workspace number 10";        
      };
    };
  };
}
