-- ============================================================================
--  Monitors
--  https://wiki.hypr.land/configuring/core/monitors/
--
--  Old syntax was:  monitor=DP-1,1920x1080@165,auto,1
-- ============================================================================

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@165",
    position = "auto",
    scale    = 1,
})

-- Fallback for every monitor without an explicit rule above.
-- The old config had no fallback: plug in a second screen, or boot on a
-- machine where the primary is HDMI-A-1 instead of DP-1, and that output got
-- no rule at all. An empty `output` is the wildcard.
--
-- "highrr" picks the highest refresh rate the panel advertises, so these
-- dotfiles behave on a 60 Hz laptop panel and a 165 Hz desktop alike.
hl.monitor({
    output   = "",
    mode     = "highrr",
    position = "auto",
    scale    = "auto",
})
