local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function create_mapping_key(mods, key)
	return mods .. " " .. key
end

local function create_mappings(current_mappings)
	local result = {}
	local seen = {}

	local all_characters = [[`1234567890-=qwetyuiop[]\asdfghjkl;'zxcvbnm,./]]
	local characters = {}

	for i = 1, #all_characters do
		table.insert(characters, all_characters:sub(i, i))
	end

	-- copy current_mappings into result
	for _, mapping in ipairs(current_mappings) do
		table.insert(result, mapping)

		seen[create_mapping_key(mapping.mods, mapping.key:lower())] = true
	end

	-- Remap CMD to ALT inside wezterm
	for _, key in ipairs(characters) do
		for _, mods in ipairs({ "CMD", "CMD|SHIFT" }) do
			local combo = create_mapping_key(mods, key)

			if not seen[combo] then
				seen[combo] = true

				table.insert(result, {
					key = key,
					mods = mods,
					action = wezterm.action.SendKey({ key = key, mods = mods:gsub("CMD", "ALT") }),
				})
			end
		end
	end

	return result
end

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

config.keys = create_mappings({
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "l",
		mods = "CMD|CTRL",
		action = wezterm.action.ShowDebugOverlay,
	},
})

return config
