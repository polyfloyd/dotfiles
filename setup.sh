#! /bin/bash

set -eu

DIR=$(readlink -f $(dirname $0))

enable_in_home() {
	mkdir -p "$HOME/$(dirname "$2")"
	ln -sfn "$DIR/user/$1" "$HOME/$2"
}

enable_in_home "Xmodmap"                        ".Xmodmap"
enable_in_home "bashrc"                         ".bashrc"
enable_in_home "dircolors/dircolors.ansi-dark"  ".config/dircolors"
enable_in_home "profile"                        ".profile"
enable_in_home "config/eww"                     ".config/eww"
enable_in_home "nvim"                           ".config/nvim"

enable_in_home "profile"                        ".xprofile"
enable_in_home "config/i3/config"               ".config/i3/config"
enable_in_home "config/brightness"              ".config/brightness"
enable_in_home "mpdconf"                        ".mpdconf"
enable_in_home "ncmpcpp/config"                 ".ncmpcpp/config"

enable_in_home "bin/brightness.sh"              ".bin/brightness.sh"
enable_in_home "bin/lock.sh"                    ".bin/lock.sh"

vim +PluginInstall +qall
