#!/bin/sh

if [ "$1" == "restore" ]; then
	cp -rf etc /
	cp -rf home /
else
	DOTFILES="
	$HOME/.Xdefaults
	$HOME/.config/user-dirs.dirs
	$HOME/.config/openbox/
	$HOME/.conkyrc
	$HOME/.fehbg
	$HOME/.gitconfig
	$HOME/.gtkrc-2.0
	$HOME/.irssi
	$HOME/.rtorrent.rc
	$HOME/.tmux.conf
	$HOME/.vimperatorrc
	$HOME/.xinitrc
	$HOME/.zshrc
	"

	CONFIGS="
	/etc/X11/xorg.conf.d/10-keyboard.conf
	/etc/mpd.conf
	/etc/rc.conf
	"

	for svc in $DOTFILES; do
		cp -rfu --parents $svc .
	done

	for svc in $CONFIGS; do
		cp -rfu --parents $svc .
	done

	if [ ! -d ".git" ]; then
		git init
		git add .
		git commit -m 'synced'
		git remote add github git@github.com:coirius/conf.git
		git push github master
	else
		git add .
		git commit -m 'synced'
		git push github master
	fi
fi
exit 0
