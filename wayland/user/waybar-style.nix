# User waybar style config
{ config, pkgs, stylix, ... }:

{
  programs.waybar = {
    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */

            }

            window#waybar {
            background-color: #'' + config.lib.stylix.colors.base00 + '';
              opacity: 0.75;
              border-radius: 8px;
              color: #'' + config.lib.stylix.colors.base07 + '';
                transition-property: background-color;
                transition-duration: .2s;
                }

                window > box {
                border-radius: 8px;
                opacity: 0.94;
                }

                window#waybar.hidden {
                opacity: 0.2;
                }

                button {
                border: none;
                }

      #custom-hyprprofile {
                color: #'' + config.lib.stylix.colors.base0D + '';
                  }

                  /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
                  button:hover {
                  background: inherit;
                  }

      #workspaces button {
                  padding: 0 7px;
                  background-color: transparent;
                  color: #'' + config.lib.stylix.colors.base04 + '';
                    }

      #workspaces button:hover {
                    color: #'' + config.lib.stylix.colors.base07 + '';
                      }

      #workspaces button.active {
                      color: #'' + config.lib.stylix.colors.base08 + '';
                        }

      #workspaces button.focused {
                        color: #'' + config.lib.stylix.colors.base0A + '';
                          }

      #workspaces button.visible {
                          color: #'' + config.lib.stylix.colors.base05 + '';
                            }

      #workspaces button.urgent {
                            color: #'' + config.lib.stylix.colors.base09 + '';
                              }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
                              padding: 0 10px;
                              color: #'' + config.lib.stylix.colors.base07 + '';
                                border: none;
                                border-radius: 8px;
                                }

      #window,
      #workspaces {
                                margin: 0 4px;
                                }

                                /* If workspaces is the leftmost module, omit left margin */
                                .modules-left > widget:first-child > #workspaces {
                                margin-left: 0;
                                }

                                /* If workspaces is the rightmost module, omit right margin */
                                .modules-right > widget:last-child > #workspaces {
                                margin-right: 0;
                                }

      #clock {
                                color: #'' + config.lib.stylix.colors.base0D + '';
                                  }

      #battery {
                                  color: #'' + config.lib.stylix.colors.base0B + '';
                                    }

      #battery.charging, #battery.plugged {
                                    color: #'' + config.lib.stylix.colors.base0C + '';
                                      }

                                      @keyframes blink {
                                      to {
                                      background-color: #'' + config.lib.stylix.colors.base07 + '';
                                        color: #'' + config.lib.stylix.colors.base00 + '';
                                          }
                                          }

      #battery.critical:not(.charging) {
                                          background-color: #'' + config.lib.stylix.colors.base08 + '';
                                            color: #'' + config.lib.stylix.colors.base07 + '';
                                              animation-name: blink;
                                              animation-duration: 0.5s;
                                              animation-timing-function: linear;
                                              animation-iteration-count: infinite;
                                              animation-direction: alternate;
                                              }

                                              label:focus {
                                              background-color: #'' + config.lib.stylix.colors.base00 + '';
                                                }

      #cpu {
                                                color: #'' + config.lib.stylix.colors.base0D + '';
                                                  }

      #memory {
                                                  color: #'' + config.lib.stylix.colors.base0E + '';
                                                    }

      #disk {
                                                    color: #'' + config.lib.stylix.colors.base0F + '';
                                                      }

      #backlight {
                                                      color: #'' + config.lib.stylix.colors.base0A + '';
                                                        }

                                                        label.numlock {
                                                        color: #'' + config.lib.stylix.colors.base04 + '';
                                                          }

                                                          label.numlock.locked {
                                                          color: #'' + config.lib.stylix.colors.base0F + '';
                                                            }

      #pulseaudio {
                                                            color: #'' + config.lib.stylix.colors.base0C + '';
                                                              }

      #pulseaudio.muted {
                                                              color: #'' + config.lib.stylix.colors.base04 + '';
                                                                }

      #tray > .passive {
                                                                -gtk-icon-effect: dim;
                                                                }

      #tray > .needs-attention {
                                                                -gtk-icon-effect: highlight;
                                                                }

      #idle_inhibitor {
                                                                color: #'' + config.lib.stylix.colors.base04 + '';
                                                                  }

      #idle_inhibitor.activated {
                                                                  color: #'' + config.lib.stylix.colors.base0F + '';
                                                                    }

                                                                  '';
                                                                };
                                                              }
