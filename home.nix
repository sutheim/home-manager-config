{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      neovim
      git
      zig
    ];

    nix = {
      package = pkgs.nix;
      settings.experimental-features = [ "nix-command" "flakes" ];
    };

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
