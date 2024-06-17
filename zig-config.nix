{ lib, pkgs, ... }:
let
in {
  home.packages = with pkgs; [
    zig
  ];

  home.sessionVariables = {
    CC = "${pkgs.zig}/bin/zig cc";
    CXX = "${pkgs.zig}/bin/zig c++";
  };
}
