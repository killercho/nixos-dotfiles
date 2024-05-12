# User waybar style config
{ config, pkgs, stylix, ... }:

{
  programs.waybar = {
    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */

            background-color: transparent;
              border-radius: 0;
              font-size: 11px;
              min-height: 0;
            }

            window#waybar {
            background-color: transparent;
              border-radius: 0;
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

      #workspaces {
                  /* background-color: #'' + config.lib.stylix.colors.base00 + ''; */
                    background-color: rgba(0, 0, 0, 0.5);
                      border-radius: 16px;
                      border: 2px solid #'' + config.lib.stylix.colors.base00 + '';
                        }

      #workspaces button:hover {
                          background-color: rgba(0, 0, 0, 0.5);
                            border-radius: 16px;
                            border: none;
                              }

      #workspaces button.active {
                                background-color: rgba(0, 0, 0, 0.5);
                                  border-radius: 16px;
                                  border: none;
                                    }

      #workspaces button.focused {
                                    background-color: #'' + config.lib.stylix.colors.base0A + '';
                                      color: #000000;
                                      }

      #workspaces button.visible {
                                      background-color: #'' + config.lib.stylix.colors.base05 + '';
                                        color: #000000;
                                        border-radius: 16px;
                                        }

      #workspaces button.urgent {
                                          background-color: rgba(0, 0, 0, 0.5);
                                          border: 1px solid #'' + config.lib.stylix.colors.base09 + '';
                                            border-radius: 16px;
                                            }

      #clock,
      #language,
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
                                            background-color: rgba(0, 0, 0, 0.5);
                                            color: #000000;
                                            border: 2px solid #'' + config.lib.stylix.colors.base07 + '';
                                              border-radius: 16px;
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
      #language {
                                              /* color: #'' + config.lib.stylix.colors.base02 + ''; */
                                                color: #ffffff;
                                                border: 2px solid #'' + config.lib.stylix.colors.base02 + '';
                                                  background-color: rgba(0, 0, 0, 0.5);
                                                  }

      #clock {
                                                  color: #ffffff;
                                                  border: 2px solid #'' + config.lib.stylix.colors.base0D + '';
                                                    background-color: rgba(0, 0, 0, 0.5);
                                                    }

      #battery {
                                                    color: #ffffff;
                                                    border: 2px solid #'' + config.lib.stylix.colors.base0B + '';
                                                      background-color: rgba(0, 0, 0, 0.5);
                                                      }

      #battery.charging, #battery.plugged {
                                                      color: #ffffff;
                                                      border: 2px solid #'' + config.lib.stylix.colors.base0C + '';
                                                        background-color: rgba(0, 0, 0, 0.5);
                                                        }

                                                        @keyframes blink {
                                                        to {
                                                        color: #ffffff;
                                                        border: 2px solid #'' + config.lib.stylix.colors.base07 + '';
                                                          background-color: rgba(0, 0, 0, 0.5);
                                                          }
                                                          }

      #battery.critical:not(.charging) {
                                                          color: #ffffff;
                                                          border: 2px solid #'' + config.lib.stylix.colors.base08 + '';
                                                            background-color: rgba(0, 0, 0, 0.5);
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
                                                              color: #ffffff;
                                                              border: 2px solid #'' + config.lib.stylix.colors.base0D + '';
                                                                background-color: rgba(0, 0, 0, 0.5);
                                                                }

      #memory {
                                                                color: #ffffff;
                                                                border: 2px solid #'' + config.lib.stylix.colors.base0E + '';
                                                                  background-color: rgba(0, 0, 0, 0.5);
                                                                  }

      #disk {
                                                                  color: #ffffff;
                                                                  border: 2px solid #'' + config.lib.stylix.colors.base0F + '';
                                                                    background-color: rgba(0, 0, 0, 0.5);
                                                                    }

      #backlight {
                                                                    color: #ffffff;
                                                                    border: 2px solid #'' + config.lib.stylix.colors.base0A + '';
                                                                      background-color: rgba(0, 0, 0, 0.5);
                                                                      }

      #pulseaudio {
                                                                      color: #ffffff;
                                                                      border: 2px solid #'' + config.lib.stylix.colors.base0C + '';
                                                                        background-color: rgba(0, 0, 0, 0.5);
                                                                        }

      #pulseaudio.muted {
                                                                        color: #ffffff;
                                                                        border: 2px solid #'' + config.lib.stylix.colors.base04 + '';
                                                                          background-color: rgba(0, 0, 0, 0.5);
                                                                          }

      #tray > .passive {
                                                                          -gtk-icon-effect: dim;
                                                                          }

      #tray > .needs-attention {
                                                                          -gtk-icon-effect: highlight;
                                                                          }

                                                                        '';
  };
}
