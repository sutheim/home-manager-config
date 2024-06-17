{ lib, pkgs, ... }:
let
in {
  home = {
    packages = with pkgs; [
      zig
    ];

    sessionVariables = {
      CC = "${pkgs.zig}/bin/zig cc";
      CXX = "${pkgs.zig}/bin/zig c++";
      RUSTFLAGS = "-C linker=${pkgs.zig}/bin/zig";
      CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER = "${pkgs.zig}/bin/zig";
    };
  };
}
