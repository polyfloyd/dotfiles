#!/bin/bash

size=`xrandr | grep \* | cut -d' ' -f4`
in=`cat "$HOME/.config/nitrogen/bg-saved.cfg" | grep -o '^file.\+$' | sed 's/^file=//' | head -n1`
out="$HOME/.cache/lock-$(echo $in $size | shasum | cut -d' ' -f1).png"

if [ ! -f "$out" ]; then
	convert "$in" -resize "$size^" -gravity center -extent $size "$out"
fi

i3lock -i "$out"
