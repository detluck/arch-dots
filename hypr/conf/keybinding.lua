-- Key bindings

local mainMod = "SUPER"

-- Core functionality
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())

-- Toggle waybar
-- hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(os.getenv("HOME") .. "/bin/toggle_waybar.sh"))

-- Random wallpaper
-- hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(os.getenv("HOME") .. "/bin/random_wallpaper.sh"))

-- Screen lock & Session Menu
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))

-- Power menu
-- hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(os.getenv("HOME") .. "/bin/power_menu.sh"))

-- Screenshots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen all"))
hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"))

-- Applications
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("python /home/detluck/.local/bin/otp-typer/otp.py uni-otp"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("kitty -e nvim"))

-- Display zoom
hl.bind(
	mainMod .. " + SHIFT + mouse_down",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}")]]
	)
)
hl.bind(
	mainMod .. " + SHIFT + mouse_up",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}")]]
	)
)
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 0"))

-- Windows management
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Y", hl.dsp.window.pin())
hl.bind(mainMod .. " + X", hl.dsp.window.center())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + M", hl.dsp.window.pseudo())

-- Scratchpad / Special Workspace
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move focus with the keyboard
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Swap windows with keyboard
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.swap({ direction = "down" }))

-- Window grouping
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev())

-- Move and resize windows with the mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize windows
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_raw("resizeactive", "100 0"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_raw("resizeactive", "-100 0"))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_raw("resizeactive", "0 100"))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_raw("resizeactive", "0 -100"))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q s +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 10%-"))
-- YouTube Music Volume (isolated PipeWire stream + Noctalia OSD)
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("/home/detluck/.local/bin/ytm-volume.sh down"), { repeating = true, locked = true })
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("/home/detluck/.local/bin/ytm-volume.sh up"), { repeating = true, locked = true })

-- Keyboard backlight
hl.bind(
	mainMod .. " + F8",
	hl.dsp.exec_cmd("bash -c 'val=$(brightnessctl -d rgb:kbd_backlight s 10%- -m | cut -d, -f4 | tr -d \"%\"); noctalia msg keyboard-backlight-osd \"$val\"'"),
	{ repeating = true }
)
hl.bind(
	mainMod .. " + F9",
	hl.dsp.exec_cmd("bash -c 'val=$(brightnessctl -d rgb:kbd_backlight s 10%+ -m | cut -d, -f4 | tr -d \"%\"); noctalia msg keyboard-backlight-osd \"$val\"'"),
	{ repeating = true }
)

-- Audio
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)

-- Media keys
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Media player controls (Option 1)
hl.bind(mainMod .. " + ALT + 1", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + ALT + 2", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + ALT + 3", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mainMod .. " + ALT + 4", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
