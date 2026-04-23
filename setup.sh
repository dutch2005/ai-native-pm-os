#!/bin/bash
# AI-Native PM OS — New Student Setup
# Run once: bash setup.sh
# Flags: --no-server   skip launching the web UI (used by install.sh)

set -e

NO_SERVER=false
for arg in "$@"; do
  [ "$arg" = "--no-server" ] && NO_SERVER=true
done

COURSE_DIR="$(cd "$(dirname "$0")" && pwd)"
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  AI-Native PM OS — Course Setup${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

cd "$COURSE_DIR"

# ── 1. Check Claude Code ──────────────────────────────────
echo "Checking Claude Code..."
if ! command -v claude &>/dev/null; then
  echo -e "${YELLOW}  ⚠ Claude Code not found.${NC}"
  echo "  Install it from: https://claude.ai/code"
  echo "  Then re-run this script."
  exit 1
fi
echo -e "${GREEN}  ✓ Claude Code found${NC}"

# ── 2. Check Python 3 ────────────────────────────────────
echo "Checking Python..."
if command -v python3 &>/dev/null; then
  PYTHON=python3
elif command -v python &>/dev/null && python --version 2>&1 | grep -q "Python 3"; then
  PYTHON=python
else
  echo -e "${YELLOW}  ⚠ Python 3 not found. The course UI requires Python 3.${NC}"
  echo "  Install it from: https://python.org/downloads"
  echo "  Then re-run this script."
  exit 1
fi
echo -e "${GREEN}  ✓ Python 3 found ($($PYTHON --version))${NC}"

# ── 3. Set course mode ───────────────────────────────────
if [ ! -f .course-mode ]; then
  echo "student" > .course-mode
  echo -e "${GREEN}  ✓ Course mode set to: student${NC}"
else
  echo -e "${GREEN}  ✓ Course mode: $(cat .course-mode)${NC}"
fi

# ── 4. Create workspace folders ───────────────────────────
echo "Creating workspace folders..."
mkdir -p CLAUDE-OUTPUTS
mkdir -p ABOUT-ME
mkdir -p PROJECTS/meridian-os/research
mkdir -p PROJECTS/meridian-os/analytics
mkdir -p TEMPLATES
echo -e "${GREEN}  ✓ Folders created${NC}"

# ── 5. Create ABOUT-ME/CLAUDE.md if not present ──────────
if [ ! -f ABOUT-ME/CLAUDE.md ]; then
  cat > ABOUT-ME/CLAUDE.md << 'ABOUT'
# About Me

## Role
Product Manager

## Background
[Add your background here — years of experience, domain expertise, industry]

## Current Focus
[What are you working on? What problem are you solving?]

## Communication Style
[How do you like to receive information? Bullet points, narrative, examples?]

## Goals for This Course
[What do you want to build by Module 10?]
ABOUT
  echo -e "${GREEN}  ✓ ABOUT-ME/CLAUDE.md created (fill in your details)${NC}"
else
  echo -e "${GREEN}  ✓ ABOUT-ME/CLAUDE.md already exists${NC}"
fi

# ── 6. Initialize progress.json ───────────────────────────
if [ ! -f progress.json ]; then
  echo -e "${YELLOW}  ⚠ progress.json missing — regenerating...${NC}"
  $PYTHON - << 'PYEOF'
import json, pathlib
lessons = [
  "module-0/0-1-install-and-setup.md","module-0/0-2-claude-modes.md",
  "module-0/0-3-build-four-folders.md","module-0/0-4-two-core-files.md",
  "module-0/0-5-slash-commands-and-skills.md","module-0/0-6-connect-first-tool.md",
  "module-0/0-7-pm-ai-mental-model.md","module-0/0-8-token-economics.md",
  "module-1/1-1-claude-md-hierarchy.md","module-1/1-2-what-goes-in-each-layer.md",
  "module-1/1-3-claude-md-templates.md","module-1/1-4-self-improving-claude-md.md",
  "module-1/1-5-team-claude-md.md","module-2/2-1-read-write-reference-files.md",
  "module-2/2-2-learning-companion.md","module-2/2-3-sub-agents-parallel-tasks.md",
  "module-2/2-4-project-memory.md","module-2/2-5-pm-vault-organization.md",
  "module-3/3-1-prd-from-scratch.md","module-3/3-2-multi-perspective-review.md",
  "module-3/3-3-prd-to-ticket-pipeline.md","module-3/3-4-lightweight-specs.md",
  "module-3/3-5-prd-versioning.md","module-4/4-1-connecting-to-data.md",
  "module-4/4-2-narrative-analytics.md","module-4/4-3-retention-churn-analysis.md",
  "module-4/4-4-ab-test-design.md","module-4/4-5-automated-weekly-digest.md",
  "module-5/5-1-interview-synthesis.md","module-5/5-2-support-ticket-mining.md",
  "module-5/5-3-competitive-intelligence.md","module-5/5-4-jtbd-mapping.md",
  "module-5/5-5-discovery-memo.md","module-6/6-1-opportunity-sizing.md",
  "module-6/6-2-roadmap-reasoning.md","module-6/6-3-executive-narrative.md",
  "module-6/6-4-objection-simulation.md","module-6/6-5-qbr-and-strategy-docs.md",
  "module-7/7-1-what-is-mcp.md","module-7/7-2-connecting-jira.md",
  "module-7/7-3-connecting-slack.md","module-7/7-4-connecting-amplitude.md",
  "module-7/7-5-connecting-notion.md","module-7/7-6-connecting-google-workspace.md",
  "module-7/7-7-custom-mcp-servers.md","module-8/8-1-shared-team-claude-md.md",
  "module-8/8-2-decision-log.md","module-8/8-3-shared-context-design.md",
  "module-8/8-4-knowledge-map.md","module-8/8-5-vault-audit.md",
  "module-9/9-1-build-loop.md","module-9/9-2-metrics-dashboard.md",
  "module-9/9-3-research-portal.md","module-9/9-4-interactive-prototypes.md",
  "module-9/9-5-deploy-on-vercel.md","module-10/10-1-choose-capstone.md",
  "module-10/10-2a-capstone-zero-to-one.md","module-10/10-2b-capstone-scale.md",
  "module-10/10-2c-capstone-platform.md","module-10/10-3-four-mental-models.md",
  "module-10/10-4-peer-review.md","module-10/10-5-pm-ai-principles.md",
]
data = {"started": None, "current_lesson": None, "lessons": {l: False for l in lessons}}
pathlib.Path("progress.json").write_text(json.dumps(data, indent=2))
print("  progress.json created")
PYEOF
else
  echo -e "${GREEN}  ✓ progress.json already exists${NC}"
fi

# ── 7. Start the course UI ────────────────────────────────
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Setup complete!${NC}"
echo ""
echo "  Next steps:"
echo ""
echo -e "  ${YELLOW}1.${NC} Open a new terminal window and run:"
echo "       claude"
echo "     (in this directory)"
echo ""
echo -e "  ${YELLOW}2.${NC} The course UI is opening in your browser..."
echo "     If it doesn't open: http://localhost:4242"
echo ""
echo -e "  ${YELLOW}3.${NC} In Claude Code, type:  /lesson 0-1"
echo "     to start your first lesson."
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Start server (stays running until Ctrl+C)
if [ "$NO_SERVER" = false ]; then
  $PYTHON course-server.py
fi
