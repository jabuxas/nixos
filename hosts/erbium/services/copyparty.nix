{ pkgs, lib, copyparty, config, ... }: {

  imports = [
    copyparty.nixosModules.default
  ];

  nixpkgs.overlays = [
    copyparty.overlays.default
  ];

  environment.systemPackages = [ pkgs.copyparty ];

  services.copyparty = {
    enable = true;
    user = "you";
    group = "users";
    settings = {
      i = "0.0.0.0";
      "xff-hdr" = "X-Forwarded-For";
      "xff-src" = "172.24.0.0/16";
      rproxy = 1;
    };
    accounts = {
      lucas.passwordFile = config.sops.secrets."copyparty_main_password".path;
      friend.passwordFile = config.sops.secrets."copyparty_friend_password".path;
    };

    volumes = {
      "/private" = {
        path = "/netindev/private";
        access = {
          A = [ "lucas" ];
        };
        flags = {
          e2dsa = true;
          scan = 60;
          hardlink = true;
          chmod_f = "664";
          chmod_d = "775";
          dvthumb = false;
          nsort = true;
          nodirsz = true;
        };
      };
      "/" = {
        path = "/netindev/misc";
        access = {
          r = "*";
          rwd = [ "friend" ];
          A = [ "lucas" ];
        };
        flags = {
          e2dsa = true;
          scan = 60;
          hardlink = true;
          chmod_f = "664";
          chmod_d = "775";
          dvthumb = false;
          nsort = true;
          nodirsz = true;
        };
      };
    };
  };

}
