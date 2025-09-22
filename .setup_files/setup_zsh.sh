


#currently only doing fonts
FONT_NAME_DISPLAY="FiraCode Nerd Font Mono"
FONT_POINT_SIZE="12"



# --- Clone repo (shallow) ---
TMP_DIR="${HOME}/.nerd-fonts-tmp"
echo "[1/4] Cloning Nerd Fonts repo (shallow) to: ${TMP_DIR}"
rm -rf "${TMP_DIR}"
TMP_DIR="$(mktemp -d)"
ZIP_PATH="${TMP_DIR}/FiraCode.zip"
curl -fL "${FONT_DL_URL}" -o "${ZIP_PATH}"


echo "[2/4] Installing to ~/.local/share/fonts ..."
FONT_DIR="${HOME}/.local/share/fonts"
mkdir -p "${FONT_DIR}"
unzip -o -q "${ZIP_PATH}" -d "${FONT_DIR}"


# Clean up non-TTF/OTF (keep .ttf/.otf only)
find "${FONT_DIR}" -type f ! -name "*.ttf" ! -name "*.otf" -delete || true

# Refresh font cache
fc-cache -fv >/dev/null


echo "[4/4] Setting GNOME Terminal font to '${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}'..."
if command -v gsettings >/dev/null 2>&1 && gsettings list-schemas | grep -q "org.gnome.Terminal.ProfilesList"; then
  PROFILE_ID_RAW="$(gsettings get org.gnome.Terminal.ProfilesList default || true)"
  if [[ -n "${PROFILE_ID_RAW}" && "${PROFILE_ID_RAW}" != "@as []" ]]; then
    PROFILE_ID="$(echo "${PROFILE_ID_RAW}" | tr -d "'")"
    PROFILE_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE_ID}/"

    gsettings set "${PROFILE_PATH}" use-system-font false
    gsettings set "${PROFILE_PATH}" font "${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}"
    echo "✔ GNOME Terminal updated (profile ${PROFILE_ID})."
  else
    echo "⚠ Could not determine the default GNOME Terminal profile. Skipping font apply."
  fi

  # Optional: align desktop monospace font
  if gsettings list-schemas | grep -q "org.gnome.desktop.interface"; then
    gsettings set org.gnome.desktop.interface monospace-font-name "${FONT_NAME_DISPLAY} ${FONT_POINT_SIZE}" || true
  fi
else
  echo "⚠ GNOME Terminal not detected (or gsettings unavailable). Skipping terminal font apply."
fi

rm -rf "${TMP_DIR}"
echo "Done. Restart GNOME Terminal if it was open."

