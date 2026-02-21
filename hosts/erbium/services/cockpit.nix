{ pkgs, ... }: {
  services.cockpit = {
    enable = true;
    port = 9090;
    settings = {
      WebService = {
        AllowUnencrypted = true;
        MaxStartups = 10;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    cockpit
    networkmanager
  ];

  networking.firewall.allowedTCPPorts = [ 9090 ];
}
