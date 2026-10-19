-- ============================================================================
--  Input, gestures, per-device
--  https://wiki.hypr.land/configuring/core/config-options/
-- ============================================================================

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:lalt_lshift_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,   -- -1.0 .. 1.0, 0 = untouched

        -- Keybinds stay on the first layout (us) even while you are typing in
        -- Russian. Flip to true only if you want binds to follow the symbol
        -- actually produced by the active layout.
        resolve_binds_by_sym = false,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- ---------------------------------------------------------------------------
--  Gestures
-- ---------------------------------------------------------------------------
-- Old:  gesture = 3, swipe, move,
-- The old line also had a stray trailing comma, which hyprlang tolerated.
hl.gesture({ fingers = 3, direction = "swipe", action = "move" })

-- Three-finger horizontal swipe to change workspace. This is what the old
-- `gestures:workspace_swipe` option used to do; that option no longer exists
-- and is now expressed through the gesture API. See KNOWN-ISSUES.md #7.
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

-- ---------------------------------------------------------------------------
--  Per-device
-- ---------------------------------------------------------------------------
-- The old config carried the upstream `epic-mouse-v1` placeholder, which
-- matches no real device. Removed. Get your real names from `hyprctl devices`
-- and add blocks like:
--
-- hl.device({ name = "logitech-g502-hero-gaming-mouse", sensitivity = -0.3 })
-- hl.device({ name = "my-laptop-keyboard", kb_layout = "us" })
