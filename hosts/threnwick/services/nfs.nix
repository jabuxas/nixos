{ ... }:{

  services.nfs.server = {
    enable = true;
    # NFSv3 compat
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = '''';
  };

  fileSystems."/export/torrent" = {
    device = "/netindev/downloads";
    options = [ "bind" ];
  };

  fileSystems."/export/misc" = {
    device = "/netindev/misc";
    options = [ "bind" ];
  };

  services.nfs.server.exports = ''
    /export         10.10.10.0/24(rw,fsid=0,no_subtree_check) 100.68.68.0/24(rw,fsid=0,no_subtree_check)
    /export/misc    10.10.10.0/24(rw,nohide,insecure,no_subtree_check) 100.68.68.0/24(rw,nohide,insecure,no_subtree_check)
    /export/torrent 10.10.10.0/24(rw,nohide,insecure,no_subtree_check) 100.68.68.0/24(rw,nohide,insecure,no_subtree_check)
  '';

}
