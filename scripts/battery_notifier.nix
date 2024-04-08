{ config, pkgs, lib, ... }:

# Regularly check the battery status and send a notification when it discharges
# below certain thresholds.
# Implemented by calling the `acpi` program regularly. This is the simpler and
# safer approach because the battery might not send discharging events.

# Change the LOW_BATTERY_THRESHOLD to be 15 instead of 100

{
  systemd.user.services.battery_notifier = {
    Unit = {
      Description = "Check battery on frequent intervals and warn if the battery % becomes less than a treshold.";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      User = "AzSamSi";
      Environment = "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/%U/bus";
      ExecStart = "${pkgs.writeShellScript "battery_notifier" ''
        notify () {
          ${pkgs.libnotify}/bin/notify-send -a Battery "$@" \
            -h "int:value:$CAPACITY" "Discharging" "$CAPACITY%, $REMAINING"
        }

        echo "Service has started"
        echo "Executed the first echos"

        BATTERY_INFO_DIRECTORY=/sys/class/power_supply/BAT0
        LOW_BATTERY_THRESHOLD=100 # in percentage
        SLEEP_TIME=150 # in seconds

        while true
        do
        IFS=: read _ bat0 < <(${pkgs.acpi}/bin/acpi -b)
        IFS=\ , read STATUS CAPACITY REMAINING <<<"$bat0"
        CAPACITY=''${CAPACITY%\%}

        if [[ $CAPACITY -le $LOW_BATTERY_THRESHOLD && $STATUS == "Discharging" ]]
        then
        notify -u critical
        fi

        if [[ $CAPACITY -gt 30 ]]; then sleep 10m
        elif [[ $val -ge 20 ]]; then sleep 5m
        else sleep 1m
        fi
        done
      ''}";
    };
  };
}
