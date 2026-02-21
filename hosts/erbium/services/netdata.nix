{ pkgs, ... }: {
  services.netdata = {
    enable = true;
    config = {
      global = {
        "memory mode" = "dbengine";
        "history" = "24h";
      };
      web = {
        "allow connections from" = "localhost 192.168.1.* 172.24.0.*";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 19999 ];
}
