{ ... }:{

  services.tailscale = {
    enable = true;
    authKeyFile = "/home/you/ts_keyfile";
    useRoutingFeatures = "server";
    openFirewall = true;
    extraUpFlags = [ "--advertise-exit-node" "--advertise-routes=10.10.10.0/24" ];
  };

}
