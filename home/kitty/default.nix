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
    };
  };
}