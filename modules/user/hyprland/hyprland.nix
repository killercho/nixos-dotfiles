# User hyprland config
{ config, pkgs, ... }:

{
  imports = [
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    feh
    killall
    awww
    wleave
    slurp
    grim
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
      };
    };
  };

  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    systemd.enable = true;
    enable = true;
    configType = "lua";
    plugins = [ ];
    settings = { };
    extraConfig = ''
      hl.on("hyprland.shutdown", function()
          hl.exec_cmd("systemctl --user stop hyprland-session.target")
      end)

      hl.monitor({
          output = "eDP-1",
          mode = "highres",
          position = "auto",
          scale = "2",
      })

      hl.monitor({
          output = "HDMI-A-1",
          mode = "highres",
          position = "auto-right",
          scale = "1",
          transform = 1,
      })

      -- Setup any other monitor to be default on the right as extention
      hl.monitor({
          output = "",
          mode = "preferred",
          position = "auto",
          scale = "1",
      })

      -- Environmental variables
      hl.env("XCURSOR_SIZE", "8")
      hl.env("GDK_SCALE", "2")

      -- Force backends to try and use wayland
      hl.env("GDK_BACKEND", "wayland,x11")

      hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
      hl.animation({
          leaf = "windows",
          enabled = true,
          speed = 7,
          bezier = "myBezier",
      })
      hl.animation({
          leaf = "windowsOut",
          enabled = true,
          speed = 7,
          bezier = "default",
          style = "popin 80%",
      })
      hl.animation({
          leaf = "border",
          enabled = true,
          speed = 10,
          bezier = "default",
      })
      hl.animation({
          leaf = "borderangle",
          enabled = true,
          speed = 8,
          bezier = "default",
      })
      hl.animation({
          leaf = "fade",
          enabled = true,
          speed = 7,
          bezier = "default",
      })
      hl.animation({
          leaf = "workspaces",
          enabled = true,
          speed = 8,
          bezier = "default",
      })

      hl.gesture({
          fingers = 3,
          direction = "horizontal",
          action = "workspace",
      })

      hl.device({
          name = "epic-mouse-v1",
          sensitivity = -0.5,
      })

      hl.window_rule({
          match = {
              fullscreen = true,
          },
          idle_inhibit = "fullscreen",
      })

      hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"))
      hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
      hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
      hl.bind("SUPER + M", hl.dsp.exit())
      hl.bind("SUPER + SPACE", hl.dsp.window.float({ action = "toggle" }))
      hl.bind("SUPER + R", hl.dsp.exec_cmd("fuzzel"))
      hl.bind("ALT + L", hl.dsp.exec_cmd("hyprlock --immediate"))
      hl.bind("SUPER + P", hl.dsp.window.pseudo())
      hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("wleave -f -k"))
      hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("slurp | grim -g - - | wl-copy"))

      hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
      hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
      hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
      hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
      hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
      hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
      hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
      hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

      hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
      hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
      hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
      hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
      hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
      hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
      hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
      hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

      hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
      hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
      hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
      hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
      hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
      hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
      hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
      hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
      hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
      hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

      hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
      hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
      hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
      hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
      hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
      hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
      hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
      hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
      hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
      hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

      hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
      hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

      hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

      hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
      hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 2%+"), { locked = true })
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 2%-"), { locked = true })

      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true })
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true })
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true })
      hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"), { locked = true })

      hl.config({
          xwayland = {
              -- Remove pixelation from xwayland apps
              --force_zero_scaling = true
          },
          input = {
              kb_layout = "us,bg",
              kb_variant = ",phonetic",
              kb_model = "",
              kb_options = "grp:alt_shift_toggle",
              kb_rules = "",
              follow_mouse = 1,
              touchpad = {
                  natural_scroll = true,
                  drag_lock = true,
              },
              sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
          },
          general = {
              -- See https://wiki.hyprland.org/Configuring/Variables/ for more
              gaps_in = 5,
              gaps_out = 20,
              border_size = 1,
              col = {
                  active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
                  inactive_border = "rgba(595959aa)",
              },
              layout = "dwindle",
              -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
              allow_tearing = false,
          },
          decoration = {
              -- See https://wiki.hyprland.org/Configuring/Variables/ for more
              rounding = 5,
              blur = {
                  enabled = true,
                  size = 8,
                  passes = 1,
              },
              --shadow {
              --  range = 4
              --  render_power = 3
              --  color = rgba(1a1a1aee)
              --}
              --drop_shadow = true
              --shadow_range = 4
              --shadow_render_power = 3
              --col.shadow = rgba(1a1a1aee)
              dim_special = 0.4,
          },
          dwindle = {
              -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
              -- pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = true, -- you probably want this
          },
          animations = {
              enabled = true,
              -- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          },
          master = {
              -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
              new_status = "master",
              orientation = "right",
          },
          -- Enable touchpad gestures
          misc = {
              -- See https://wiki.hyprland.org/Configuring/Variables/ for more
              force_default_wallpaper = 0, -- Set to 0 to disable the anime mascot wallpapers
              disable_hyprland_logo = true,
          },
          -- Example per-device config
          -- See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
          -- Executes ------------------------
          -- Additional ----------------------
          -- windowrule to avoid idle for fullscreen apps
          -- Bindings ------------------------
          -- bind = SUPER, J, togglesplit, # dwindle
          -- Move focus with mainMod + arrow keys
          -- Move focus with mainMod + vim movement keys keys
          -- Move window in a workspace
          -- Switch workspaces with mainMod + [0-9]
          -- Move active window to a workspace with mainMod + SHIFT + [0-9]
          -- Example special workspace (scratchpad)
          -- Scroll through existing workspaces with mainMod + scroll
          -- Move/resize windows with mainMod + LMB/RMB and dragging
          -- Brightness binds
          -- Audio binds
          -- Audio binds with icons
          --bind = , XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volume.sh --inc
          --bind = , XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volume.sh --dec
          --bind = , XF86AudioMicMute, exec, ~/.config/hypr/scripts/volume.sh --toggle-mic
          --bind = , XF86AudioMute, exec, ~/.config/hypr/scripts/volume.sh --toggle
      })

      hl.on("hyprland.start", function()
          hl.exec_cmd("/nix/store/zxa3zcxg8r9850mii1ahxwdxj9f99401-dbus-1.16.2/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")
          hl.exec_cmd("awww-daemon")
          hl.exec_cmd("awww img /usr/share/backgrounds/background.jpg")
          hl.exec_cmd("hypridle")
          hl.exec_cmd("nm-applet")
      end)
    '';
  };
}
