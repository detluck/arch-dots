-- Autostart processes

hl.on("hyprland.start", function()
	-- Load Waybar Daemon (Replaced by Caelestia)
	-- hl.exec_cmd("waybar")

	-- Load Notification Daemon (Replaced by Caelestia)
	-- hl.exec_cmd("swaync")

	-- Load Idle Daemon (Replaced by Caelestia built-in idle manager)
	-- hl.exec_cmd("hypridle")

	-- Load Screenshot Daemon
	-- hl.exec_cmd("flameshot")

	-- Load Shell
	-- hl.exec_cmd("qs -c sitykha")
	hl.exec_cmd("noctalia")

	-- Load Auto Monitor Daemon
	-- hl.exec_cmd("~/.config/hypr/scripts/monitor-auto.sh")

	-- Load Random Wallpaper
	-- hl.exec_cmd("~/bin/random_wallpaper.sh")

	-- Load Wallpaper Engine
	-- hl.exec_cmd("~/bin/wallpaperengine.sh")
end)
