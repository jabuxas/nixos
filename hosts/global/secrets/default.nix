{ config, pkgs, ... }:

{
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    
    secrets = {
      "abyss_environment" = {
        sopsFile = ../secrets/abyss.env;
        format = "dotenv";
        owner = "root";
        group = "root";
        mode = "0400";
      };
      
      "homarr_environment" = {
        sopsFile = ../secrets/homarr.env;
        format = "dotenv";
        owner = "root";
        group = "root";
        mode = "0400";
      };
    };
  };
}
