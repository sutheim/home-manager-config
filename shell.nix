{ lib, config, pkgs, ... }:
let
  starshipConfigPath = ".config/starship.toml";
  starshipConfigUrl = "https://gist.githubusercontent.com/sutheim/f152d9fdd3ffd2b7ddb6efe64a1bb968/raw/aa36a380f7e3140f3a45e73821c4eaee1c8ca3ad/starship.toml";

  nushellConfigUrl = "git@github.com:sutheim/nushell-config.git";
  nushellConfigDir = "${config.home.homeDirectory}/.config/nushell";

  # nushellConfig = builtins.fetchGit {
  #   url = "${nushellConfigUrl}";
  #   rev = "bf5f56adfd0a7a171bbeee80a672de3c68d00b3b";
  # };
in {
  home = {
    packages = with pkgs; [
      nushell
      starship
      fzf
      starship
      zoxide
      openssh
    ];

    # file."${nushellConfigDir}".source = nushellConfig;

    activation = {
      startSSHAgent = lib.hm.dag.entryAfter ["writeBoundary"] ''
        eval $(${pkgs.openssh}/bin/ssh-agent -s)
        ${pkgs.openssh}/bin/ssh-add ~/.ssh/id_ed25519

        export GIT_SSH_COMMAND="${pkgs.openssh}/bin/ssh"
      '';

      createNuShellConfigDir = lib.hm.dag.entryAfter ["startSSHAgent"] ''
        mkdir -p ${nushellConfigDir};
      '';

      cloneNushellConfig = lib.hm.dag.entryAfter ["createNuShellConfigDir"] ''
        if [ ! -d ${nushellConfigDir}/.git ]; then
          ${pkgs.git}/bin/git clone ${nushellConfigUrl} ${nushellConfigDir};
        else
          ${pkgs.git}/bin/git -C ${nushellConfigDir} pull;
        fi
      '';
    };

    file.".config/paths.nu".text = '''';

    file."${starshipConfigPath}".text = builtins.readFile(builtins.fetchurl {
      url = "${starshipConfigUrl}";
      sha256 = "0kcbp8nfr67hqdaml406cx7pzfryd3m2v5ia9pcpagyxlgpfqfxn";
    });

    # activation.installRustToolchain = lib.hm.dag.entryAfter ["writeBoundary"] ''
    #   ${pkgs.rustup}/bin/rustup default ${rustVersion}
    # '';
  };
}
