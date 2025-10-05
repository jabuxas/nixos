{...}: {
  services.cron.enable = true;
  services.cron.systemCronJobs = ["@reboot root ${pkgs.ethtool}/sbin/ethtool -s enp2s0 wol g"];
}
