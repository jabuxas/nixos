{ ... }: {

  imports = [

    # non data dependant
    ./dozzle.nix
    ./dashdot.nix
    ./watchtower.nix
    ./refinement.nix

    # setup dependant
    ./nginx.nix
    ./tailscale.nix
    ./homarr.nix

    # data dependant
    ./abyss.nix
    ./qbittorrent.nix
    ./immich.nix
    ./kavita.nix
    ./syncthing.nix
    ./copyparty.nix

    # ../../hosts/global/oci-containers/openbooks.nix
    # ../../hosts/global/oci-containers/calibre.nix
  ];

}
