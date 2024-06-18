{ config, pkgs, ... }:
let
  zigccPath = "${config.home.homeDirectory}/zig/zigcc";
in {
  home = {
    packages = with pkgs; [
      zig
    ];

    file."zig/zigcc" = {
      executable = true;
      text = ''
        #!/bin/sh
        ${pkgs.zig}/bin/zig cc $@
      '';
    };

    sessionVariables = {
      CC = "${zigccPath}";
      CXX = "${pkgs.zig}/bin/zig c++ $@";
      RUSTFLAGS = "-C linker=${zigccPath}";
      CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER = "${zigccPath}";
    };
  };

  programs = {
    bash.enable = true;
  };
}
