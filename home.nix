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
      just
      dotnet-sdk_8
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
