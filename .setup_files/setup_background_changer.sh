
REPO_URL = https://github.com/HannauwLaing/BackgroundChanger.git
BIN_DIR = "$(pwd)"
REPO_DIR = BIN_DIR/background_changer


mkdir -p "$REPO_DIR"


if [ ! -d "$REPO_DIR/.git" ]; then
  echo "[BackgroundChanger] Cloning repo → $CLONE_DIR"
  git clone --depth=1 "$REPO_URL" "$REPO_DIR"
  echo "[BackgroundChanger] Running make install"
  make -C "$REPO_DIR" all
  echo "[BackgroundChanger] Done."
else
  echo "[BackgroundChanger] Already Cloned"
  echo "[BackgroundChanger] Done."
fi


