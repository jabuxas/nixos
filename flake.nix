{
  description = "but a craven";

  inputs = {
    nixpkgs.url =         "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url =         "github:chaotic-cx/nyx/nyxpkgs-unstable";

    compose2nix = {
      url = "github:aksiksi/compose2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, ... }: {
    nixosConfigurations.frigid = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        ./hosts/frigid
      ];
    };
  };

}
