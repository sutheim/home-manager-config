{ lib, pkgs, ... }:
  let
    username = "sondre";
  in {
    imports = [
	    ./nvim-config.nix
    ];

    home = {
      packages = with pkgs; [
        zig
        rustup
        unzip
        nodejs
        just
        dotnet-sdk_8
        nushell
        gitui
        (nerdfonts.override { fonts = [ "Cousine" ]; })
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

    programs = {
      alacritty.enable = true;
      home-manager.enable = true;
    };

    fonts.fontconfig.enable = true;
}
