{ ... }:{

  networking = {
    useDHCP = false;

    networkmanager.enable = true;

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

      # copyparty
      3923

      # web
      3000
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
    
}
