{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles."juchi" = {
      id = 0;
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
        privacy-badger
      ];
    };
  };
}