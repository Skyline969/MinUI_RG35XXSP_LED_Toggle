#!/bin/sh

while true
do
	# Enable the power LED (known to the OS as work_led)
	echo 1 > /sys/class/power_supply/axp2202-battery/work_led
	sleep 1
done