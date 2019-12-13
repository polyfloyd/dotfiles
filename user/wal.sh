#!/bin/bash

set -eu

PATH=$PATH:$HOME/.local/bin
HOOK=$HOME/.local/share/wal-hook.sh
BACKEND=wal

mode=${1:-toggle}
if [[ $mode == "toggle" ]]; then
	statefile="$HOME/.cache/wal-bg"
	current=$(cat $statefile || echo "dark")
	if [[ $current == "dark" ]]; then
		mode="light"
	else
		mode="dark"
	fi
	echo $mode > $statefile
fi

if [[ $mode == "light" ]]; then
	python3 -m pywal --theme base16-one -l -o $HOOK --backend wal

elif [[ $mode == "dark" ]]; then
	python3 -m pywal --theme base16-onedark -o $HOOK --backend wal

else
	echo bad mode: $mode
	exit 1
fi
