#! /bin/bash

DIR=$(readlink -f $(dirname $0))

mkdir -p "$HOME/.mpd/playlists"
mkdir -p "$HOME/.ncmpcpp"

enable_in_home() {
	rm -rf $HOME/$2 2>/dev/null
	ln -s "$DIR/user/$1" "$HOME/$2"
}

null_in_home() {
	rm -rf $HOME/$1 2>/dev/null
	ln -s /dev/null $HOME/$1
}

enable_in_home "bashrc"    ".bashrc"
enable_in_home "mpdconf"   ".mpdconf"
enable_in_home "ncmpcpp"   ".ncmpcpp/config"
enable_in_home "profile"   ".profile"
enable_in_home "profile"   ".xprofile"
enable_in_home "dircolors" ".dircolors"
enable_in_home "vim"       ".vim"
enable_in_home "vim/vimrc" ".vimrc"
enable_in_home "Xmodmap"   ".Xmodmap"

null_in_home ".adobe"
null_in_home ".macromedia"

vim +PluginInstall +qall
