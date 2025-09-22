


#currently only doing fonts
FONT_NAME_DISPLAY="FiraCode Nerd Font Mono"
FONT_POINT_SIZE="${1:-12}"



# --- Clone repo (shallow) ---
TMP_DIR="${HOME}/.nerd-fonts-tmp"
echo "[1/4] Cloning Nerd Fonts repo (shallow) to: ${TMP_DIR}"
rm -rf "${TMP_DIR}"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git "${TMP_DIR}"

# --- Install only FiraCode Nerd Font ---
echo "[2/4] Installing FiraCode Nerd Font..."
pushd "${TMP_DIR}" >/dev/null
# The official installer puts fonts under ~/.local/share/fonts (no sudo needed)
bash ./install.sh FiraCode
popd >/dev/null

# Refresh font cache
echo "[3/4] Refreshing font cache..."
fc-cache -fv >/dev/null

# --- Configure GNOME Terminal profile to use the font (if GNOME Terminal is present) ---
echo "[4/4] Attempting to set GNOME Terminal font to '${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}'..."
if command -v gsettings >/dev/null 2>&1 && gsettings list-schemas | grep -q "org.gnome.Terminal.ProfilesList"; then
  PROFILE_ID_RAW="$(gsettings get org.gnome.Terminal.ProfilesList default || true)"
  if [[ -n "${PROFILE_ID_RAW}" && "${PROFILE_ID_RAW}" != "@as []" ]]; then
    PROFILE_ID="$(echo "${PROFILE_ID_RAW}" | tr -d "'")"
    PROFILE_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE_ID}/"

    # Turn off "Use system font" and set the custom font
    gsettings set "${PROFILE_PATH}" use-system-font false
    gsettings set "${PROFILE_PATH}" font "${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}"

    echo "✔ GNOME Terminal updated (profile ${PROFILE_ID})."
  else
    echo "⚠ Could not determine the default GNOME Terminal profile. Skipping font apply."
  fi

  # Optional: align the desktop monospace font
  if gsettings list-schemas | grep -q "org.gnome.desktop.interface"; then
    gsettings set org.gnome.desktop.interface monospace-font-name "${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}" || true
  fi
else
  echo "⚠ GNOME Terminal not detected (or gsettings unavailable). Skipping terminal font apply."
  echo "   You can still select '${FONT_NAME_DISPLAY}' in your terminal’s preferences."
fi

# --- Cleanup ---
rm -rf "${TMP_DIR}"

echo ""
echo "All done! If GNOME Terminal was open, restart it to see '${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}'."
echo "Tip: run this script like 'bash $(basename "$0") 13' to use a different size."

