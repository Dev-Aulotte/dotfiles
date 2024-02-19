#!/bin/bash

sketchybar --add item front_app left \
	--set front_app background.color=$ACCENT_COLOR \
	icon.color=$BAR_COLOR \
	icon.font="sketchybar-app-font:Regular:16.0" \
	label.color=$BAR_COLOR \
	label.font="BlexMono Nerd Font:Regular:14.5" \
	script="$PLUGIN_DIR/front_app.sh" \
	--subscribe front_app front_app_switched
