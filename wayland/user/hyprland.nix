# User hyprland config
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    feh
    killall
    swaybg
  ];

  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    systemd.enable = true;
    enable = true;
    plugins = [];
    settings = {};
    extraConfig = ''
      env = XCURSOR_SIZE,16

      input {
        kb_layout = us,bg
        kb_variant = ,phonetic
        kb_model =
        kb_options = grp:alt_shift_toggle
        kb_rules =

        follow_mouse = 1
        accel_profile = false

        touchpad {
          natural_scroll = yes
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }


      general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5
        gaps_out = 20
        border_size = 1
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
      }


      decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 5

        blur {
          enabled = true
          size = 3
          passes = 1
        }

        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }

      dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
      }

      animations {
        enabled = yes

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }


      master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
      }

      gestures {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = off
      }

      misc {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more

      device:epic-mouse-v1 {
        sensitivity = -0.5
      }

      # Executes ------------------------

      exec-once = swaybg -i /usr/share/backgrounds/background.jpg
      exec-once = hypridle

      # Additional ----------------------

      # Bindings ------------------------

      bind = SUPER, RETURN, exec, alacritty
      bind = SUPER SHIFT, Q, killactive,
      bind = SUPER, F, fullscreen,
      bind = SUPER, M, exit,
      bind = SUPER, V, togglefloating,
      bind = SUPER, R, exec, rofi -show combi -show-icons
      bind = SUPER, P, pseudo, # dwindle
      bind = SUPER, J, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = SUPER, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = SUPER SHIFT, 1, movetoworkspace, 1
      bind = SUPER SHIFT, 2, movetoworkspace, 2
      bind = SUPER SHIFT, 3, movetoworkspace, 3
      bind = SUPER SHIFT, 4, movetoworkspace, 4
      bind = SUPER SHIFT, 5, movetoworkspace, 5
      bind = SUPER SHIFT, 6, movetoworkspace, 6
      bind = SUPER SHIFT, 7, movetoworkspace, 7
      bind = SUPER SHIFT, 8, movetoworkspace, 8
      bind = SUPER SHIFT, 9, movetoworkspace, 9
      bind = SUPER SHIFT, 0, movetoworkspace, 10

      # Example special workspace (scratchpad)
      bind = SUPER, S, togglespecialworkspace, magic
      bind = SUPER SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # Brightness binds
      bindl = , XF86MonBrightnessUp, exec, brightnessctl s 2%+
      bindl = , XF86MonBrightnessDown, exec, brightnessctl s 2%-

      # Audio binds
      bindl = , XF86AudioRaiseVolume, exec, pamixer -i 5
      bindl = , XF86AudioLowerVolume, exec, pamixer -d 5
      bindl = , XF86AudioMute, exec, pamixer -t
      bindl = , XF86AudioMicMute, exec, pamixer --default-source -t
    '';
  };
}
