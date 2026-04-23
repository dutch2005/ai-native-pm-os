#!/bin/bash
# AI-Native PM OS — One-liner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/vishalmdi/ai-native-pm-os/main/install.sh | bash

set -e

REPO_URL="https://github.com/vishalmdi/ai-native-pm-os.git"
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

# ── 1. Check git ──────────────────────────────────────────
if ! command -v git &>/dev/null; then
  echo -e "${RED}  ✗ git not found.${NC}"
  echo "  Install git from: https://git-scm.com"
  exit 1
fi
echo -e "${GREEN}  ✓ git found${NC}"

# ── 2. Check Claude Code ──────────────────────────────────
if ! command -v claude &>/dev/null; then
  echo -e "${RED}  ✗ Claude Code not found.${NC}"
  echo ""
  echo "  Claude Code is required. Install it first:"
  echo "    https://claude.ai/code"
  echo ""
  echo "  Then re-run this installer:"
  echo "    curl -fsSL https://raw.githubusercontent.com/vishalmdi/ai-native-pm-os/main/install.sh | bash"
  exit 1
fi
echo -e "${GREEN}  ✓ Claude Code found${NC}"

# ── 3. Check Python 3 ─────────────────────────────────────
if command -v python3 &>/dev/null; then
  PYTHON=python3
elif command -v python &>/dev/null && python --version 2>&1 | grep -q "Python 3"; then
  PYTHON=python
else
  echo -e "${RED}  ✗ Python 3 not found.${NC}"
  echo "  Install Python 3 from: https://python.org/downloads"
  echo "  Then re-run this installer."
  exit 1
fi
echo -e "${GREEN}  ✓ Python 3 found${NC}"

# ── 4. Determine install directory ───────────────────────
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

# ── 5. Clone the repo ─────────────────────────────────────
echo ""
echo "Cloning course into: $INSTALL_DIR"
git clone "$REPO_URL" "$INSTALL_DIR"
echo -e "${GREEN}  ✓ Cloned${NC}"

# ── 6. Run setup ──────────────────────────────────────────
echo ""
cd "$INSTALL_DIR"
bash setup.sh --no-server

# ── 7. Final instructions ─────────────────────────────────
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo ""
echo "  To start the course:"
echo ""
echo -e "  ${YELLOW}1.${NC} Open the course directory:"
echo "       cd $INSTALL_DIR"
echo ""
echo -e "  ${YELLOW}2.${NC} Launch Claude Code:"
echo "       claude"
echo ""
echo -e "  ${YELLOW}3.${NC} In Claude Code, type your first lesson:"
echo "       /lesson 0-1"
echo ""
echo "  Optional — open the progress dashboard in a separate terminal:"
echo "       python3 course-server.py"
echo "     Then visit: http://localhost:4242"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
