#!/bin/sh

if [ "$1" == "restore" ]; then
	cp -rf etc /
	cp -rf home /
	cp -rf usr /
else
	DOTFILES="
	$HOME/.Xdefaults
	$HOME/.config/user-dirs.dirs
	$HOME/.config/openbox/
	$HOME/.conkyrc
	$HOME/.fehbg
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

	MISC="
	/usr/share/themes/Litestyle
	/usr/share/fonts/TTF/monaco.ttf
	/usr/share/slim/themes/default/background.jpg
	/usr/share/slim/themes/default/background_backup.jpg
	"

	for svc in $DOTFILES; do
		cp -rfu --parents $svc .
	done

	for svc in $CONFIGS; do
		cp -rfu --parents $svc .
	done

	for svc in $MISC; do
		cp -rfu --parents $svc .
	done

	if [ ! -d ".git" ]; then
		git init
		git add .
		git commit -m 'synced'
		git remote add github git@github.com:sash13/conf.git
		git push origin master
	else
		git add .
		git commit -m 'synced'
		git push origin master
	fi
fi
exit 0
