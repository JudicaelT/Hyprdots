hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.env("HYPRCURSOR_THEME", "Notwaita-Black")
hl.env("HYPRCURSOR_SIZE", "28")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprctl setcursor Notwaita-Black 28")
    hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-Dark"]])
    hl.exec_cmd("hyprpaper -c ~/.config/hypr/hyprpaper.conf")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("ags run")
end)

-- disable borders when there's only one window on screen
hl.window_rule({
    match = { float = false, workspace = "w[tv1]s[false]" },
    border_size = 0,
})

hl.workspace_rule({ workspace = tostring("1"), persistent = true })
hl.workspace_rule({ workspace = tostring("2"), persistent = true })
hl.workspace_rule({ workspace = tostring("3"), persistent = true })
hl.workspace_rule({ workspace = tostring("4"), persistent = true })

hl.config({
    general = {
        gaps_in = 10,
        -- bottom gap is set to 0 because bar corners already provide spacing
        gaps_out = { top = 25, right = 25, bottom = 0, left = 25 },
        border_size = 2,
        col = {
            active_border = "0xfff0b97a",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 18,
        shadow = {
            enabled = true,
            range = 25,
            color = "0x33141414",
        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },

    input = {
        kb_layout = "fr",
        follow_mouse = 1,
        sensitivity = 0,
        repeat_delay = 275,
        repeat_rate = 50,
    },

    animations = {
        enabled = true,
    },
})

hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "overshot", style = "slidefadevert 20%" })

-- ============================================================================
-- KEYBINDS
-- ============================================================================

local mainMod     = "SUPER"

local terminal    = "kitty"
local fileManager = "nautilus"
local launcher    = "wofi --show drun"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(launcher))

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus with super + hjkl
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move active window with super + shift + hjkl
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces with super + [1-9] (AZERTY remap keysyms, in order 1..9)
local azertyDigits = {
    "ampersand", "eacute", "quotedbl", "apostrophe", "parenleft",
    "egrave", "minus", "underscore", "ccedilla",
}

for i, key in ipairs(azertyDigits) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Reload config
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Screenshot a region (outputs to clipboard)
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Move/resize windows with super + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys: volume, mic mute, brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Media player keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
