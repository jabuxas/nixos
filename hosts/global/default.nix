{ config, lib, pkgs,  ... }:{

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      download-buffer-size = 134217728;

      extra-substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      
      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [ "root" "@wheel" ];
    };

    gc = {
      automatic = true;      
      options = "--delete-older-than 30d";
      dates = "weekly";
    };
  };
    
  environment.systemPackages = with pkgs; [
    curl
    wget
    neovim
    tmux
    git
    fastfetch
   ];

  environment.variables.EDITOR = "nvim";

  virtualisation.docker.enable = true;
  
  services = {
    timesyncd = {
      enable = true;
      servers = [
        "0.pool.ntp.org"
        "1.pool.ntp.org"
        "2.pool.ntp.org"
        "3.pool.ntp.org"
      ];

      fallbackServers = [
        "time.google.com"
        "time.cloudflare.com"
        "time.aws.com"      
      ];
    };
    
    getty.autologinUser = "you";
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };  

  users.users = {
    you = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };  

}
