build:
  home-manager switch --flake .#sondre

clean:
  nix-collect-garbage -d
