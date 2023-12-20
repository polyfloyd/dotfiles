#!/bin/bash

in=`cat $HOME/.config/waypaper/config.ini | sed -En 's/^wallpaper = (.+)$/\1/p'`

swaylock --daemonize --image ":$in"
