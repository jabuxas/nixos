{ lib, pkgs, ... }: {
  
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5148bd2a-cdfc-4ace-acb3-1cb0519c7ee1";
    fsType = "xfs";
    options = [ "noatime" ];
  };

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/0bd928fa-14f8-4862-90a0-79494889038c";
    fsType = "ext4";
    options = [ "defaults" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4CF3-0761";
    fsType = "vfat";
    options = [ "noatime" "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/738598d3-dc3a-41f9-9746-a08c9e80a80b";
    }
  ];
    
}
