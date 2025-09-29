{ ... }: {

  imports = [
    ./dozzle.nix
    ./abyss.nix
    ./dashdot.nix
    ./watchtower.nix
    ./tailscale.nix

    # ../../hosts/global/oci-containers/homarr.nix
    # ../../hosts/global/oci-containers/nginx.nix
    # ../../hosts/global/oci-containers/openbooks.nix
    # ../../hosts/global/oci-containers/refinement.nix

    # ../../hosts/global/oci-containers/qbittorrent.nix
    # ../../hosts/global/oci-containers/immich.nix
    # ../../hosts/global/oci-containers/kavita.nix
    # ../../hosts/global/oci-containers/syncthing.nix
    # ../../hosts/global/oci-containers/calibre.nix
  ];

}
