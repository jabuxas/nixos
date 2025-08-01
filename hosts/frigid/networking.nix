{ ... }:{

  networking = {
    useDHCP = true;

    firewall.allowedTCPPorts = [ 
      22
      80
      81 # nginx proxy manager
      443
      8080
    ];
  };
    
}
