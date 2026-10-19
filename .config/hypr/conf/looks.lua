-- ============================================================================
--  Look and feel
--  https://wiki.hypr.land/configuring/core/config-options/
-- ============================================================================

hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 10,

        border_size = 0,

        col = {
            -- Gradients are tables now, not "rgba() rgba() 45deg" strings.
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,

        -- Master switch for tearing. The per-game `immediate` rule lives in
        -- conf/rules.lua. https://wiki.hypr.land/configuring/extra/tearing/
        allow_tearing = true,

        layout = "dwindle",

        snap = {
            enabled      = true,
            window_gap   = 4,
            monitor_gap  = 5,
            respect_gaps = true,
        },
    },

    decoration = {
        rounding       = 18,
        rounding_power = 4,

        active_opacity   = 0.8,
        inactive_opacity = 0.7,

        dim_inactive = true,
        dim_strength = 0.025,
        dim_special  = 0.07,

        shadow = {
            enabled       = false,
            range         = 20,
            offset        = { 0, 2 },
            render_power  = 4,
            color         = "rgba(1a1a1aee)",
        },

        blur = {
            enabled           = true,
            size              = 4,
            passes            = 2,
            xray              = true,
            special           = false,
            brightness        = 1.0,
            contrast          = 1.0,
            noise             = 0.04,
            popups            = true,
            input_methods     = true,
            new_optimizations = true,
            vibrancy          = 0.1696,
        },
    },

    animations = {
        -- The old config said `enabled = yes, please :)`. hyprlang accepted
        -- that joke; Lua does not. It is a boolean.
        enabled = true,
    },
})

-- ---------------------------------------------------------------------------
--  Layouts
-- ---------------------------------------------------------------------------
hl.config({
    dwindle = {
        -- `force_split` is an INT, not a bool. The old config had
        -- `force_split = true`, which is a type error in Lua and was
        -- meaningless in hyprlang too.
        --   0 = split follows the mouse
        --   1 = always split left/top
        --   2 = always split right/bottom
        force_split = 2,

        -- Strongly recommended, and required for the SUPER+J togglesplit bind
        -- to do anything at all.
        preserve_split = true,

        smart_split    = false,
        smart_resizing = false,

        -- NOTE: `dwindle.pseudotile` no longer exists as a config option.
        -- The hl.dsp.window.pseudo() dispatcher still does — see conf/binds.lua.
    },

    master = {
        new_status = "master",
    },
})

-- ---------------------------------------------------------------------------
--  Misc
-- ---------------------------------------------------------------------------
hl.config({
    misc = {
        force_default_wallpaper  = -1,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,

        enable_swallow    = false,
        middle_click_paste = false,

        render_unfocused_fps = 5,

        -- VRR. 1 = always on, which makes a lot of panels flicker in
        -- brightness because their brightness tracks the refresh rate.
        -- 2 = fullscreen only, which is what the Hyprland FAQ recommends and
        -- what you actually want for gaming. Set it back to 1 if your monitor
        -- handles it cleanly. See KNOWN-ISSUES.md #4.
        vrr = 2,
    },

    -- `vfr` moved out of misc into debug in 0.56. It defaults to true, so the
    -- old `misc { vfr = true }` line was both misplaced and redundant.
    debug = {
        vfr          = true,
        disable_logs = false,  -- false = DO write ~/.local/share/hyprland/*.log
    },

    render = {
        -- Auto triple-buffering. Helps on weaker GPUs.
        new_render_scheduling = true,
    },

    cursor = {
        -- All three are ints (0/1/2), not bools. The old config had
        -- `no_break_fs_vrr = true`, which is a type error now.
        --   0 = off, 1 = on, 2 = auto
        no_break_fs_vrr   = 2,
        no_hardware_cursors = 2,  -- auto: off normally, on when tearing
        use_cpu_buffer      = 2,  -- auto: on for NVIDIA (needed for HW cursors)
    },

    ecosystem = {
        -- Without this, Hyprland paints a donation prompt over your wallpaper
        -- twice a year and people file it as a wallpaper bug.
        no_donation_nag = true,
        no_update_news  = false,
    },
})
