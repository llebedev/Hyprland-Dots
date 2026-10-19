-- ============================================================================
--  Autostart
--  https://wiki.hypr.land/configuring/core/autostart/
--
--  Old:  exec-once = waybar & hyprpaper & dunst
--  New:  hl.on("hyprland.start", function() ... end)
--
--  CRITICAL: use hl.exec_cmd() here, NOT hl.dsp.exec_cmd().
--  hl.dsp.* only *builds* a dispatcher table; outside of hl.bind() nothing
--  ever executes it, so your bar and daemons silently never start. This is
--  the single most common Lua-migration failure. See KNOWN-ISSUES.md #8.
--
--  hl.exec_cmd spawns asynchronously, so no trailing `&` or `disown`.
-- ============================================================================

local p = require("conf.programs")

hl.on("hyprland.start", function()
    hl.exec_cmd(p.bar)
    hl.exec_cmd(p.wallpaper)
    hl.exec_cmd(p.notifier)

    -- Blue light filter. Config in hyprsunset.conf.
    hl.exec_cmd("hyprsunset")

    -- Uncomment what you actually use:
    -- hl.exec_cmd("nm-applet --indicator")
    -- hl.exec_cmd("blueman-applet")
    -- hl.exec_cmd("hypridle")

    -- NOTE: waybar/modules.json defines a `custom/swaync` module, but the
    -- notifier started above is dunst. Pick one. If you want swaync, set
    -- M.notifier = "swaync" in conf/programs.lua; if you want dunst, drop
    -- "custom/swaync" from waybar/config.jsonc or the module renders dead.
end)

-- Clean shutdown hook, in case you add anything that needs saving.
-- hl.on("hyprland.shutdown", function()
--     hl.exec_cmd("...")
-- end)
