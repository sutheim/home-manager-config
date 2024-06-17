{ lib, pkgs, ... }:
let
  rustVersion = "1.79";
in {
  home.packages = with pkgs; [
    rustup
  ];

  home.activation.installRustToolchain = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rustup}/bin/rustup install ${rustVersion}
    ${pkgs.rustup}/bin/rustup default ${rustVersion}
  '';
}
