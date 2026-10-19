-- ============================================================================
--  Workspace rules
--  https://wiki.hypr.land/configuring/core/rules/workspace-rules/
--
--  Old:  workspace = w[tv1], gapsout:0, gapsin:0
--  New:  hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- ============================================================================

-- "Smart gaps" / "no gaps when only one window".
-- These were commented out in the old config; left commented, now in valid
-- Lua so you can just drop the leading dashes.
--
--   w[tv1] = exactly one tiled, visible window
--   f[1]   = workspace has a maximized window
--
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
--
-- hl.window_rule({
--     name        = "no-gaps-wtv1",
--     match       = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name        = "no-gaps-f1",
--     match       = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- Bind workspaces to a monitor (useful once you add a second screen):
-- hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })

-- Scratchpad used by the SUPER+S bind in conf/binds.lua.
-- Note: workspace rules take the full "special:name" form, while
-- hl.dsp.workspace.toggle_special() takes the bare name.
hl.workspace_rule({ workspace = "special:magic", gaps_out = 40 })
