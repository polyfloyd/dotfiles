#!/bin/bash

DEV="/sys/class/backlight/intel_backlight"

set -eu

if [[ $1 == "up" ]]; then
	delta=0.1
elif [[ $1 == "down" ]]; then
	delta=-0.1
else
	echo "bad arg: $1"
	exit 1
fi

max=$(cat "$DEV/max_brightness")
cur=$(cat "$DEV/brightness")
new=$(echo "scale=4; ($cur / $max + $delta) * $max" | bc)
printf %.0f $new > "$DEV/brightness" || true
