{ config, pkgs, ... }:

{
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    
    defaultSopsFile = ../../secrets.yaml;
    
    secrets = {
      "abyss_environment" = {};
      
      "homarr_environment" = {};
    };
  };
}
