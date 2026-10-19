-- ============================================================================
--  Keybinds
--  https://wiki.hypr.land/configuring/core/binds/
--
--  Old flag suffixes map onto the flags table:
--    bind   -> {}
--    bindm  -> { mouse = true }
--    bindl  -> { locked = true }                     (works on the lock screen)
--    bindel -> { locked = true, repeating = true }   (locked + key repeat)
--
--  RULE: inside a `function() ... end` bind you must wrap dispatchers in
--  hl.dispatch(). Writing `hl.dsp.window.float()` bare just builds a table and
--  throws it away. See KNOWN-ISSUES.md #8.
--
--  RULE: bind callbacks run on the compositor event loop. Never call
--  io.popen, sleep, wl-paste or anything network-bound in one — it freezes
--  the whole desktop until it returns. Use hl.dsp.exec_cmd instead.
-- ============================================================================

local p   = require("conf.programs")
local mod = p.mainMod

-- --- Applications ------------------------------------------------------------
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(p.terminal),    { description = "Terminal" })
hl.bind(mod .. " + E",      hl.dsp.exec_cmd(p.fileManager), { description = "File manager" })
hl.bind(mod .. " + R",      hl.dsp.exec_cmd(p.menu),        { description = "App launcher" })

-- --- Window management -------------------------------------------------------
-- `killactive` is now window.close() (graceful). window.kill() is the SIGKILL.
hl.bind(mod .. " + Q", hl.dsp.window.close(),                  { description = "Close window" })
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mod .. " + P", hl.dsp.window.pseudo(),                 { description = "Toggle pseudotile" })

-- togglesplit is a dwindle layout message, not a top-level dispatcher.
-- Requires dwindle.preserve_split = true (set in conf/looks.lua).
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"),           { description = "Toggle split" })

-- Exit. hyprshutdown cleans up the session properly; hl.dsp.exit() is the
-- blunt fallback for systems that do not ship it.
hl.bind(mod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "Exit Hyprland" })

-- --- Focus -------------------------------------------------------------------
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- --- Screenshot --------------------------------------------------------------
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd(p.screenshot), { description = "Screenshot region" })

-- --- Workspaces --------------------------------------------------------------
-- Replaces twenty hand-written lines. 10 maps onto the 0 key.
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- --- Mouse -------------------------------------------------------------------
-- The `{ mouse = true }` flag is what the old `bindm` meant.
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- Media and brightness ----------------------------------------------------
-- `locked = true` keeps these alive while the screen is locked, which is the
-- entire point of the old bindl/bindel suffixes.
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- --- Scratchpad (new) --------------------------------------------------------
-- SUPER+S was unbound in the old config. toggle_special() takes the bare name;
-- window.move() needs the explicit "special:" prefix. That asymmetry is real
-- and trips people up — see KNOWN-ISSUES.md #9.
hl.bind(mod .. " + S",         hl.dsp.workspace.toggle_special("magic"),        { description = "Toggle scratchpad" })
hl.bind(mod .. " + CTRL + S",  hl.dsp.window.move({ workspace = "special:magic" }), { description = "Send to scratchpad" })
