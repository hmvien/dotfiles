local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
config.exit_behavior = "CloseOnCleanExit"

config.audible_bell = "Disabled"

config.font = wezterm.font({
	family = "Monaspace Neon",
	-- family='Monaspace Argon',
	-- family='Monaspace Xenon',
	-- family='Monaspace Radon',
	-- family='Monaspace Krypton',
	weight = "Bold",
	harfbuzz_features = {
		"calt",
		"liga",
		"dlig",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"ss09",
	},
})
config.font_size = 18.0

return config
