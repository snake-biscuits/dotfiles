{ config, pkgs, ... }: {
  # paths home-manager should manage
  home.username = "bikkie";
  home.homeDirectory = "/home/bikkie";

  # track version to avoid breaking changes
  home.stateVersion = "25.11";  # DO NOT CHANGE!

  # use nixGL
  targets.genericLinux.nixGL.packages = import <nixgl> { inherit pkgs; };

  # nix packages installed by home-manager
  home.packages = [
    # wrap graphical programs with nixGL
    (config.lib.nixGL.wrap pkgs.vesktop)
  ];

  # manage dotfiles here (symlinked via Nix store)
  home.file = {
  };

  # environment variables
  # NOTE: disabled by sourcing `hm-session-vars.sh` in `.profile`
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
