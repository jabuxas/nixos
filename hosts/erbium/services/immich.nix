# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  virtualisation.oci-containers.backend = "docker";

  # Containers
  virtualisation.oci-containers.containers."immich_machine_learning" = {
    image = "ghcr.io/immich-app/immich-machine-learning:release";
    environment = {
      "DB_DATABASE_NAME" = "immich";
      "DB_DATA_LOCATION" = "./postgres";
      "DB_PASSWORD" = "postgres";
      "DB_USERNAME" = "postgres";
      "IMMICH_VERSION" = "release";
      "UPLOAD_LOCATION" = "./library";
    };
    volumes = [
      "immich_model-cache:/cache:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-machine-learning"
      "--network=immich_default"
    ];
  };
  systemd.services."docker-immich_machine_learning" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
      RestartMaxDelaySec = lib.mkOverride 90 "1m";
      RestartSec = lib.mkOverride 90 "100ms";
      RestartSteps = lib.mkOverride 90 9;
    };
    after = [
      "docker-network-immich_default.service"
      "docker-volume-immich_model-cache.service"
    ];
    requires = [
      "docker-network-immich_default.service"
      "docker-volume-immich_model-cache.service"
    ];
    partOf = [
      "docker-compose-immich-root.target"
    ];
    wantedBy = [
      "docker-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_postgres" = {
    image = "docker.io/tensorchord/pgvecto-rs:pg14-v0.2.0@sha256:739cdd626151ff1f796dc95a6591b55a714f341c737e27f045019ceabf8e8c52";
    environment = {
      "POSTGRES_DB" = "immich";
      "POSTGRES_INITDB_ARGS" = "--data-checksums";
      "POSTGRES_PASSWORD" = "postgres";
      "POSTGRES_USER" = "postgres";
    };
    volumes = [
      "/home/you/services/immich/postgres:/var/lib/postgresql/data:rw"
    ];
    cmd = [ "postgres" "-c" "shared_preload_libraries=vectors.so" "-c" "search_path=\"$user\", public, vectors" "-c" "logging_collector=on" "-c" "max_wal_size=2GB" "-c" "shared_buffers=512MB" "-c" "wal_compression=on" ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=pg_isready --dbname=\"\${POSTGRES_DB}\" --username=\"\${POSTGRES_USER}\" || exit 1; Chksum=\"$(psql --dbname=\"\${POSTGRES_DB}\" --username=\"\${POSTGRES_USER}\" --tuples-only --no-align --command='SELECT COALESCE(SUM(checksum_failures), 0) FROM pg_stat_database')\"; echo \"checksum failure count is $Chksum\"; [ \"$Chksum\" = '0' ] || exit 1"
      "--health-interval=5m0s"
      "--health-start-interval=30s"
      "--health-start-period=5m0s"
      "--network-alias=database"
      "--network=immich_default"
    ];
  };
  systemd.services."docker-immich_postgres" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
      RestartMaxDelaySec = lib.mkOverride 90 "1m";
      RestartSec = lib.mkOverride 90 "100ms";
      RestartSteps = lib.mkOverride 90 9;
    };
    after = [
      "docker-network-immich_default.service"
    ];
    requires = [
      "docker-network-immich_default.service"
    ];
    partOf = [
      "docker-compose-immich-root.target"
    ];
    wantedBy = [
      "docker-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_redis" = {
    image = "docker.io/valkey/valkey:8-bookworm@sha256:42cba146593a5ea9a622002c1b7cba5da7be248650cbb64ecb9c6c33d29794b1";
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=redis-cli ping || exit 1"
      "--network-alias=redis"
      "--network=immich_default"
    ];
  };
  systemd.services."docker-immich_redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
      RestartMaxDelaySec = lib.mkOverride 90 "1m";
      RestartSec = lib.mkOverride 90 "100ms";
      RestartSteps = lib.mkOverride 90 9;
    };
    after = [
      "docker-network-immich_default.service"
    ];
    requires = [
      "docker-network-immich_default.service"
    ];
    partOf = [
      "docker-compose-immich-root.target"
    ];
    wantedBy = [
      "docker-compose-immich-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_server" = {
    image = "ghcr.io/immich-app/immich-server:release";
    environment = {
      "DB_DATABASE_NAME" = "immich";
      "DB_DATA_LOCATION" = "./postgres";
      "DB_PASSWORD" = "postgres";
      "DB_USERNAME" = "postgres";
      "IMMICH_VERSION" = "release";
      "UPLOAD_LOCATION" = "./library";
    };
    volumes = [
      "/home/you/services/immich/library:/usr/src/app/upload:rw"
      "/etc/localtime:/etc/localtime:ro"
    ];
    ports = [
      "2283:2283/tcp"
    ];
    dependsOn = [
      "immich_postgres"
      "immich_redis"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-server"
      "--network=immich_default"
    ];
  };
  systemd.services."docker-immich_server" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
      RestartMaxDelaySec = lib.mkOverride 90 "1m";
      RestartSec = lib.mkOverride 90 "100ms";
      RestartSteps = lib.mkOverride 90 9;
    };
    after = [
      "docker-network-immich_default.service"
    ];
    requires = [
      "docker-network-immich_default.service"
    ];
    partOf = [
      "docker-compose-immich-root.target"
    ];
    wantedBy = [
      "docker-compose-immich-root.target"
    ];
  };

  # Networks
  systemd.services."docker-network-immich_default" = {
    path = [ pkgs.docker ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "docker network rm -f immich_default";
    };
    script = ''
      docker network inspect immich_default || docker network create immich_default
    '';
    partOf = [ "docker-compose-immich-root.target" ];
    wantedBy = [ "docker-compose-immich-root.target" ];
  };

  # Volumes
  systemd.services."docker-volume-immich_model-cache" = {
    path = [ pkgs.docker ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      docker volume inspect immich_model-cache || docker volume create immich_model-cache
    '';
    partOf = [ "docker-compose-immich-root.target" ];
    wantedBy = [ "docker-compose-immich-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."docker-compose-immich-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
