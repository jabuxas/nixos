{ ... }:{

  imports = [
    ../../hosts/global

    # Optional global features used by this host (server setup, shell utilities, virtualisation)
    ../../hosts/global/server
    ../../hosts/global/utils
    ../../hosts/global/virtual
    ../../hosts/global/secrets

    # Host-specific (hardware, boot, networking, docker services)
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./services
  ];

  networking.hostName = "threnwick";
  time.timeZone = "America/Sao_Paulo";
  system.stateVersion = "25.05";
}
