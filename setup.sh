#! /bin/bash

set -eux

DIR=$(readlink -f $(dirname $0))

enable_in_home() {
	mkdir -p "$HOME/$(dirname "$2")"
	ln -sfn "$DIR/user/$1" "$HOME/$2"
}

enable_in_home "config/alacritty.toml"          ".config/alacritty.toml"
enable_in_home "config/eww"                     ".config/eww"
enable_in_home "config/sway"                    ".config/sway"
enable_in_home "nvim"                           ".config/nvim"

enable_in_home "ncmpcpp/config"                 ".ncmpcpp/config"

vim +PluginInstall +qall
