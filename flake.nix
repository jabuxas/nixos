{
  description = "but a craven";

  inputs = {
    nixpkgs.url =         "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url =         "github:chaotic-cx/nyx/nyxpkgs-unstable";
    copyparty.url =       "github:9001/copyparty";

    compose2nix = {
      url = "github:aksiksi/compose2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, sops-nix, copyparty, ... }: {
    nixosConfigurations.frigid = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit copyparty; };
      modules = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        sops-nix.nixosModules.sops
        ./hosts/frigid
      ];
    };
    nixosConfigurations.erbium = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit copyparty; };
      modules = [
        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
        sops-nix.nixosModules.sops
        ./hosts/erbium
      ];
    };
  };

}
