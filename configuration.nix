# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
  # and in the NixOS manual (accessible by running ‘nixos-help’).
   
  { config, pkgs, ... }:

  {
    imports =
      [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
      ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "homeworld"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Montevideo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_UY.UTF-8";
      LC_IDENTIFICATION = "es_UY.UTF-8";
      LC_MEASUREMENT = "es_UY.UTF-8";
      LC_MONETARY = "es_UY.UTF-8";
      LC_NAME = "es_UY.UTF-8";
      LC_NUMERIC = "es_UY.UTF-8";
      LC_PAPER = "es_UY.UTF-8";
      LC_TELEPHONE = "es_UY.UTF-8";
      LC_TIME = "es_UY.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the XFCE Desktop Environment.
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xfce.enable = true;

    # Configure keymap in X11
    services.xserver = {
      layout = "latam";
      xkbVariant = "";
    };

    # Configure console keymap
    console.keyMap = "la-latin1";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = false;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # virtualisation.docker.enable = true;
    # containers.docker = {
      # privateNetwork = false;
      # path = "/home/peridot";
    # };
    # networking.firewall.trustedInterfaces = [ "docker0" ];

    virtualisation = {
      podman = {
        enable = false;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    users.users.peridot = {
      isNormalUser = true;
      description = "Nicolas Gabin";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [
        firefox
        vim_configurable
        curl
        wget
        git
        direnv
        mpv
        nix-direnv
        awscli2
        neofetch
        obsidian
        # docker
        # docker-compose
        aflplusplus
        jq
        burpsuite
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "jonathan";
      plugins = [
        "git"
        "direnv"
        "history"
      ];
    };
  };

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];
  programs.vim = {
    defaultEditor = true;
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "peridot";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    k3s
    unzip
    # eww
  ];

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
  networking.firewall.allowedTCPPorts = [ 8888 6443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];
  nixpkgs.config.permittedInsecurePackages = [
      "electron-25.9.0"
  ];

  nix.gc.automatic = true;
  security.pki.certificateFiles = [ "/home/peridot/Downloads/cacert.der" ];  
  security.sudo.wheelNeedsPassword = false;
  services.k3s = {
    enable = false;
    role = "server";
    extraFlags = "--kubelet-arg=v=4";
  };
  }
