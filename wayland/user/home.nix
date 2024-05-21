{ config, pkgs, ... }:

{
  imports = [
    ../../modules/zsh.nix
    ../../modules/git.nix
    ../../modules/alacritty.nix
    ../../modules/fuzzel.nix
    ../../modules/neovim/neovim.nix
    ../../modules/dev.nix

    ../../modules/stylix.nix

    ../../modules/hyprland/hyprland.nix
    ../../modules/waybar/waybar.nix
    ../../modules/waybar/waybar-modules.nix
    ../../modules/waybar/waybar-style.nix
    ../../modules/notifications.nix
    ../../scripts/volume.nix
    ../../scripts/battery_notifier.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "AzSamSi";
  home.homeDirectory = "/home/AzSamSi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Allows nix to install unfree applications
  nixpkgs.config = {
    allowUnfree = true;
  };

  services.udiskie.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    spotify
    bitwarden
    discord
    signal-desktop
    telegram-desktop
    vlc
    qbittorrent-qt5
    acpi
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/AzSamSi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    #EDITOR = "vim";
    EDITOR = "nvim";
  };

  #xdg.enable = true;
  #xdg.userDirs = {
  #extraConfig = {
  #XDG_CONFIG_HOME = "~/.config/";
  #};
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
