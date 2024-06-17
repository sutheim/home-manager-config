{ lib, config, pkgs, ... }:
let
  nvimConfigDir = "${config.home.homeDirectory}/.config/nvim";
  nvimConfigUrl = "https://github.com/sutheim/nvim_astronvim4_config.git";
in {
  programs = {
    git.enable = true;
    neovim.enable = true;
  };

  home = {
    packages = with pkgs; [
        nodejs
        dotnet-sdk_8
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    activation = {
  	  createNvimConfigDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
  		  mkdir -p ${nvimConfigDir}
  	  '';

      cloneNvimConfig = lib.hm.dag.entryAfter ["createNvimConfigDir"] ''
        if [ ! -d ${nvimConfigDir}/.git ]; then
          ${pkgs.git}/bin/git clone ${nvimConfigUrl} ${nvimConfigDir};
        else
          ${pkgs.git}/bin/git -C ${nvimConfigDir} pull;
      fi
        '';
    };
  };
}
