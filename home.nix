{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      neovim
      git
      zig
      rustup
      unzip
      sqlite
      nodejs
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
