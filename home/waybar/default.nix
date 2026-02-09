{ ... }: {

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 0;
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "network"
        "custom/divider"
        "battery"
        "custom/divider"
        "temperature"
        "custom/divider"
        "memory"
        "custom/divider"
        "cpu"
        "custom/endright"
      ];
      "hyprland/window" = { format = "{}"; };
      "wlr/workspaces" = {
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
        all-outputs = true;
        on-click = "activate";
      };
      cpu = {
        interval = 10;
        format = "  {usage}%";
        max-length = 10;
        on-click = "";
      };
      battery= {
          states = {
            "good"= 95;
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-icons= [" " " " " " " " " "];
      };
      memory = {
        interval = 30;
        format = "  {percentage}%";
        format-alt = " {used:0.1f}G";

        states = {
          "warning"= 80;
          "critical"= 95;
        };
        tooltip = "{}";
        tooltip-format = "{used}/{total} GiB";
        max-length = 10;
      };
      temperature = {
          format = " {temperatureC}°C";
      };
      clock = {
        format = " {:%H:%M   %a %d.%m}";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            today = "<span color='#ff6699'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            months = "<span color='#ffead3'><b>{}</b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
        interval = 1;
      };

      network =  {
        interval = 2;
        format = "󱘖  Offline";
        format-wifi = "{icon} {bandwidthDownBits}";
        min-length = 11;
        tooltip = "{}";
        tooltip-format-wifi = "{ifname}\n{essid}\n{signalStrength}% \n{frequency} GHz\n󰇚 {bandwidthDownBits}\n󰕒 {bandwidthUpBits}";
        tooltip-format-ethernet = "{ifname}\n󰇚 {bandwidthDownBits} \n󰕒 {bandwidthUpBits}";
        on-click = "iwgtk& aplay ~/.config/sounds/interact.wav";
        format-icons = ["󰤫 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
        states = {
          "normal" = 25;
        };
      };
      "custom/divider" = {
        format = " | ";
        interval = "once";
        tooltip = false;
      };
      "custom/endright" = {
        format = "  ";
        interval = "once";
        tooltip = false;
      };
    }];
  };
}

