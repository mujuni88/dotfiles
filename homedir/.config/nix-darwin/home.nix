{
  user,
  config,
  pkgs,
  ...
}: let
  dotFilesDir = "${config.home.homeDirectory}/.dotfiles/homedir";
in {
  home = {
    username = user;
    homeDirectory = "/Users/" + user;
    stateVersion = "24.05";

    packages = [];

    file = {
      ".config".source = "${dotFilesDir}/.config";
      ".git-commit-template.txt".source = "${dotFilesDir}/.git-commit-template.txt";
      ".gitconfig".source = "${dotFilesDir}/.gitconfig";
      ".gitignore".source = "${dotFilesDir}/.gitignore";
      ".p10k.zsh".source = "${dotFilesDir}/.p10k.zsh";
      ".profile".source = "${dotFilesDir}/.profile";
      ".tmux.conf".source = "${dotFilesDir}/.tmux.conf";
      ".tmux.conf.local".source = "${dotFilesDir}/.tmux.conf.local";
      ".vim".source = "${dotFilesDir}/.vim";
      ".vimrc".source = "${dotFilesDir}/.vimrc";
      ".wezterm.lua".source = "${dotFilesDir}/.config/wezterm/wezterm.lua";
      ".zlogout".source = "${dotFilesDir}/.zlogout";
      ".zprofile".source = "${dotFilesDir}/.zprofile";
      ".zshenv".source = "${dotFilesDir}/.zshenv";
      ".zshrc".source = "${dotFilesDir}/.zshrc";
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
