{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;
    extraConfig = "
      export $TERM=xterm-256color
    ";
    settings = {
      font_size = 15.0;
      background_opacity = 0.5;
      background_blur = 1;
      font_family = "FiraCode Nerd Font";
      allow_remote_control = "yes";
      active_tab_foreground = "#dd3a44";
      active_tab_background = "#000000";
    };
  };
}
