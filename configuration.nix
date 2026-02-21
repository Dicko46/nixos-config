# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

   # Enable Optimization (deduplication)
  nix.settings.auto-optimise-store = true;

  # fix initramfs phase boot
  hardware.amdgpu.initrd.enable = true;

  # AMD Graphics Configuration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.opencl.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "hype7x8"; # Define your hostname.
  networking.firewall.enable = false; # Mematikan firewall agar vpn tidak diblokir
  boot.kernelModules = [ "tun" ]; # Enable Tun for vpn services
  networking.networkmanager.wifi.powersave = false; # disable wifi power save
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ms_MY.UTF-8";
    LC_IDENTIFICATION = "ms_MY.UTF-8";
    LC_MEASUREMENT = "ms_MY.UTF-8";
    LC_MONETARY = "ms_MY.UTF-8";
    LC_NAME = "ms_MY.UTF-8";
    LC_NUMERIC = "ms_MY.UTF-8";
    LC_PAPER = "ms_MY.UTF-8";
    LC_TELEPHONE = "ms_MY.UTF-8";
    LC_TIME = "ms_MY.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable Flatpak support
  services.flatpak.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.diecko = {
    isNormalUser = true;
    description = "Dicko Rahmansyah";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  environment.pathsToLink = [
    "share/thumbnailers"
  ];

  # Install firefox.
  programs.firefox.enable = true;

  programs.gamemode.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  documentation.man.enable = true; # Enable man pages
  documentation.man.generateCaches = true; # Menghasilkan cache manual page

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    mpv
    kitty
    bat
    fastfetch
    ffmpeg-headless
    ffmpegthumbnailer
    gdk-pixbuf
     # For general HEIF container support (this includes the AVIF file format) 
    pkgs.libheif.bin # provides heif-thumbnailer (the program that generates HEIF thumbnails)
    pkgs.libheif.out # provides heif.thumbnailer (allows for the viewing of HEIF thumbnails
    # For more newer AVIF specific support usually not needed if libheif is installed
    pkgs.libavif
    # For JXL(JPEG XL) support
    pkgs.libjxl
    # For WebP support
    pkgs.webp-pixbuf-loader
    kdePackages.kdegraphics-thumbnailers # Untuk gambar
    kdePackages.ffmpegthumbs             # <--- Gunakan ini untuk video di KDE 6
    kdePackages.taglib

    # Graphics
    libva-utils
    vulkan-loader
    vulkan-tools # vulkaninfo

    # Tools
    micro
    kdePackages.partitionmanager
    ffmpeg-full

    # Modules
    # zsh
    # oh-my-zsh
    mihomo
    pciutils
    usbutils
    gamemode
    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
    gst_all_1.gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst_all_1.gst-plugins-base
    # Specialized plugins separated by quality
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst_all_1.gst-vaapi
    #iw
    #wirelesstools
    #inetutils
    speedtest-cli
    smartmontools
    ntfs3g
    exfatprogs
    unrar
    unzip
    #steam-run
    #desktop-file-utils
    pkgs-unstable.wine

  ];

  services.tumbler.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

   programs.git = {
     enable = true;
   };
   programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
