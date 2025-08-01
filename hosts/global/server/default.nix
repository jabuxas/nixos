{ ... }:{

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      LogLevel = "ERROR";
    };
  };

  users.users.you.openssh.authorizedKeys.keys = [ 
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5bF5Y8R/JujlOtA9zbb68bl57zlnYKhzZBlCVUXX6H" 
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINf4NO9mercmjLE+VOX8Fu+cpmXbrF4fLVx2785Pw9hR"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPX8NW3etsAxzJufotwJRZ0nK0qnRL1NjJT2Yp8LfVZK"
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/ZJ51rcwsRD/tMRvGM4/5iqbFk9ORld2qZ8QxDBod+"
 ];
}
