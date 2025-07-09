{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "cherenko";
    userEmail = "cherenko@cs.karelia.ru";
    signing = {
      key = "${config.home.homeDirectory}/.ssh/gitlab.pub";
      signByDefault = true;
    };
    extraConfig ={
      init = {
        defaultBranch = "master";
      };
      gpg.format = "ssh";
    };

  };
}