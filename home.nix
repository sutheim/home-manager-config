{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      neovim
      git
      zig
      rustup
      unzip
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
