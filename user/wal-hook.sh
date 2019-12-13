#!/bin/bash

. $HOME/.cache/wal/colors.sh

set -eu

DCONF_PROFILE="/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9"

hex_to_dconf() {
	r=$(echo $1 | cut -b 2,3)
	g=$(echo $1 | cut -b 4,5)
	b=$(echo $1 | cut -b 6,7)
	echo -n "'"
	echo -n rgb\($((0x$r)),$((0x$g)),$((0x$b))\)
	echo -n "'"
}

palette=`
	for i in {0..15}; do
		c=color$i
		hex_to_dconf ${!c}
		echo -n ','
	done | sed 's/^/[/' | sed 's/,$/]/'
`
dconf write $DCONF_PROFILE/background-color $(hex_to_dconf $background)
dconf write $DCONF_PROFILE/foreground-color $(hex_to_dconf $foreground)
dconf write $DCONF_PROFILE/palette "$palette"
