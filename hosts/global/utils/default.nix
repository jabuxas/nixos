{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dash
    fish
    tree
    eza
    btop
    fd
    ripgrep
    gcc
    lazygit
    chezmoi
    age
  ];

  programs.fish.enable = true;
}
