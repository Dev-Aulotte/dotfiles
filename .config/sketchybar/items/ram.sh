#!/bin/bash

memory=(
	icon="﬙"
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item memory right \
	--set memory "${memory[@]}"
