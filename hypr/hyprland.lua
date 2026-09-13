-- Hyprland Lua Configuration
-- Converted from .conf format

-- Setup package.path to ensure local modules can be loaded via require
local config_dir = os.getenv("HOME") .. "/.config/hypr/"
package.path = config_dir .. "?.lua;" .. config_dir .. "?/init.lua;" .. package.path


----------------------------------
---- ENVIRONMENT VARIABLES -------
----------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/amd-igpu")
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Sitykha-shell
hl.env("QT_MEDIA_BACKEND", "ffmpeg")
hl.env("QT_FFMPEG_HWACCEL", "1")
hl.env("WLR_DRM_DEVICES", "/dev/dri/card1")

----------------------------------
---- XWAYLAND --------------------
----------------------------------

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

----------------------------------
---- LOAD THEMES & MODULES -------
----------------------------------

-- Load theme colors
local theme = require("hyprtheme")
local mocha = require("mocha")

-- Monitors
require("conf.monitor")

-- Cursor
require("conf.cursor")

-- Keyboard
require("conf.keyboard")

-- Autostart
require("conf.autostart")

-- Load configuration files
require("conf.decoration")
require("conf.layout")
require("conf.workspace")
require("conf.misc")
require("conf.keybinding")
require("conf.window")
require("conf.windowrule")

-- Animation
require("conf.animation")

-- For Noctalia Color templates
local noctalia_theme = require("noctalia")
noctalia_theme.apply_theme()

-- Sync Keyboard Backlight RGB to Noctalia Theme Primary Color
local function sync_keyboard_rgb()
    local primary = noctalia_theme.colors and noctalia_theme.colors.primary or ""
    local hex = primary:match("rgb%((%x+)%)")
    if hex and #hex == 6 then
        local r = tonumber(hex:sub(1, 2), 16)
        local g = tonumber(hex:sub(3, 4), 16)
        local b = tonumber(hex:sub(5, 6), 16)
        local f = io.open("/sys/devices/platform/tuxedo_keyboard/leds/rgb:kbd_backlight/multi_intensity", "w")
        if f then
            f:write(string.format("%d %d %d\n", r, g, b))
            f:close()
        end
    end
end
sync_keyboard_rgb()
