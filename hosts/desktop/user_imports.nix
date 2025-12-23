{ ... }:

let
  additionalConfig = {
    terminalFontSize = 13;
  };
in
{
  imports = [
    # Home.nix split up into two files
    ./../../modules/user/home_settings.nix
    ./../../modules/user/user_packages.nix

    # User shell configuration
    ./../../modules/user/zsh.nix

    # User git configuration
    ./../../modules/user/git.nix

    # User terminal configuration
    ./../../modules/user/alacritty.nix

    # User app launcher configuration
    ./../../modules/user/fuzzel.nix

    # User neovim configuration
    ./../../modules/user/neovim/neovim.nix

    # Development needed tools
    ./../../modules/user/dev.nix

    # User stylix configuration
    (import ./../../modules/user/stylix.nix
      {
        inherit additionalConfig;
      })

    # User hyprland configuration
    ./../../modules/user/hyprland/hyprland.nix

    # Notification popups configuration
    ./../../modules/user/notifications.nix

    #User waybar configuration
    ./../../modules/user/waybar/waybar.nix
    ./../../modules/user/waybar/waybar-modules.nix
    ./../../modules/user/waybar/waybar-style.nix

    # Volume popup script
    ./../../scripts/volume.nix

    # Battery low warning
    #./../../scripts/battery_notifier.nix

    ./../../modules/user/desktop_specific.nix

    # Gaming user settings
    ./../../modules/user/gaming.nix
  ];
}
