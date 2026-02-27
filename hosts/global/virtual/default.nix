{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    docker-compose
    compose2nix
  ];

  virtualisation.docker = {
    enable        = true;
    enableOnBoot  = true;
    liveRestore   = true;
    logDriver     = "journald";
    storageDriver = "overlay2";

    autoPrune = {
        enable     = true;
        dates      = "weekly";
        flags      = [ "--all" ];
        persistent = true;
    };
  };

  users.users.you.extraGroups = [ "docker" ];
}
