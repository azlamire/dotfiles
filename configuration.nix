{ config, lib, pkgs, ... }:
{
  imports = [ 
      ./import.nix
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
          editor = false;
        };
        efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    tmp.cleanOnBoot = true;
  };
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "juchi"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Helsinki";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "FiraCode";
    useXkbConfig = true; # use xkb.options in tty.
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    fira-code
    nerd-fonts.fira-code
  ];
  hardware = {
    bluetooth.enable = true;
  };
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway waybar";
        };
      };
    };

    
    pipewire = {
      enable = true;
      alsa.enable = true;  # Enable ALSA support
      pulse.enable = true; # Enable PulseAudio support
      jack.enable = true;  # Enable JACK support
      wireplumber.enable = true;
    };
    fstrim.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;
    tlp = {
      enable = true;
      settings = {
        PLATFORM_PROFILE_ON_AC = "perfomance";
        PLATFORM_PROFILE_ON_BAT = "balanced";

        CPU_ENERGY_PERF_POLICY_ON_AC = "perfomance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_perfomance";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_BAT = 0;
        CPU_MAX_PERF_BAT = 40;
      };
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.juchi = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.

    };
  };
  programs = {
    zsh.enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gh
    wl-mirror
    pulseaudio
    typescript
    vivid
    tg
    tor
    coreutils
    nh
    anydesk
    pkg-config
    glibc
    bat
    tree
    efibootmgr
    parted
    vim     
    neovim
    nekoray
    wget
    kitty
    gdb
    neofetch
    git
    gnumake
    greetd.tuigreet
    obsidian
    acpi
    brightnessctl
    bluez
    unzip
    gcc
    nodejs
    python3Full
    go
    xwayland
    polkit
    wl-clipboard
    obsidian
  ];
  # Set global include paths
  environment= {
    variables = {
      CPLUS_INCLUDE_PATH = "${pkgs.gtest}/include";
      LIBRARY_PATH = "${pkgs.gtest}/lib";
    };
  };

  security.polkit.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

        
}