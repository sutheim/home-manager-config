{ lib, pkgs, ... }:
  let
    username = "sondre";
  in {
    imports = [
	    ./nvim-config.nix
	    ./rust-config.nix
	    ./zig-config.nix
    ];

    home = {
      packages = with pkgs; [
        unzip
        just
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
