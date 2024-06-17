{ lib, config, pkgs, ... }:
let
  nvimConfigDir = "${config.home.homeDirectory}/.config/nvim";

  nvimConfigUrl = "https://github.com/sutheim/nvim_astronvim4_config.git";

  git = pkgs.git;
in {
  programs = {
    git.enable = true;
    neovim.enable = true;
  };

  home = {
  	activation.createNvimConfigDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
  		mkdir -p ${nvimConfigDir}
  	'';
  
       activation.cloneNvimConfig = lib.hm.dag.entryAfter ["createNvimConfigDir"] ''
         if [ ! -d ${nvimConfigDir}/.git ]; then
           ${git}/bin/git clone ${nvimConfigUrl} ${nvimConfigDir};
         else
           ${git}/bin/git -C ${nvimConfigDir} pull;
         fi
       '';
  };
}
