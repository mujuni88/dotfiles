{
  description = "Buza Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          # Terminal and Shell Tools
          pkgs.wezterm               # Modern terminal emulator
          pkgs.tmux                  # Terminal multiplexer
          pkgs.starship              # Minimalist shell prompt
          pkgs.mkalias               # Alias management for shell commands
          pkgs.zoxide                # Fast directory navigation tool
          pkgs.fzf                   # Fuzzy finder for terminal
          pkgs.atuin                 # Shell history manager
          pkgs.gnused                # GNU version of sed
          pkgs.bat                   # Enhanced cat command with syntax highlighting
          pkgs.zsh-autosuggestions   # Zsh plugin for autosuggestions
          pkgs.zsh-syntax-highlighting # Zsh plugin for syntax highlighting

          # Code Editors and IDEs
          pkgs.neovim                # Modern, extensible Vim-based text editor
          pkgs.vscode                # Visual Studio Code (code editor)
          pkgs.sublime4              # Sublime Text 4, a fast text editor

          # Version Control and Diff Tools
          pkgs.delta                 # Syntax highlighting pager for git and diff

          # Web Browsers
          pkgs.arc-browser           # Arc browser (a creative web browser)
          pkgs.google-chrome         # Google Chrome browser
          pkgs.firefox               # Mozilla Firefox browser

          # Development Tools
          pkgs.docker                # Container management tool
          pkgs.cargo                 # Rust package manager
          pkgs.rustc                 # Rust compiler
          pkgs.ngrok                 # Tunnel localhost for external access
          pkgs.deno                  # Secure runtime for JavaScript and TypeScript
          pkgs.go                    # Go programming language environment
          pkgs.tree                  # Directory tree visualizer
          pkgs.fnm                   # Fast Node.js version manager

          # Communication Apps
          pkgs.slack                 # Team communication app
          pkgs.zoom-us               # Video conferencing tool
          pkgs.discord               # Voice, video, and text communication app

          # Media and Entertainment
          pkgs.spotify               # Music streaming service
          pkgs.iina                  # Modern media player for macOS

          # Utility Applications
          pkgs.unar                  # Extractor for archives
          pkgs.appcleaner            # Application uninstaller
          pkgs.raycast               # Productivity launcher for macOS
        ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "amazon-q"
          "dashlane"
          "nordvpn"
          "notion"
          "ChatGPT"
          "ledger-live"
          "telegram"
          "loom"
          "cleanshot"
        ];
        masApps = {
          "Yoink" = 457622435;
          "EdisonMail" = 1489591003;
        };
        # onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };
      fonts.packages = [
        (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      system.defaults = {
        # minimal dock
        dock = {
          autohide = true;
          orientation = "center";
          show-process-indicators = false;
          show-recents = false;
          static-only = true;
          persistent-apps = [
            "/System/Applications/Calendar.app"
            "/System/Applications/Messages.app"
            "/Applications/Email.app"
            "${pkgs.arc}/Applications/Arc.app"
            "${pkgs.google-chrome}/Applications/Google Chrome.app"
            "/Applications/Notion.app"
            "${pkgs.wezterm}/Applications/WezTerm.app"
            "${pkgs.vscode}/Applications/Visual Studio Code.app"
            "/Applications/ChatGPT.app"
          ];
        };
        # a finder that tells me what I want to know and lets me work
        finder = {
          AppleShowAllExtensions = true;
          ShowPathbar = true;
          FXEnableExtensionChangeWarning = false;
          FXPreferredViewStyle = "clmv";
        };
        NSGlobalDomain = {
          AppleInterfaceStyle = "Dark";
          KeyRepeat = 2;
          "com.apple.keyboard.modifiermapping.1452-610-0" = [{
            HIDKeyboardModifierMappingDst = 30064771299; # Control Key
            HIDKeyboardModifierMappingSrc = 30064771129; # Caps Lock Key
          }];
        };
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';


      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#buzamac
    darwinConfigurations."buzamac" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = false;

            # User owning the Homebrew prefix
            user = "jbuza";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."buzamac".pkgs;
  };
}
