{
  # Enable Homebrew support in the Nix configuration
  enable = true;

  # Automatically update Homebrew formulas on activation (when Nix configuration is applied)
  onActivation.autoUpdate = true;

  # Upgrade installed packages to their latest versions on activation
  onActivation.upgrade = true;

  # Disable macOS quarantine for apps installed via Homebrew casks (avoids "App can't be opened" warnings)
  caskArgs.no_quarantine = true;

  # Use a global Brewfile to manage Homebrew dependencies across the system
  global.brewfile = true;

  brews = [
    "mas"
    "zsh-syntax-highlighting"
    "zsh-autocomplete"
  ];

  casks = [
    # Terminal and Shell Tools
    "wezterm@nightly"
    "amazon-q"

    # Code Editors and IDEs
    "visual-studio-code"
    "sublime-text"

    # Web Browsers
    "arc"
    "google-chrome"
    "firefox"
    "brave-browser"

    # Communication Apps
    "slack"
    "discord"
    "whatsapp"

    # Productivity Apps
    "notion"
    "raycast"
    "chatgpt"
    "amethyst"

    # Media and Entertainment
    "spotify"
    "iina"

    # Utility Applications
    "appcleaner"
    "cleanshot"
    "loom"

    # Security and Privacy
    "nordvpn"

    # Finance and Cryptocurrency
    "ledger-live"
  ];

  masApps = {
    "Yoink" = 457622435;
    "EdisonMail" = 1489591003;
  };
}
