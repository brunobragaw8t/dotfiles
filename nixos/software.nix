{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    tmux = {
      enable = true;
    };
  };

  services = {
    flatpak = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    discord
    code-cursor
    alacritty
    xclip
    lazygit
    bun
    nodejs_20
    ngrok
    fzf
    zed-editor
  ];
}
