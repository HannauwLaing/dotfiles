#!/usr/bin/env bash
set -euo pipefail

# Find a "Mains/AC" power supply entry (varies by hardware: AC, ACAD, ADP1, etc.)
AC_ONLINE_FILE="sys/class/power_supply/ADP1/online"

if [[ -z "${AC_ONLINE_FILE:-}" ]]; then
  echo "Could not find AC online status file under /sys/class/power_supply/" >&2
  exit 1
fi

apply_profile() {
  if on_ac_power; then
    powerprofilesctl set performance || true
  else
    powerprofilesctl set power-saver || true
  fi
}

# Apply once at start
apply_profile

# Loop and wait for changes
while true; do
  # Wait until the AC online file changes, then re-apply
  inotifywait -q -e modify "$AC_ONLINE_FILE" >/dev/null 2>&1 || true
  sleep 30
  apply_profile
done
