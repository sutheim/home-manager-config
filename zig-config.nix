{ config, pkgs, ... }:
let
  zigccPath = "/zig/zigcc";
  zigccPathAbsolute = "${config.home.homeDirectory}${zigccPath}";

  zigcxxPath = "/zig/zigcxx";
  zigcxxPathAbsolute = "${config.home.homeDirectory}${zigcxxPath}";
in {
  home = {
    packages = with pkgs; [
      zig
    ];

    file."${zigccPath}" = {
      executable = true;
      text = ''
        #!/bin/sh
        ${pkgs.zig}/bin/zig cc $@
      '';
    };

    file."${zigcxxPath}" = {
      executable = true;
      text = ''
        #!/bin/sh
        ${pkgs.zig}/bin/zig c++ $@
      '';
    };

    sessionVariables = {
      CC = "${zigccPathAbsolute}";
      CXX = "${zigcxxPathAbsolute}";
      RUSTFLAGS = "-C linker=${zigccPath}";
    };
  };

  programs = {
    bash.enable = true;
  };
}
