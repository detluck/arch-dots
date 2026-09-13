-- General window layout and colors

local theme = require("hyprtheme")

local gaps_in = 2
local gaps_out = 2

hl.config({
    general = {
        gaps_in = gaps_in,
        gaps_out = gaps_out,
        border_size = theme.hypr_border_size or 2,
        layout = "dwindle",
        resize_on_border = true,
        col = {
            active_border = {
                colors = { theme.active_border_col_1, theme.active_border_col_2 },
                angle = theme.gradient_angle or 45,
            },
            inactive_border = theme.inactive_border_col_1,
        },
    },
})
