-- ============================================================================
--  Permissions  (OPT-IN — not required from hyprland.lua by default)
--  https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
--
--  Requires `hyprland-guiutils` to be installed, otherwise the prompts cannot
--  be drawn and you just get denied silently.
--
--  Permission changes need a full Hyprland RESTART. `hyprctl reload` will not
--  apply them — that is deliberate, for security.
-- ============================================================================

hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

-- hl.permission accepts both the table form shown here and the positional
-- form hl.permission("binary", "type", "mode"). Both are valid in 0.56.2;
-- the table form is what the wiki documents.
--
-- Types: screencopy | plugin | keyboard | cursorpos | input-capture
-- Modes: allow | ask | deny

-- The portal is a normal app and goes through permissions too. Without this
-- rule, screensharing prompts you every single time.
hl.permission({
    binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
    type   = "screencopy",
    mode   = "allow",
})

hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm",   type = "plugin",     mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/grim",     type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(bin|local/bin)/hyprshot", type = "screencopy", mode = "allow" })

-- NixOS has no static binary paths; match the store path with a regex:
-- hl.permission({ binary = "/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim", type = "screencopy", mode = "allow" })
