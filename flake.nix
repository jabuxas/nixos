{
  description = "and yet, we seek it, insatiably. such is our fate.";

  inputs = {
    nixpkgs.url =         "github:nixos/nixpkgs?ref=nixos-unstable";
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

  outputs = { self, nixpkgs, sops-nix, copyparty, ... }: {
    nixosConfigurations.frigid = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit copyparty; };
      modules = [
        sops-nix.nixosModules.sops
        ./hosts/frigid
      ];
    };
    nixosConfigurations.threnwick = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit copyparty; };
      modules = [
        sops-nix.nixosModules.sops
        ./hosts/threnwick
      ];
    };
  };

}
