{ config, lib, pkgs,  ... }:{

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      download-buffer-size = 134217728;

      extra-substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://chaotic-nyx.cachix.org"
      ];
      
      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
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
    wget
    vim
    tmux
    git
    fastfetch
   ];

  environment.variables.EDITOR = "vim";

  system.activationScripts.vimrc.text = ''
  mkdir -p /home/you/.config/vim
  echo "set expandtab" > /home/you/.config/vim/vimrc
  echo "set shiftwidth=2" >> /home/you/.config/vim/vimrc
  echo "set softtabstop=2" >> /home/you/.config/vim/vimrc
  chown you:users /home/you/.config/vim/vimrc

  mkdir -p /root/.config/vim
  echo "set expandtab" > /root/.config/vim/vimrc
  echo "set shiftwidth=2" >> /root/.config/vim/vimrc
  echo "set softtabstop=2" >> /root/.config/vim/vimrc
  chown root:root /root/.config/vim/vimrc
  '';

  virtualisation.docker.enable = true;
  
  services = {
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos_git;
    };

    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    
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
