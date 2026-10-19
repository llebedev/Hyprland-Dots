-- ============================================================================
--  Animations
--  https://wiki.hypr.land/configuring/core/animations/
--
--  Old:  bezier = name,x0,y0,x1,y1
--        animation = leaf, enabled, speed, curve, style
--  New:  hl.curve(name, { type = "bezier", points = { {x0,y0}, {x1,y1} } })
--        hl.animation({ leaf=, enabled=, speed=, bezier=, style= })
--
--  The field is `bezier` (or `spring`), NOT `curve`. The wiki's syntax line
--  says `curve = string`, but the parser in 0.56.2 only accepts `bezier` or
--  `spring` and errors out otherwise. See KNOWN-ISSUES.md #5.
-- ============================================================================

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1.00 }, { 0.32, 1.00 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1.00 } } })
hl.curve("linear",         { type = "bezier", points = { { 0.00, 0.00 }, { 1.00, 1.00 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.50, 0.50 }, { 0.75, 1.00 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0.00 }, { 0.10, 1.00 } } })
hl.curve("opens",          { type = "bezier", points = { { 0.51, 0.23 }, { 0.00, 0.79 } } })
hl.curve("windowsMoves",   { type = "bezier", points = { { 0.48, 0.42 }, { 0.80, 0.08 } } })

-- Dropped: `easeInExpo`. It was declared in the old config and never used by
-- any animation line. Re-add it here if you want it.

-- --- Window animations -------------------------------------------------------
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "easeInOutCubic" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 2.9,  bezier = "opens", style = "popin 55%" })

-- CHANGED: the old config used `slidefade 30%` on windowsOut.
-- `slidefade` is a *workspace* style. Valid window styles are slide, popin and
-- gnomed. hyprlang silently ignored the mismatch; Lua validates the style and
-- throws a config error. See KNOWN-ISSUES.md #6.
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2.49, bezier = "opens", style = "popin 70%" })

-- Was commented out in the original; left commented, now with valid syntax.
-- hl.animation({ leaf = "windowsMove", enabled = true, speed = 0.4, bezier = "windowsMoves" })

-- --- Fades -------------------------------------------------------------------
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "opens" })

-- --- Layers (waybar, wofi, notifications) ------------------------------------
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })

-- --- Workspaces --------------------------------------------------------------
-- slidefade IS valid here.
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.6,  bezier = "opens", style = "slidefade 40%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3,    bezier = "opens", style = "slidefade 40%" })

-- --- Spring curves: read this before uncommenting -----------------------------
-- Springs work, but the damping field was RENAMED between releases:
--   0.56.2 stable : `dampening`
--   git / main    : `damping`, with `dampening` still accepted as a fallback
-- So `dampening` is the spelling that works on both. The official
-- example/hyprland.lua on main uses `damping` and therefore errors out on
-- 0.56.2 — that is Hyprland discussion #16257, not a bug in these dotfiles.
--
-- hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })
-- hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
