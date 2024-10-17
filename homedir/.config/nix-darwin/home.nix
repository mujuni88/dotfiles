{
  user,
  config,
  pkgs,
  ...
}: {
  home.username = user;
  home.homeDirectory = "/Users/" + user;

  home.stateVersion = "24.05";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
