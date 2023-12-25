local wezterm = require("wezterm")
return {
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 0.95,
	macos_window_background_blur = 30,
	window_decorations = "RESIZE",
	font = wezterm.font("BlexMono Nerd Font", { weight = "Regular" }),
	font_size = 12.0,
	enable_scroll_bar = false,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	disable_default_key_bindings = true,

	-- Toggle fullscreen mapping (F11)
	keys = {
		{ key = "F11", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
	},
}
