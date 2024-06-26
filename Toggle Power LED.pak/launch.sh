#!/bin/bash

cd "$(dirname "$0")"

SCRIPT_DIR="$(pwd)"
MINUI_FILE="/mnt/sdcard/.system/rg35xxplus/paks/MinUI.pak/launch.sh"
MINUI_BOOT=$(cat $MINUI_FILE)
LED_COMMAND="'$SCRIPT_DIR/enable_led.sh' > /dev/null 2>&1 &"
ESCAPED_COMMAND=$(printf '%s\n' "$LED_COMMAND" | sed -e 's/[]\/$*.^[]/\\&/g')

if [[ "$MINUI_BOOT" != *"$LED_COMMAND"* ]]; then
	# Add the boot script to MinUI's startup file right after it disables the LED
	sed -i -e "/^echo 0 > \/sys\/class\/power_supply\/axp2202-battery\/work_led/a $LED_COMMAND" $MINUI_FILE
	# Execute our script now so it will enable the LED right away
	eval "$LED_COMMAND"
else
	# If the script already exists, remove it
	sed -i -e "/^$ESCAPED_COMMAND/d" $MINUI_FILE
	killall enable_led.sh
	echo 0 > /sys/class/power_supply/axp2202-battery/work_led
fi
