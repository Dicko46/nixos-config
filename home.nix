{ pkgs, pkgs-unstable, inputs, ... }:
let
  nur-pkgs = inputs.nur.legacyPackages.${pkgs.system}.repos;
in
{
  home.username = "diecko"; # Ganti ini
  home.homeDirectory = "/home/diecko"; # Ganti ini

  home.packages = with pkgs; [
    vscode telegram-desktop vlc ocs-url heroic nautilus subtitleedit
    pkgs-unstable.kdePackages.qtstyleplugin-kvantum 
    # NUR
    # pkgs.nur.repos.lonerOrz.xdman7 

    (pkgs.python3.withPackages (ps: with ps; [
      pandas requests numpy matplotlib
    ]))
  ];

  programs.mpv = {
    enable = true;
    config = {
      volume = 80; # Set volume awal 30%
      volume-max = 150;
      save-position-on-quit = true;
      profile = "gpu-hq";
      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "auto-safe";
      screenshot-format = "png";
      screenshot-directory = "~/Pictures/Screenshots";
      sub-auto = "fuzzy";
      sl = "id";
      sub-codepage = "sjis";
    };
  };


  xdg.userDirs = {
  enable = true;
  createDirectories = true; # Otomatis membuat folder Downloads, Documents, dll.
};

  # Contoh settingan config tradisional
  # home.file.".config/kitty/kitty.conf".text = ''
  #  background_opacity 0.9
  #  font_family JetBrains Mono
  # '';

  # Jangan diubah, ini versi pertama kali install HM
  home.stateVersion = "25.11";
}
