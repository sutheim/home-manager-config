{ config, pkgs, ... }:
let
  nvimConfigRepo = "https://github.com/sutheim/nvim_astronvim4_config.git";
  #nvimConfigDir = "${config.home.homeDirectory}/.config/nvim";
in {
  home.packages = with pkgs; [
    neovim
  ];

  #home.file.".config/nvim".source = pkgs.runCommand "clone-nvim-config" {} ''
    #git clone ${nvimConfigRepo} ${nvimConfigDir}
    #echo $out > /dev/null
  #'';

  # home.file.".config/nvim".target = nvimConfigDir;
}
