#!/bin/bash

battLevel=$(acpi -b | cut -d "," -f2 | sed 's/%//g')

echo $battLevel

acPower=$(acpi -b | grep -c "Charging")
echo $acPower

if [[ $acPower -eq 1 && $battLevel -eq 100  ]]; then
    export DISPLAY=:0.0
fi

if [[ $acPower -eq 0 && $battLevel -lt 20 ]]; then
    export DISPLAY=:0.0
    /usr/bin/zenity --warning --title="Battery Level $battLevel" --width=600 --timeout=10 --text="Please plug the charger" | /usr/bin/speak "Please connect charger" -s 140
fi
