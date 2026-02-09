{ config, lib, inputs, ... }: {
  options.modules.nix.enable = lib.mkEnableOption "Enable default settings for nix";

  config = lib.mkIf config.modules.nix.enable {
    nix = {
      extraOptions = ''
        warn-dirty = false
      '';
    };
  };
}
