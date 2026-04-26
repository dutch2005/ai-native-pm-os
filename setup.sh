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

# ── 1. Check for a supported AI coding CLI ────────────────
# Course is agent-neutral (see AGENTS.md). Any of these works.
# install.sh passes the detected agent via $AGENT_CLI; we re-detect if missing.
echo "Checking for an AI coding CLI..."
if [ -z "$AGENT_CLI" ]; then
  for cli in claude codex gemini aider cursor; do
    if command -v "$cli" &>/dev/null; then
      AGENT_CLI="$cli"
      break
    fi
  done
fi

if [ -z "$AGENT_CLI" ]; then
  echo -e "${YELLOW}  ⚠ No supported AI coding CLI found.${NC}"
  echo "  Install one of:"
  echo "    Claude Code   https://claude.ai/code               (recommended)"
  echo "    Codex CLI     https://github.com/openai/codex"
  echo "    Gemini CLI    https://github.com/google-gemini/gemini-cli"
  echo "    Aider         https://aider.chat"
  echo "    Cursor        https://cursor.com"
  echo "  Then re-run this script."
  exit 1
fi
echo -e "${GREEN}  ✓ AI CLI found: ${AGENT_CLI}${NC}"

# ── 2. Check Python 3 (optional — only needed for dashboard) ──
PYTHON=""
if command -v python3 &>/dev/null; then
  PYTHON=python3
elif command -v python &>/dev/null && python --version 2>&1 | grep -q "Python 3"; then
  PYTHON=python
fi
if [ -n "$PYTHON" ]; then
  echo -e "${GREEN}  ✓ Python 3 found — progress dashboard available${NC}"
else
  echo -e "${YELLOW}  ○ Python 3 not found — progress dashboard will be unavailable${NC}"
  echo "    (Optional. Install from https://python.org/downloads if you want it)"
fi

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

# ── 6. Initialize progress.json (pure shell — no Python needed) ──
if [ ! -f progress.json ]; then
  echo -e "${YELLOW}  ⚠ progress.json missing — regenerating...${NC}"
  cat > progress.json << 'JSON'
{
  "started": null,
  "current_lesson": null,
  "lessons": {
    "module-0/0-1-install-and-setup.md": false,
    "module-0/0-2-claude-modes.md": false,
    "module-0/0-3-build-four-folders.md": false,
    "module-0/0-4-two-core-files.md": false,
    "module-0/0-5-slash-commands-and-skills.md": false,
    "module-0/0-6-connect-first-tool.md": false,
    "module-0/0-7-pm-ai-mental-model.md": false,
    "module-0/0-8-token-economics.md": false,
    "module-1/1-1-claude-md-hierarchy.md": false,
    "module-1/1-2-what-goes-in-each-layer.md": false,
    "module-1/1-3-claude-md-templates.md": false,
    "module-1/1-4-self-improving-claude-md.md": false,
    "module-1/1-5-team-claude-md.md": false,
    "module-2/2-1-read-write-reference-files.md": false,
    "module-2/2-2-learning-companion.md": false,
    "module-2/2-3-sub-agents-parallel-tasks.md": false,
    "module-2/2-4-project-memory.md": false,
    "module-2/2-5-pm-vault-organization.md": false,
    "module-3/3-1-prd-from-scratch.md": false,
    "module-3/3-2-multi-perspective-review.md": false,
    "module-3/3-3-prd-to-ticket-pipeline.md": false,
    "module-3/3-4-lightweight-specs.md": false,
    "module-3/3-5-prd-versioning.md": false,
    "module-4/4-1-connecting-to-data.md": false,
    "module-4/4-2-narrative-analytics.md": false,
    "module-4/4-3-retention-churn-analysis.md": false,
    "module-4/4-4-ab-test-design.md": false,
    "module-4/4-5-automated-weekly-digest.md": false,
    "module-5/5-1-interview-synthesis.md": false,
    "module-5/5-2-support-ticket-mining.md": false,
    "module-5/5-3-competitive-intelligence.md": false,
    "module-5/5-4-jtbd-mapping.md": false,
    "module-5/5-5-discovery-memo.md": false,
    "module-6/6-1-opportunity-sizing.md": false,
    "module-6/6-2-roadmap-reasoning.md": false,
    "module-6/6-3-executive-narrative.md": false,
    "module-6/6-4-objection-simulation.md": false,
    "module-6/6-5-qbr-and-strategy-docs.md": false,
    "module-7/7-1-what-is-mcp.md": false,
    "module-7/7-2-connecting-jira.md": false,
    "module-7/7-3-connecting-slack.md": false,
    "module-7/7-4-connecting-amplitude.md": false,
    "module-7/7-5-connecting-notion.md": false,
    "module-7/7-6-connecting-google-workspace.md": false,
    "module-7/7-7-custom-mcp-servers.md": false,
    "module-7/7-8-additional-connectors.md": false,
    "module-8/8-1-shared-team-claude-md.md": false,
    "module-8/8-2-decision-log.md": false,
    "module-8/8-3-shared-context-design.md": false,
    "module-8/8-4-knowledge-map.md": false,
    "module-8/8-5-vault-audit.md": false,
    "module-9/9-1-build-loop.md": false,
    "module-9/9-2-metrics-dashboard.md": false,
    "module-9/9-3-research-portal.md": false,
    "module-9/9-4-interactive-prototypes.md": false,
    "module-9/9-5-deploy-on-vercel.md": false,
    "module-10/10-1-choose-capstone.md": false,
    "module-10/10-2a-capstone-zero-to-one.md": false,
    "module-10/10-2b-capstone-scale.md": false,
    "module-10/10-2c-capstone-platform.md": false,
    "module-10/10-3-four-mental-models.md": false,
    "module-10/10-4-peer-review.md": false,
    "module-10/10-5-pm-ai-principles.md": false
  }
}
JSON
  echo -e "${GREEN}  ✓ progress.json created${NC}"
else
  echo -e "${GREEN}  ✓ progress.json already exists${NC}"
fi

# ── 7. Done ───────────────────────────────────────────────
case "$AGENT_CLI" in
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
    LAUNCH_CMD="$AGENT_CLI"
    PRELOAD_NOTE=""
    FIRST_PROMPT="load lesson 0-1"
    ;;
esac

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Setup complete!${NC}"
echo ""
echo "  Next steps:"
echo ""
echo -e "  ${YELLOW}1.${NC} Run your AI CLI in this directory:"
echo "       $LAUNCH_CMD"
if [ -n "$PRELOAD_NOTE" ]; then
  echo "     $PRELOAD_NOTE"
fi
echo ""
echo -e "  ${YELLOW}2.${NC} Start your first lesson:"
echo "       $FIRST_PROMPT"
if [ "$AGENT_CLI" != "claude" ]; then
  echo ""
  echo "     (Slash commands like /lesson are Claude Code-native. In other agents,"
  echo "      use natural language — see AGENTS.md for recognized phrasings.)"
fi
echo ""
if [ -n "$PYTHON" ]; then
  echo "  Optional — open the progress dashboard (separate terminal):"
  echo "       python3 course-server.py"
  echo "     Then visit: http://localhost:4242"
  echo ""
fi
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Start server only if Python available and --no-server not passed
if [ "$NO_SERVER" = false ] && [ -n "$PYTHON" ]; then
  $PYTHON course-server.py
fi
