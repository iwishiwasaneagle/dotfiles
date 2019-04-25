#!/bin/bash

if [ -f ~/.config/conky/song ]; then
	echo ""
else
	touch song
fi

url="$(sp metadata | grep artUrl | cut -d'|' -f2)"
oldUrl="$(cat ~/.config/conky/song)"

if ! grep -Fxq "$url" ~/.config/conky/song; then
	rm -rf ~/.config/conky/album.JPEG
	wget --max-redirect=5 $url -O ~/.config/conky/album.JPEG
fi

echo $url > ~/.config/conky/song
