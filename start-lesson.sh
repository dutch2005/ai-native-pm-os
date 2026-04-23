#!/bin/bash
# start-lesson.sh [lesson-id]
# Sets the right model for the lesson, then launches Claude Code.
#
# Usage:
#   bash start-lesson.sh 0-1   → launches with Haiku
#   bash start-lesson.sh 3-1   → launches with Sonnet
#   bash start-lesson.sh       → launches with last-used model

LESSON_ID="${1:-}"
SETTINGS_FILE="$(dirname "$0")/.claude/settings.json"

# Model IDs
HAIKU="claude-haiku-4-5-20251001"
SONNET="claude-sonnet-4-6"

# Determine model from module number
if [[ -n "$LESSON_ID" ]]; then
  MODULE=$(echo "$LESSON_ID" | cut -d'-' -f1)
  case "$MODULE" in
    0|1|2|8) MODEL="$HAIKU";  MODEL_LABEL="Haiku" ;;
    *)        MODEL="$SONNET"; MODEL_LABEL="Sonnet" ;;
  esac

  # Write model to .claude/settings.json (project-level, overrides global)
  cat > "$SETTINGS_FILE" <<EOF
{
  "model": "$MODEL"
}
EOF

  echo ""
  echo "  Lesson $LESSON_ID → Model set to $MODEL_LABEL"
  echo "  Launching Claude Code..."
  echo ""
else
  echo ""
  echo "  No lesson specified — launching with current settings."
  echo "  Tip: bash start-lesson.sh 0-1"
  echo ""
fi

cd "$(dirname "$0")"
claude
