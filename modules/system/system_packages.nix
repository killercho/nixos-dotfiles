{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    fastfetch
    btop
    git
    gh
    gcc
    nodejs
    alacritty
    zsh
    bluez
    networkmanagerapplet
    pipewire
    pavucontrol
    pamixer
    brightnessctl
    xfce.thunar
    firefox
    #old-23-11.firefox # If the discord is needed again
    libinput
    libinput-gestures
    xdotool
    libnotify
    tlp

    # Usb tools and services
    usbutils
    udiskie
    udisks
  ];

  # Enable usbs
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  programs = {
    thunar.enable = true;
    zsh.enable = true;
    kdeconnect.enable = true;
  };

  fonts.packages = with pkgs; [
    hackgen-nf-font
    font-awesome
    jetbrains-mono
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable the buttons on the headset
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}
