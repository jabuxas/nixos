{ lib, pkgs, ... }: {
  
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/fbfcd453-924f-4086-99cd-63dcfa21b3a2";
    fsType = "xfs";
    options = [ "noatime" ];
  };

  fileSystems."/netindev" = {
   device = "/dev/disk/by-uuid/0bd928fa-14f8-4862-90a0-79494889038c";
   fsType = "ext4";
   options = [ "defaults" ];
  };

  fileSystems."/seagate" = {
   device = "/dev/disk/by-uuid/f59ffc60-fcea-4582-9a8b-b5b9cd027754";
   fsType = "ext4";
   options = [ "defaults" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/06F7-85E1";
    fsType = "vfat";
    options = [ "noatime" "fmask=0077" "dmask=0077" ];
  };

  zramSwap.enable = true;

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/6317fe98-bfe7-4127-a1cf-40ef96c65877";
    }
  ];

}
