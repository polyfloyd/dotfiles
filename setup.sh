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
enable_in_home "vim"                            ".vim"
enable_in_home "vim"                            ".config/nvim"
enable_in_home "vimrc"                          ".vimrc"

enable_in_home "profile"                        ".xprofile"
enable_in_home "config/i3/config"               ".config/i3/config"
enable_in_home "config/brightness"              ".config/brightness"
enable_in_home "config/compton.conf"            ".config/compton.conf"
enable_in_home "config/alacritty/alacritty.yml" ".config/alacritty/alacritty.yml"
enable_in_home "mpdconf"                        ".mpdconf"
enable_in_home "ncmpcpp/config"                 ".ncmpcpp/config"

if [ ! -e ~/.fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
	cd ~/.fzf && git pull
fi
~/.fzf/install --key-bindings --no-completion --no-update-rc

vim +PluginInstall +qall
