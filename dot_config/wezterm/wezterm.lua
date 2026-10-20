local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ============================================================
-- Window
-- ============================================================

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.window_decorations = "NONE"

config.window_background_opacity = 1

-- Fullscreen on startup
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

-- ============================================================
-- Font
-- ============================================================

config.font = wezterm.font("JetBrains Mono")
config.font_size = 18

config.cell_width = 0.9

-- ============================================================
-- Cursor
-- ============================================================

config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
config.animation_fps = 1

-- ============================================================
-- Colors
-- ============================================================

config.colors = {
	-- Ghostty:
	-- background = #000000
	-- foreground = #bebebe

	background = "#000000",
	foreground = "#bebebe",

	-- Ghostty cursor-color = #e55812
	cursor_bg = "#e55812",
	cursor_border = "#e55812",
	cursor_fg = "#000000",

	-- Ghostty selection
	selection_bg = "#8a8a8d",
	selection_fg = "#000000",

	-- ANSI palette
	ansi = {
		"#333333", -- 0 black
		"#e19e74", -- 1 red
		"#FFC107", -- 2 green
		"#c6c4b0", -- 3 yellow
		"#e68e0d", -- 4 blue
		"#8a8575", -- 5 magenta
		"#bebebe", -- 6 cyan
		"#bebebe", -- 7 white
	},

	-- Bright ANSI palette
	brights = {
		"#8a8a8d", -- 8 bright black
		"#984b1e", -- 9 bright red
		"#FFC107", -- 10 bright green
		"#8f4445", -- 11 bright yellow
		"#f59e0b", -- 12 bright blue
		"#b3adad", -- 13 bright magenta
		"#eaeaea", -- 14 bright cyan
		"#ffffff", -- 15 bright white
	},

	-- ========================================================
	-- Tab bar
	-- ========================================================

	tab_bar = {
		background = "#000000",

		active_tab = {
			bg_color = "#000000",
			fg_color = "#ffffff",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		inactive_tab = {
			bg_color = "#000000",
			fg_color = "#8a8a8d",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			bg_color = "#000000",
			fg_color = "#bebebe",
		},
	},
}

-- ============================================================
-- Tab bar
-- ============================================================

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_max_width = 30

-- ============================================================
-- Right/Left status
-- ============================================================

wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#ffffff" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a)
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = {
			Foreground = {
				Color = "#000000",
			},
		}
	end

	window:set_left_status(wezterm.format({
		{
			Background = {
				Color = "#000000",
			},
		},
		{
			Text = prefix,
		},
		ARROW_FOREGROUND,
		{
			Text = SOLID_LEFT_ARROW,
		},
	}))
end)

-- ============================================================
-- General
-- ============================================================

config.initial_rows = 24
config.max_fps = 144

config.term = "xterm-256color"

config.prefer_egl = false
config.front_end = "OpenGL"

config.audible_bell = "Disabled"
config.check_for_updates = false

-- ============================================================
-- Leader / tmux-style bindings
-- ============================================================

config.leader = {
	key = "j",
	mods = "ALT",
}

config.disable_default_key_bindings = true

config.keys = {
	-- ========================================================
	-- Pane management
	-- ========================================================

	-- Focus current pane fullscreen
	{
		key = "f",
		mods = "LEADER",
		action = "TogglePaneZoomState",
	},

	-- Vertical split
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({
			SplitVertical = {
				domain = "CurrentPaneDomain",
			},
		}),
	},

	-- Horizontal split
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action({
			SplitHorizontal = {
				domain = "CurrentPaneDomain",
			},
		}),
	},

	-- ========================================================
	-- Tabs
	-- ========================================================

	-- New tab
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action({
			SpawnTab = "CurrentPaneDomain",
		}),
	},

	-- ========================================================
	-- Pane navigation
	-- ========================================================

	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Left",
		}),
	},

	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Down",
		}),
	},

	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Up",
		}),
	},

	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action({
			ActivatePaneDirection = "Right",
		}),
	},

	-- ========================================================
	-- Pane resizing
	-- ========================================================

	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			AdjustPaneSize = {
				"Left",
				5,
			},
		}),
	},

	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			AdjustPaneSize = {
				"Down",
				5,
			},
		}),
	},

	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			AdjustPaneSize = {
				"Up",
				5,
			},
		}),
	},

	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = wezterm.action({
			AdjustPaneSize = {
				"Right",
				5,
			},
		}),
	},

	-- ========================================================
	-- Closing
	-- ========================================================

	-- Close current tab
	{
		key = "?",
		mods = "SHIFT|CTRL",
		action = wezterm.action({
			CloseCurrentTab = {
				confirm = true,
			},
		}),
	},

	-- Close current pane
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action({
			CloseCurrentPane = {
				confirm = true,
			},
		}),
	},

	-- ========================================================
	-- Fullscreen
	-- ========================================================

	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = "ToggleFullScreen",
	},

	-- ========================================================
	-- Clipboard
	-- ========================================================

	-- Copy mode
	{
		key = "y",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},

	-- Copy
	{
		key = "y",
		mods = "CTRL",
		action = wezterm.action.CopyTo("Clipboard"),
	},

	-- Paste
	{
		key = "p",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	-- ========================================================
	-- Font size
	-- ========================================================

	{
		key = "i",
		mods = "SHIFT|CTRL",
		action = "IncreaseFontSize",
	},

	{
		key = "u",
		mods = "SHIFT|CTRL",
		action = "DecreaseFontSize",
	},

	{
		key = "o",
		mods = "SHIFT|CTRL",
		action = "ResetFontSize",
	},

	-- ========================================================
	-- Toggle tab bar
	-- ========================================================

	{
		key = "u",
		mods = "LEADER",
		action = wezterm.action.EmitEvent("toggle-tabbar"),
	},
}

-- ============================================================
-- Toggle tab bar
-- ============================================================

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}

	if overrides.enable_tab_bar == nil then
		overrides.enable_tab_bar = true
	end

	overrides.enable_tab_bar = not overrides.enable_tab_bar

	window:set_config_overrides(overrides)
end)

-- ============================================================
-- Leader + number = tab selection
-- ============================================================

for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

return config
