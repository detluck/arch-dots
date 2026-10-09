# Hyprland Keybindings Quick Reference

> Configured in [`conf/keybinding.lua`](file:///home/detluck/.config/hypr/conf/keybinding.lua)  
> Modifier Key: **`SUPER`** (Windows Key)

---

## 🚀 Applications & Launchers

| Keybinding | Command / Action | Description |
| :--- | :--- | :--- |
| **`Win + S`** | `noctalia msg panel-toggle launcher` | Open application launcher (Noctalia) |
| **`Win + A`** | `noctalia msg panel-toggle control-center` | Toggle Control Center (Noctalia) |
| **`Win + N`** | `noctalia msg panel-toggle clipboard` | Toggle Clipboard history (Noctalia) |
| **`Win + Q`** | `kitty` | Launch terminal emulator (Kitty) |
| **`Win + Return`** | `alacritty` | Launch secondary terminal (Alacritty) |
| **`Win + B`** | `firefox` | Launch web browser (Firefox) |
| **`Win + E`** | `thunar` | Launch file manager (Thunar) |
| **`Win + T`** | `Telegram` | Launch Telegram desktop |
| **`Win + V`** | `kitty -e nvim` | Launch Neovim in Kitty |
| **`Win + P`** | `python .../otp.py` | Trigger OTP typer tool |

---

## 🪟 Window Management

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Win + C`** | `close` | Close active window |
| **`Win + F`** | `fullscreen` | Toggle fullscreen mode for active window |
| **`Win + Space`** | `float` | Toggle floating / tiled mode |
| **`Win + Y`** | `pin` | Pin floating window across all workspaces |
| **`Win + X`** | `center` | Center floating window on screen |
| **`Win + M`** | `pseudo` | Toggle pseudo-tiling mode |
| **`Win + J`** | `togglesplit` | Switch layout split direction (horizontal/vertical) |

---

## 🎯 Navigation & Window Movement

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Win + ← / → / ↑ / ↓`** | Focus window | Move focus to adjacent window in direction |
| **`Win + Ctrl + ← / → / ↑ / ↓`** | Swap window | Swap active window position with neighbor |
| **`Win + Shift + ← / → / ↑ / ↓`** | Resize window | Expand / shrink active window size by 100px |
| **`Win + Mouse 272 (LMB)`** | Drag window | Move window by dragging |
| **`Win + Mouse 273 (RMB)`** | Resize window | Resize window by dragging border |

---

## 📑 Window Grouping & Tabs

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Win + G`** | Toggle group | Group / ungroup active window |
| **`Win + Tab`** | Next tab | Switch focus to next window in group |
| **`Win + Shift + Tab`** | Previous tab | Switch focus to previous window in group |

---

## 🖥️ Workspaces & Scratchpad

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Win + 1 .. 0`** | Switch workspace | Switch active view to workspace 1–10 |
| **`Win + Shift + 1 .. 0`** | Move to workspace | Send active window to workspace 1–10 |
| **`Win + U`** | Toggle Scratchpad | Show / hide special magic scratchpad |
| **`Win + Shift + U`** | Move to Scratchpad | Send active window to special scratchpad |

---

## 🔒 Session & System Controls

| Keybinding | Command / Action | Description |
| :--- | :--- | :--- |
| **`Win + L`** | `noctalia msg session lock` | Lock screen via Noctalia |
| **`Win + Escape`** | `noctalia msg panel-toggle session` | Open Noctalia session / power menu |
| **`Win + Shift + Q`** | `exit` | Exit Hyprland session |

---

## 📸 Screenshots

| Keybinding | Command | Description |
| :--- | :--- | :--- |
| **`Win + Print`** | `noctalia msg screenshot-fullscreen all` | Screenshot all monitors |
| **`Print`** | `noctalia msg screenshot-fullscreen` | Screenshot focused monitor |
| **`Alt + Print`** | `noctalia msg screenshot-region` | Interactive region screenshot (Noctalia) |

---

## 🔍 Display Zoom

| Keybinding | Action | Description |
| :--- | :--- | :--- |
| **`Win + Shift + Scroll Up`** | Zoom In | Increase screen zoom level by +0.5 |
| **`Win + Shift + Scroll Down`** | Zoom Out | Decrease screen zoom level by -0.5 |
| **`Win + Shift + Z`** | Reset Zoom | Reset screen zoom level to normal |

---

## 🔊 Hardware & Media Keys

| Keybinding | Command / Action | Description |
| :--- | :--- | :--- |
| **`XF86MonBrightnessUp`** | `brightnessctl` | Increase screen brightness by +10% |
| **`XF86MonBrightnessDown`** | `brightnessctl` | Decrease screen brightness by -10% |
| **`Win + F5`** | `ytm-volume.sh` + `noctalia` | Decrease YouTube Music volume (-5%) |
| **`Win + F6`** | `ytm-volume.sh` + `noctalia` | Increase YouTube Music volume (+5%) |
| **`Win + F8`** | `brightnessctl` + `noctalia` | Decrease keyboard backlight (-10%) |
| **`Win + F9`** | `brightnessctl` + `noctalia` | Increase keyboard backlight (+10%) |
| **`XF86AudioRaiseVolume`** | `wpctl` | Increase audio volume (+2%) |
| **`XF86AudioLowerVolume`** | `wpctl` | Decrease audio volume (-2%) |
| **`XF86AudioMute`** | `pactl` | Toggle audio mute |
| **`XF86AudioMicMute`** | `pactl` | Toggle microphone mute |
| **`XF86AudioPlay / Pause`** | `playerctl` | Play / Pause media playback |
| **`XF86AudioNext`** | `playerctl` | Skip to next track |
| **`XF86AudioPrev`** | `playerctl` | Return to previous track |
| **`Win + Alt + 1`** | `playerctl` | Return to previous track (`|<<`) |
| **`Win + Alt + 2`** | `playerctl` | Play / Pause media playback (`⏯`) |
| **`Win + Alt + 3`** | `playerctl` | Skip to next track (`>>|`) |
| **`Win + Alt + 4`** | `playerctl` | Stop media playback (`⏹`) |
