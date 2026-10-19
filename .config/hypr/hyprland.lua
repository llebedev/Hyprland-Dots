-- ============================================================================
--  Hyprland-Dots — entry point
--  Target: Hyprland 0.56.2 (stable) — also runs on git/main.
--
--  Everything lives in conf/*.lua. Each require() is its own Lua scope, so a
--  runtime error in one module does NOT abort the others. That is the whole
--  reason this config is split up — see KNOWN-ISSUES.md #1.
--
--  Load order matters: env must run before anything spawns, binds last-ish.
-- ============================================================================

require("conf.env")          -- environment variables (must be first)
require("conf.programs")     -- terminal / filemanager / launcher names
require("conf.monitors")     -- hl.monitor()
require("conf.looks")        -- general / decoration / misc / cursor / render
require("conf.animations")   -- hl.curve() + hl.animation()
require("conf.input")        -- keyboard / touchpad / gestures / per-device
require("conf.rules")        -- window + layer rules
require("conf.workspaces")   -- workspace rules
require("conf.binds")        -- keybinds
require("conf.autostart")    -- hl.on("hyprland.start", ...)

-- Permissions are opt-in and need a Hyprland RESTART (not a reload) to apply.
-- Disabled by default because they need hyprland-guiutils installed.
-- require("conf.permissions")

-- Optional: drop a conf/local.lua for machine-specific overrides. It is
-- gitignored and loaded last so it wins over everything above. pcall() keeps
-- a missing file from throwing — see KNOWN-ISSUES.md #2.
pcall(require, "conf.local")
