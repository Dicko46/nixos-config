{
  description = "Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        # Bagian ini HARUS ada di sini agar VS Code dan paket unfree lainnya bisa jalan
        config = {
          allowUnfree = true;
          # Jika Anda butuh paket tertentu dari NUR yang butuh izin khusus:
          allowUnfreePredicate = (_: true); 
        };
        overlays = [ nur.overlays.default ]; 
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
    nixosConfigurations.hype7x8 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs pkgs-unstable; };
      modules = [
        ./configuration.nix
        {
          nixpkgs.pkgs = pkgs; # Menugaskan variabel pkgs kita ke sistem
        }
 
        # Integrasi Home Manager sebagai Modul
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Ganti 'username' dengan nama user Anda
          home-manager.users.diecko = import ./home.nix;
          home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable; };
        }
      ];
    };
  };
}
