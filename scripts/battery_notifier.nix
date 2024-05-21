{ pkgs, ... }:

# Regularly check the battery status and send a notification when it discharges
# below certain thresholds.
# Implemented by calling the `acpi` program regularly. This is the simpler and
# safer approach because the battery might not send discharging events.

{
  systemd.user.services.battery_notifier = {
    Unit = {
      Description = "Check battery on frequent intervals and warn if the battery % becomes less than a treshold.";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "battery_notifier" ''
        echo "Service has started"

        notify () {
          notify-send -a Battery "$@" \
            -h "int:value:$CAPACITY" "Discharging" "$CAPACITY%, $REMAINING"
        }

        LOW_BATTERY_THRESHOLD=15 # in percentage

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
        elif [[ $CAPACITY -ge 20 ]]; then sleep 5m
        elif [[ $CAPACITY -ge 15 ]]; then sleep 3m
        else sleep 1m
        fi
        done
      ''}";
    };
  };
}
