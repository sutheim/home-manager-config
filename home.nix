{ lib, pkgs, ... }:
  let
    username = "sondre";
  in {
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

      inherit username;
      homeDirectory = "/home/${username}";

      stateVersion = "23.11";
    };
}
