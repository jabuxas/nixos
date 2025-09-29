{ lib, pkgs, ... }: {

  boot = {
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 16;
      editor = false;
    };

    loader.efi.canTouchEfiVariables = true;

    initrd = {
      systemd.enable = true;
      availableKernelModules = [
          "xfs"
          "usbhid"
          "usb_storage"
          "xhci_hcd"
          "uas"
      ];
    };

    kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    kernelParams = lib.mkAfter [
      "rootwait"
      "usbcore.autosuspend=-1"
      "mitigations=off"
    ];
  };
}
