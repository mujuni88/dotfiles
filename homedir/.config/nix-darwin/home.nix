{
  user,
  config,
  pkgs,
  ...
}: {
  home = {
    username = user;

    homeDirectory = "/Users/" + user;

    stateVersion = "24.05";

    packages = [
    ];

    file = {
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
      config.them = "tokyonight_night";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
    };
    git = {
      enable = true;
    };
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
    wezterm = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
