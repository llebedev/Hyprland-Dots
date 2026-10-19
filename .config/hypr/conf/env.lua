-- ============================================================================
--  Environment variables
--  https://wiki.hypr.land/configuring/core/environment-variables/
-- ============================================================================

-- Cursor size. Keep XCURSOR_SIZE and HYPRCURSOR_SIZE in sync.
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ---------------------------------------------------------------------------
--  NVIDIA
-- ---------------------------------------------------------------------------
-- These four are still current and still useful on the proprietary driver.
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("NVD_BACKEND", "direct")

-- REMOVED (was in the old config, does nothing since Hyprland left wlroots):
--
--   hl.env("WLR_NO_HARDWARE_CURSORS", "1")
--   hl.env("WLR_RENDERER", "vulkan")
--
-- Hyprland runs on aquamarine now, not wlroots. Every WLR_* variable is
-- silently ignored. The cursor knob moved into the config proper and is set
-- in conf/looks.lua as cursor.no_hardware_cursors. People who leave the old
-- env var in place think they disabled hardware cursors and then wonder why
-- their framerate tanked. See KNOWN-ISSUES.md #3.

-- REMOVED: hl.env("__GL_VRR_ALLOWED", "0")
-- It fought misc.vrr, which is the thing that actually drives adaptive sync
-- under Hyprland. VRR is configured in conf/looks.lua instead.

-- ---------------------------------------------------------------------------
--  Toolkits
-- ---------------------------------------------------------------------------
-- Prefer Wayland, fall back to X11.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Electron apps (Discord, VSCode, ...) on native Wayland.
-- If Discord breaks (black window / no screenshare), launch that one app with
--   env -u ELECTRON_OZONE_PLATFORM_HINT discord
-- rather than dropping this globally. See KNOWN-ISSUES.md #12.
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
