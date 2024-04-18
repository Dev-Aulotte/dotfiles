---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("reloading")

-- require("tabs").setup(config)
-- require("mouse").setup(config)
-- require("links").setup(config)
-- require("keys").setup(config)

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Colorscheme
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.8

config.term = "screen-256color"
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Fonts
config.font_size = 13
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
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
}

return config --[[@as Wezterm]]
