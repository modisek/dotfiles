#! /usr/bin/env sh

# see: https://man.sr.ht/~kennylevinsen/greetd/#how-to-set-xdg_session_typewayland

set -eu

# skip wlroots-on-RADV for now, it seems to cause Valheim to crash
# if lsmod | /usr/bin/grep -i amdgpu >/dev/null 2>&1; then
#   export AMD_VULKAN_ICD=RADV # default to RADV rather than AMDVLK
#
#   # https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/docs/env_vars.md
#   export WLR_RENDERER=vulkan
# fi
if lsmod | /usr/bin/grep -i i915 >/dev/null 2>&1; then
  # https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/docs/env_vars.md
  # fix: monitors stuck on "Requesting modeset" if plugged in after launch
  export WLR_DRM_NO_MODIFIERS=1
fi

export XDG_CURRENT_DESKTOP=sway # xdg-desktop-portal
export XDG_SESSION_DESKTOP=sway # systemd
export XDG_SESSION_TYPE=wayland # xdg/systemd

if command -v dbus-update-activation-environment >/dev/null; then
  dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
fi
if command -v systemctl >/dev/null; then
  # without this, systemd starts xdg-desktop-portal without these environment variables,
  # and the xdg-desktop-portal does not start xdg-desktop-portal-wrl as expected
  # https://github.com/emersion/xdg-desktop-portal-wlr/issues/39#issuecomment-638752975
  systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
fi

# shellcheck disable=SC2068
if command -v systemd-cat >/dev/null; then
  systemd-cat --identifier=sway sway $@
elif command -v tee >/dev/null; then
  mkdir -p ~/.local/var/log
  sway $@ 2>&1 | tee ~/.local/var/log/sway.log
else
  sway $@
fi

if command -v systemctl >/dev/null; then
  systemctl --user stop sway-session.target

  # this teardown makes it easier to switch between compositors
  unset DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
  systemctl --user unset-environment DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
fi
