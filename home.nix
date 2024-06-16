{ lib, pkgs, ... }:
  let
    username = "sondre";
  in {
    imports = [
	./nvim-config.nix
    ];

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
    };

    fonts.fontconfig.enable = true;
}
