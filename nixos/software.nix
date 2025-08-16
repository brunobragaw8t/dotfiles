{ config, pkgs, ... }:

let
  # This imports the Nixpkgs unstable channel.
  # The 'allowUnfree = true;' part is important
  # because some packages in the unstable channel might be non-free.
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    config = {
      allowUnfree = true;
    };
  };
in
{
  nixpkgs.overlays = [
    (self: super: {
      zed-editor = unstable.zed-editor;
    })
  ];

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
    dotnet-sdk
  ];
}
