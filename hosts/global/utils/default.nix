{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dash
    fish
    neovim
    tree
    eza
    bat
    btop   
    fd
    ripgrep
    gcc
    lazygit
    lazydocker
    dysk
  ];

  programs.fish.enable = true;
  
}
