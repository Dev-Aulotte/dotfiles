local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action

local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	window_decorations = "RESIZE",
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.7,
	},
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	color_scheme = "rose-pine-moon",
	term = "screen-256color",
	enable_tab_bar = false,

	font_size = 13,
	font = wezterm.font({ family = "FiraCode Nerd Font" }),
	bold_brightens_ansi_colors = true,
	adjust_window_size_when_changing_font_size = false,

	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "DemiBold", style = "Italic" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({ family = "JetBrainsMono Nerd Font", style = "Italic" }),
		},
	},

	use_dead_keys = false,
	scrollback_lines = 10000,
}
