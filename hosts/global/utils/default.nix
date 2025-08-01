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
  ];

  programs.fish.enable = true;
  
}
