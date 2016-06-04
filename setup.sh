#! /bin/bash

set -eu

DIR=$(readlink -f $(dirname $0))

enable_in_home() {
	mkdir -p "$HOME/$(dirname "$2")"
	ln -sfn "$DIR/user/$1" "$HOME/$2"
}

enable_in_home "Xmodmap"                       ".Xmodmap"
enable_in_home "bashrc"                        ".bashrc"
enable_in_home "dircolors/dircolors.ansi-dark" ".config/dircolors"
enable_in_home "profile"                       ".profile"
enable_in_home "vim"                           ".vim"
enable_in_home "vimrc"                         ".vimrc"

enable_in_home "profile"                       ".xprofile"
enable_in_home "config/terminator/config"      ".config/terminator/config"
enable_in_home "mpdconf"                       ".mpdconf"
enable_in_home "ncmpcpp/config"                ".ncmpcpp/config"

vim +PluginInstall +qall
