-- Window rules

hl.window_rule({
    name = "opacity-terminals",
    match = { class = "(Alacritty|thunar)" },
    opacity = 0.7,
})

hl.window_rule({
    name = "communication-overlay",
    match = { class = "(Slack|org.telegram.desktop|org.pulseaudio.pavucontrol)" },
})
