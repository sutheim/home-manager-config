{ lib, pkgs ... };
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "sondre";
    homeDirectory = "/home/sondre";

    stateVersion = "23.11";
  };
}
