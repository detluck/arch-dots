-- Animations rules

hl.config({
    animations = {
        enabled = true,
    },
})

-- Windows
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "default", style = "popin 0%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "default", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "default", style = "slide" })

-- Transitions
hl.animation({ leaf = "fadeIn", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "default" })

-- Borders
hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "default" })

-- Workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default", style = "slide" })
