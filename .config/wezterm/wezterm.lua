local wezterm = require("wezterm")
return {
	color_scheme = "tokyonight_night",
	window_decorations = "RESIZE",
	font = wezterm.font("VictorMono Nerd Font", { weight = "Regular" }),
	font_size = 12.0,
	enable_scroll_bar = false,
	enable_tab_bar = false,
	audible_bell = "Disabled",

	-- Toggle fullscreen mapping (F11)
	keys = {
		{ key = "F11", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
	},
}
