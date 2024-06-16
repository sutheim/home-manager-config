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
        nushell
        gitui
      ];


      inherit username;
      homeDirectory = "/home/${username}";

      stateVersion = "23.11";
    };
    nix = {
      package = pkgs.nix;
      extraOptions = ''
        experimental-features = nix-command flakes
      '';
    };
}
