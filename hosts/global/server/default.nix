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
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIQSBaFawMZwG6y+NDxBHY9cv2QqekNZIeOqw0eC4WHH cardno:16_730_169"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEEnhRLYZImR0dPjqMn/HdkUIv+ErxHIq+fM01w3VQELAAAABHNzaDo= ssh:"
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMbG0GviGiPHqJiizGP611E0ZrVspJ6+l5kvRyHlmxzLAAAABHNzaDo= ssh:"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSIpSQBTRAlVBHPbUntdk1WrdDkURrkSd3T6wlsuT0k7LE1KIibSvu/L157jkUF75ghUlNjlaHTYZGFe5cvOqQ="
  ];

  systemd.user.tmpfiles.rules = [
  "d %t/gnupg 0700 - - -"
  ];

}

