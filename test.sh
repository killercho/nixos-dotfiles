#!bin/bash

notify() {
        notify-send -a Battery "$@" \
                -h "int:value:$CAPACITY" "Discharging" "$CAPACITY%, $REMAINING"
}

echo "Service has started"
echo "Executed the first echos"

BATTERY_INFO_DIRECTORY=/sys/class/power_supply/BAT0
LOW_BATTERY_THRESHOLD=100 # in percentage
SLEEP_TIME=150            # in seconds

while true; do
        IFS=: read _ bat0 < <(acpi -b)
        IFS=\ , read STATUS CAPACITY REMAINING <<<"$bat0"
        CAPACITY=''${CAPACITY%\%}

        if [[ $CAPACITY -le $LOW_BATTERY_THRESHOLD && $STATUS == "Discharging" ]]; then
                notify -u critical
        fi

        if [[ $CAPACITY -gt 30 ]]; then
                sleep 10m
        elif [[ $CAPACITY -ge 20 ]]; then
                sleep 5m
        else
                sleep 1m
        fi
done
