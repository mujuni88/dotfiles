{pkgs}:
with pkgs; [
  # Terminal and Shell Tools
  tmux
  starship
  zoxide
  fzf
  atuin
  gnused
  bat

  # Code Editors and IDEs
  neovim

  # Version Control and Diff Tools
  delta

  # Development Tools
  docker
  cargo
  rustc
  ngrok
  deno
  go
  tree
  fnm

  # Utility Applications
  unar

  # Code formatter for Nix
  alejandra
]
