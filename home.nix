{ pkgs, inputs, ... }:
let
  nur-pkgs = inputs.nur.legacyPackages.${pkgs.system}.repos;
in
{
  home.username = "diecko"; # Ganti ini
  home.homeDirectory = "/home/diecko"; # Ganti ini

  home.packages = with pkgs; [
    vscode
  ];

  # Contoh settingan config tradisional
  # home.file.".config/kitty/kitty.conf".text = ''
  #  background_opacity 0.9
  #  font_family JetBrains Mono
  # '';

  # Jangan diubah, ini versi pertama kali install HM
  home.stateVersion = "25.11";
}
