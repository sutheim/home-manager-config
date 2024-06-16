{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      neovim
      git
      zig
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
