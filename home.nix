{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      neovim
      git
      zig
      rustup
      7zip
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
