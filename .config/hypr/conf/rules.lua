-- ============================================================================
--  Window and layer rules
--  https://wiki.hypr.land/configuring/core/rules/window-rules/
--
--  `windowrule` and `windowrulev2` are both gone. There is one function now:
--  hl.window_rule({ name?, match = {...}, <effects> }).
--
--  Rules are processed top to bottom and the LAST match wins.
--  Named rules return a handle with :set_enabled(bool) / :is_enabled().
-- ============================================================================

-- Ignore maximize requests from everything. You probably want this.
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland drag-and-drop ghost windows.
-- Old prop names -> new: floating:1 -> float, pinned:0 -> pin, nofocus -> no_focus.
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- ---------------------------------------------------------------------------
--  Gaming / tearing
-- ---------------------------------------------------------------------------
-- The old config had three rules for cs2 and two of them fought each other:
--
--   windowrule   = immediate, class:^(cs2)$
--   windowrulev2 = float,     class:^(cs2)$     <- breaks tearing
--   windowrulev2 = fullscreen,class:^(cs2)$     <- contradicts float
--
-- Tearing only engages when the window is fullscreen AND the only thing on
-- the monitor. Floating it guarantees tearing never kicks in, so the
-- `immediate` rule above it was dead weight. Keeping `immediate` alone.
-- Verify with: hyprctl monitors | grep tearingBlockedBy
hl.window_rule({
    name      = "cs2-tearing",
    match     = { class = "^cs2$" },
    immediate = true,
})

-- Content type "game" lets render.direct_scanout and cursor.no_break_fs_vrr
-- do the right thing automatically in their "auto" modes.
hl.window_rule({
    name    = "cs2-content-type",
    match   = { class = "^cs2$" },
    content = "game",
})

-- ---------------------------------------------------------------------------
--  Layer rules
-- ---------------------------------------------------------------------------
-- Layers are not windows: bars, launchers and wallpapers need hl.layer_rule().
-- The old config had none, so waybar and wofi never got blur even though blur
-- was enabled globally.
hl.layer_rule({
    name  = "blur-waybar",
    match = { namespace = "waybar" },
    blur  = true,
    xray  = true,
})

hl.layer_rule({
    name         = "blur-wofi",
    match        = { namespace = "wofi" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name  = "blur-notifications",
    match = { namespace = "notifications" },
    blur  = true,
})
