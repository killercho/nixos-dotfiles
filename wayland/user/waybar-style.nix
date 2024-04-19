# User waybar style config
{ config, pkgs, stylix, ... }:

{
  programs.waybar = {
    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */

            background-color: transparent;
              border-radius: 0;
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
                  background-color: #'' + config.lib.stylix.colors.base00 + '';
                    color: #'' + config.lib.stylix.colors.base02 + '';
                      border-radius: 16px;
                      }

      #workspaces button:hover {
                      background-color: #'' + config.lib.stylix.colors.base07 + '';
                        color: #000000;
                          border-radius: 16px;
                        }

      #workspaces button.active {
                        background-color: #'' + config.lib.stylix.colors.base08 + '';
                          color: #000000;
                          border-radius: 16px;
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
                              background-color: #'' + config.lib.stylix.colors.base09 + '';
                                color: #ffffff;
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
                                background-color: #'' + config.lib.stylix.colors.base07 + '';
                                  color: #000000;
                                  border: 0px;
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
                                  color: #'' + config.lib.stylix.colors.base07 + '';
                                    background-color: #'' + config.lib.stylix.colors.base02 + '';
                                      }

      #clock {
                                      color: #000000;
                                      background-color: #'' + config.lib.stylix.colors.base0D + '';
                                        }

      #battery {
                                        color: #000000;
                                        background-color: #'' + config.lib.stylix.colors.base0B + '';
                                          }

      #battery.charging, #battery.plugged {
                                          color: #ffffff;
                                          background-color: #'' + config.lib.stylix.colors.base0C + '';
                                            }

                                            @keyframes blink {
                                            to {
                                            background-color: #'' + config.lib.stylix.colors.base07 + '';
                                              color: #ffffff;
                                              }
                                              }

      #battery.critical:not(.charging) {
                                              background-color: #'' + config.lib.stylix.colors.base08 + '';
                                                color: #ffffff;
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
                                                  background-color: #'' + config.lib.stylix.colors.base0D + '';
                                                    color: #000000;
                                                    }

      #memory {
                                                    background-color: #'' + config.lib.stylix.colors.base0E + '';
                                                      color: #000000;
                                                      }

      #disk {
                                                      background-color: #'' + config.lib.stylix.colors.base0F + '';
                                                        color: #000000;
                                                        }

      #backlight {
                                                        background-color: #'' + config.lib.stylix.colors.base0A + '';
                                                          color: #000000;
                                                          }

      #pulseaudio {
                                                          background-color: #'' + config.lib.stylix.colors.base0C + '';
                                                            color: #000000;
                                                                }

      #pulseaudio.muted {
                                                            background-color: #'' + config.lib.stylix.colors.base04 + '';
                                                              color: #000000;
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
