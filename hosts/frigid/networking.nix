{ ... }:{

  networking = {
    useDHCP = true;

    firewall.allowedTCPPorts = [ 
      22
      8080

      # nginx proxy manager
      80
      81
      443

      # NFSv4
      2049

      # NFSv3 ports
      111
      4000
      4001
      4002
      20048
    ];

    firewall.allowedUDPPorts = [ 
      # NFSv4
      2049

      # NFSv3 ports
      111
      4000
      4001
      4002
      20048
    ];
  };

  services.nfs.server = {
    enable = true;
    # NFSv3 compat
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';
  };
  services.nfs.server.exports = ''
    /export         10.10.10.0/24(rw,fsid=0,no_subtree_check)
    /export/random  10.10.10.0/24(rw,nohide,insecure,no_subtree_check)
    /export/torrent 10.10.10.0/24(rw,nohide,insecure,no_subtree_check)
  '';
    
}
