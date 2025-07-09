{ config, pkgs, ... }:

let
  flameshotWithGrim = pkgs.flameshot.overrideAttrs (oldAttrs: {
    cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [ "-DUSE_WAYLAND_GRIM=ON" ];
    
    buildInputs = (oldAttrs.buildInputs or []) ++ [
      pkgs.grim
      pkgs.slurp
      pkgs.wl-clipboard
    ];
    
    
    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/flameshot \
        --prefix PATH : "${pkgs.lib.makeBinPath [pkgs.grim pkgs.slurp pkgs.wl-clipboard]}"
    '';
  });
in
{
  home.packages = [
    flameshotWithGrim
  ];
}