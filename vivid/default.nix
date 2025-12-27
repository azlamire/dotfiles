{ config, lib, pkgs, ... }: {
  programs.vivid = {
      enable = true;
      theme = "alabaster_dark";
  };
}