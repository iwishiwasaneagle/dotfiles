#!/bin/bash

id_poly=$(xdo id -N "Polybar")
id_active_win=$(xdotool getactivewindow)
fullscreen=$(xprop -id $id_active_win | grep "FULLSCREEN")

if [ -n "$fullscreen" ]; then
	xdo hide -r $id_poly
else
	xdo show -r $id_poly
fi
