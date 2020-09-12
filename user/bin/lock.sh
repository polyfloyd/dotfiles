#!/bin/bash

size=`xrandr | grep connected | grep -o '[0-9]\+x[0-9]\+'`
in=`cat "$HOME/.config/nitrogen/bg-saved.cfg" | grep -o '^file.\+$' | sed 's/^file=//' | head -n1`
out="$HOME/.cache/lock-$(echo $in $size | shasum | cut -d' ' -f1).png"

if [ ! -f "$out" ]; then
	convert "$in" -resize "$size^" -gravity center -extent $size "$out"
fi

i3lock -i "$out"
