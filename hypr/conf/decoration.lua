-- General window decoration

local theme = require("hyprtheme")

hl.config({
    decoration = {
        rounding = theme.hypr_rounding or 10,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        fullscreen_opacity = 1.0,
        dim_inactive = false,
        dim_strength = 0.5,

        blur = {
            enabled = true,
            size = 16,
        },
    },
})
