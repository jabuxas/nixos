{ pkgs, ... }:{

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      LogLevel = "ERROR";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "you" ];
      AcceptEnv = ["LANG" "LC_*" "COLORTERM"];
    };

    extraConfig = "StreamLocalBindUnlink yes";
  };

  users.users.you.openssh.authorizedKeys.keys = [ 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5bF5Y8R/JujlOtA9zbb68bl57zlnYKhzZBlCVUXX6H"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINf4NO9mercmjLE+VOX8Fu+cpmXbrF4fLVx2785Pw9hR"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPX8NW3etsAxzJufotwJRZ0nK0qnRL1NjJT2Yp8LfVZK"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/ZJ51rcwsRD/tMRvGM4/5iqbFk9ORld2qZ8QxDBod+"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIQSBaFawMZwG6y+NDxBHY9cv2QqekNZIeOqw0eC4WHH cardno:16_730_169"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEEnhRLYZImR0dPjqMn/HdkUIv+ErxHIq+fM01w3VQELAAAABHNzaDo= ssh:"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLXTPD4WAjiRYUDym0FArTKAYDpVq/qp23WEkCV6oDtUsFPH9c9ylW0yfYamg+RjYXLZku68OlEtU4D2FSYjsP4="
  ];

  systemd.user.services.gpg-agent-socketdir = {
    description = "create GPG agent socket directory";
    wantedBy = [ "default.target" ];
    before = [ "sockets.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.gnupg}/bin/gpgconf --create-socketdir";
      RemainAfterExit = true;
    };
  };

}
