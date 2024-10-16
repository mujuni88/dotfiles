{ config, pkgs, ... }:

{
  enable = true;
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;

  brews = [
    "mas"
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

    # Communication Apps
    "slack"
    "discord"
    "whatsapp"

    # Productivity Apps
    "notion"
    "raycast"
    "chatgpt"

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
