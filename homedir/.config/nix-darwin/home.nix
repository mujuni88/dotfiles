{
  user,
  config,
  pkgs,
  ...
}: let
  dotFilesDir = "./.dotfiles";
  dotHomeDir = "${dotFilesDir}/homedir";
  getHomeDirFile = fileName: "${dotHomeDir}/${fileName}";
in {
  home = {
    username = user;

    homeDirectory = "/Users/" + user;

    stateVersion = "24.05";

    packages = [
    ];

    file = {
      ".zshrc".source = getHomeDirFile ".zshrc";
    };

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    eza = {
      enable = true;
    };
    git = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    wezterm = {
      enable = true;
    };
  };
}
