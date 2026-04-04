{ ... }: {

  imports = [
    # stateless
    ./dozzle.nix
    # ./dashdot.nix
    ./watchtower.nix
    ./web.nix
    ./ddns.nix
    # ./netdata.nix
    # ./cockpit.nix

    # stateful setup
    ./nginx.nix
    # ./tailscale.nix

    # stateful setup + data
    ./abyss.nix
    # ./qbittorrent.nix
    ./immich.nix
    # ./kavita.nix
    ./syncthing.nix
    ./copyparty.nix
  ];

}
