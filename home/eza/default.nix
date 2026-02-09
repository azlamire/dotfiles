{ ... }:
{
  programs.eza = {
    enable = true;
    icons = "always";
    enableZshIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--octal-permissions"
      "--header"
    ];
  };
}