-- ============================================================================
--  Programs
--  Plain Lua module: returns a table, so other modules can `require` it.
--  This replaces the old `$terminal = kitty` hyprlang variables.
-- ============================================================================

local M = {}

M.mainMod      = "SUPER"
M.terminal     = "kitty"
M.fileManager  = "thunar"

-- wofi's own config already sets `show=drun`, so passing --show drun here is
-- redundant but harmless, and it keeps the bind working if wofi's config is
-- ever removed.
M.menu         = "wofi --show drun"

M.screenshot   = "hyprshot -m region --clipboard-only"

-- Reuse these in conf/autostart.lua so there is exactly one source of truth.
M.bar          = "waybar"
M.wallpaper    = "hyprpaper"
M.notifier     = "dunst"

return M
