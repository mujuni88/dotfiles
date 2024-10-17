{
  description = "Buza Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    home-manager,
  }: let
    # Define variables for reuse
    user = "jbuza";
    myMac = "Joes-MacBook-Pro";

    configuration = {
      pkgs,
      config,
      ...
    }: let
      # Import system packages and homebrew configurations
      packages = import ./packages.nix {inherit pkgs;};
      systemConfig = import ./system.nix {inherit self;};
      homebrewConfig = import ./homebrew.nix;
    in {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = packages;

      # Homebrew configuration
      homebrew = homebrewConfig;

      # System configurations
      system = systemConfig;

      # Font packages
      fonts.packages = [
        (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
      ];

      # Auto-upgrade Nix package and daemon service
      services.nix-daemon.enable = true;
      security.pam.enableSudoTouchIdAuth = true;

      # Nix flakes settings
      nix.settings.experimental-features = "nix-command flakes";

      # Zsh as the default shell
      programs.zsh.enable = true;

      # Platform configuration for Apple Silicon
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Set user's home directory. Default is /var/empty
      users = {
        users."${user}".home = "/Users/" + user;
      };
    };
  in {
    # Use `myMac` variable to set the system configuration name
    darwinConfigurations."${myMac}" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = false; # Apple Silicon: Enable Intel prefix for Rosetta
            user = user; # Use `user` variable for Homebrew user
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users."${user}" = import ./home.nix;
          };
        }
      ];
    };

    # Expose the package set, including overlays
    darwinPackages = self.darwinConfigurations."${myMac}".pkgs;
  };
}
