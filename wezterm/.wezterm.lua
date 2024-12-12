local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function create_mapping_key(mods, key)
	return mods .. " " .. key
end

local function create_mappings(current_mappings)
	local result = {}
	local seen = {}

	local all_characters = [[`1234567890-=qwetyuiop[]\asdfghjkl;'zbnm,./]]
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

config.enable_csi_u_key_encoding = false
config.enable_kitty_keyboard = true

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

local function is_nvim(pane)
	return pane:get_user_vars().PROG == "nvim"
end

local function bind_key_to_vim(key, mods, remapped_char)
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			if is_nvim(pane) then
				win:perform_action({
					SendKey = { key = remapped_char, mods = nil },
				}, pane)
			else
				win:perform_action({
					SendKey = {
						key = key,
						mods = mods,
					},
				}, pane)
			end
		end),
	}
end

config.keys = create_mappings({
	{
		key = "l",
		mods = "CMD|CTRL",
		action = wezterm.action.ShowDebugOverlay,
	},
	bind_key_to_vim("c", "CMD", utf8.char("0xAA")),
	bind_key_to_vim("\r", "SHIFT", utf8.char("0xAB")),
})

return config
