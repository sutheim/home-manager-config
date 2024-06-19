{ ... }:
let
  alacrittyConfigPath = ".config/alacritty/alacritty.toml";
  alacrittyConfigUrl = "https://gist.githubusercontent.com/sutheim/487d38c70da64fdcf2fd593821f85780/raw/89ce7b27dff4896d538ccecd6f6010dcbc5e2ee4/alacritty.toml";
in {
  home = {
    file."${alacrittyConfigPath}".text = builtins.readFile(builtins.fetchurl {
      url = "${alacrittyConfigUrl}";
      sha256 = "0sm21h19ayw9fp42p9rvl2s296x7ynbnk79qi46rh1d04xbdkdmf";
    });
  };

  programs.alacritty.enable = true;
}
