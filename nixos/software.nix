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
  ];
}

