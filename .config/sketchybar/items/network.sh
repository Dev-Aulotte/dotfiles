#!/bin/bash

network_down=(
	y_offset=-7
	label.font="0xProto Nerd Font:Semibold:12"
	label.color="$WHITE"
	icon=""
	icon.font="0xProto Nerd Font:Semibold:15.0"
	icon.color="$WHITE"
	icon.highlight_color="$ACCENT_COLOR"
	update_freq=1
)

network_up=(
	background.padding_right=-70
	y_offset=7
	label.font="0xProto Nerd Font:Semibold:12"
	label.color="$WHITE"
	icon=""
	icon.font="0xProto Nerd Font:Semibold:15.0"
	icon.color="$GREEN"
	icon.highlight_color="$ACCENT_COLOR"
	update_freq=1
	script="$PLUGIN_DIR/stats/scripts/network.sh"
)

sketchybar --add item network.down right \
	--set network.down "${network_down[@]}" \
	--add item network.up right \
	--set network.up "${network_up[@]}"
