{ pkgs, pkgs-unstable, inputs, ... }:
let
  nur-pkgs = inputs.nur.legacyPackages.${pkgs.system}.repos;
in
{
  home.username = "diecko"; # Ganti ini
  home.homeDirectory = "/home/diecko"; # Ganti ini

  home.packages = with pkgs; [
    vscode ayugram-desktop vlc ocs-url
    pkgs-unstable.kdePackages.qtstyleplugin-kvantum heroic
    # NUR
    pkgs.nur.repos.lonerOrz.xdman7

    (pkgs.python3.withPackages (ps: with ps; [
      pandas requests numpy matplotlib
    ]))
  ];

  xdg.userDirs = {
  enable = true;
  createDirectories = true; # Otomatis membuat folder Downloads, Documents, dll.
};

  xdg.desktopEntries = {
    xdman = {
      name = "Xtreme Download Manager";
      genericName = "Download Manager";
      exec = "xdman"; # Cukup tulis begini saja
      icon = "xdman";
      comment = "Powerfull download accelerator and video downloader";
      categories = [ "Network" "FileTransfer" ];
      terminal = false;
    };
  };

  # Contoh settingan config tradisional
  # home.file.".config/kitty/kitty.conf".text = ''
  #  background_opacity 0.9
  #  font_family JetBrains Mono
  # '';

  # Jangan diubah, ini versi pertama kali install HM
  home.stateVersion = "25.11";
}
