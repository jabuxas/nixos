{ ... }:{

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      LogLevel = "ERROR";
    };
  };

  services.tailscale = {
    enable = false;
    authKeyFile = "/data/tailscale/keyfile";
    useRoutingFeatures = "server";
    openFirewall = true;
    extraUpFlags = [ "--advertise-exit-node" "--advertise-routes=10.10.10.0/24" ];
  };

  services.nfs.server = {
    enable = false;
    # NFSv3 compat
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';
  };

  # services.nfs.server.exports = ''
  #   /export         10.10.10.0/24(rw,fsid=0,no_subtree_check) 100.68.68.0/24(rw,fsid=0,no_subtree_check)
  #   /export/random  10.10.10.0/24(rw,nohide,insecure,no_subtree_check) 100.68.68.0/24(rw,nohide,insecure,no_subtree_check)
  #   /export/torrent 10.10.10.0/24(rw,nohide,insecure,no_subtree_check) 100.68.68.0/24(rw,nohide,insecure,no_subtree_check)
  # '';


  users.users.you.openssh.authorizedKeys.keys = [ 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5bF5Y8R/JujlOtA9zbb68bl57zlnYKhzZBlCVUXX6H"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINf4NO9mercmjLE+VOX8Fu+cpmXbrF4fLVx2785Pw9hR"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPX8NW3etsAxzJufotwJRZ0nK0qnRL1NjJT2Yp8LfVZK"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/ZJ51rcwsRD/tMRvGM4/5iqbFk9ORld2qZ8QxDBod+"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIQSBaFawMZwG6y+NDxBHY9cv2QqekNZIeOqw0eC4WHH cardno:16_730_169"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEEnhRLYZImR0dPjqMn/HdkUIv+ErxHIq+fM01w3VQELAAAABHNzaDo= ssh:"
 ];

}
