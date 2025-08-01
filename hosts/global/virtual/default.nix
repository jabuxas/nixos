{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    docker-compose
    compose2nix
  ];

  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
  virtualisation.docker.storageDriver = "overlay2";

  virtualisation.docker.daemon.settings = {
    data-root = "/data/docker";
  };

  users.users.you.extraGroups = [ "docker" ];

}
