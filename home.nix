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
      nodejs_22
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
