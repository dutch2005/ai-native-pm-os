#!/bin/bash
# AI-Native PM OS — One-liner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/vishalmdi/ai-native-pm-os/main/install.sh | bash

set -e

REPO_URL="https://github.com/vishalmdi/ai-native-pm-os.git"
ZIP_URL="https://github.com/vishalmdi/ai-native-pm-os/archive/refs/heads/main.zip"
DEFAULT_DIR="$HOME/ai-native-pm-os"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  AI-Native PM OS — Installer${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ── 1. Check for a supported AI coding CLI ───────────────
# Course is agent-neutral (see AGENTS.md). Any of these works:
DETECTED_AGENT=""
for cli in claude codex gemini aider cursor; do
  if command -v "$cli" &>/dev/null; then
    DETECTED_AGENT="$cli"
    break
  fi
done

if [ -z "$DETECTED_AGENT" ]; then
  echo -e "${RED}  ✗ No supported AI coding CLI found.${NC}"
  echo ""
  echo "  Install one of:"
  echo "    Claude Code   https://claude.ai/code               (recommended — slash commands work natively)"
  echo "    Codex CLI     https://github.com/openai/codex"
  echo "    Gemini CLI    https://github.com/google-gemini/gemini-cli"
  echo "    Aider         https://aider.chat"
  echo "    Cursor        https://cursor.com"
  echo ""
  echo "  Then re-run this installer:"
  echo "    curl -fsSL https://raw.githubusercontent.com/vishalmdi/ai-native-pm-os/main/install.sh | bash"
  exit 1
fi
echo -e "${GREEN}  ✓ AI CLI found: ${DETECTED_AGENT}${NC}"

# ── 2. Determine install directory ───────────────────────
INSTALL_DIR="$DEFAULT_DIR"
for arg in "$@"; do
  case "$arg" in
    --dir=*) INSTALL_DIR="${arg#--dir=}" ;;
  esac
done

if [ -d "$INSTALL_DIR" ]; then
  echo -e "${YELLOW}  ⚠ Directory already exists: $INSTALL_DIR${NC}"
  echo "  Use --dir=/path/to/folder to install elsewhere, or delete the existing folder."
  exit 1
fi

# ── 3. Download the course ────────────────────────────────
echo ""
if command -v git &>/dev/null; then
  echo "Downloading course (git clone)..."
  git clone "$REPO_URL" "$INSTALL_DIR" --quiet
  echo -e "${GREEN}  ✓ Downloaded${NC}"
elif command -v curl &>/dev/null && command -v unzip &>/dev/null; then
  echo "Downloading course (zip)..."
  TMP_ZIP="$(mktemp /tmp/ai-native-pm-os-XXXXXX.zip)"
  curl -fsSL "$ZIP_URL" -o "$TMP_ZIP"
  unzip -q "$TMP_ZIP" -d "$(dirname "$INSTALL_DIR")"
  mv "$(dirname "$INSTALL_DIR")/ai-native-pm-os-main" "$INSTALL_DIR"
  rm "$TMP_ZIP"
  echo -e "${GREEN}  ✓ Downloaded and extracted${NC}"
else
  echo -e "${RED}  ✗ Neither git nor curl+unzip found.${NC}"
  echo ""
  echo "  Download the course manually:"
  echo "    https://github.com/vishalmdi/ai-native-pm-os/archive/refs/heads/main.zip"
  echo "  Unzip it, then run: bash setup.sh"
  exit 1
fi

# ── 4. Run setup ──────────────────────────────────────────
echo ""
cd "$INSTALL_DIR"
AGENT_CLI="$DETECTED_AGENT" bash setup.sh --no-server

# ── 5. Final instructions ─────────────────────────────────
case "$DETECTED_AGENT" in
  claude)
    LAUNCH_CMD="claude"
    PRELOAD_NOTE=""
    FIRST_PROMPT="/lesson 0-1"
    ;;
  aider)
    LAUNCH_CMD="aider --read AGENTS.md --read ai-native-pm-os.speq"
    PRELOAD_NOTE="(Aider does not auto-discover AGENTS.md, so the launch command above pre-loads it for you.)"
    FIRST_PROMPT="load lesson 0-1"
    ;;
  *)
    LAUNCH_CMD="$DETECTED_AGENT"
    PRELOAD_NOTE=""
    FIRST_PROMPT="load lesson 0-1"
    ;;
esac

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo ""
echo "  To start the course:"
echo ""
echo -e "  ${YELLOW}1.${NC} Open the course directory:"
echo "       cd $INSTALL_DIR"
echo ""
echo -e "  ${YELLOW}2.${NC} Launch your AI CLI:"
echo "       $LAUNCH_CMD"
if [ -n "$PRELOAD_NOTE" ]; then
  echo "     $PRELOAD_NOTE"
fi
echo ""
echo -e "  ${YELLOW}3.${NC} Start your first lesson:"
echo "       $FIRST_PROMPT"
if [ "$DETECTED_AGENT" != "claude" ]; then
  echo ""
  echo "     (Slash commands like /lesson are Claude Code-native. In other agents,"
  echo "      use natural language — see AGENTS.md for recognized phrasings.)"
fi
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
