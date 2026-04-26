#!/usr/bin/env bash
# check-vocabulary-drift.sh
# Scans lesson markdown (module-X/**.md) for forbidden synonyms of the
# canonical terms declared in ai-native-pm-os.speq's VOCABULARY block.
#
# Catches drift from contributors who weren't aware of the binding vocabulary
# (e.g., a lesson that says "step" or "block" instead of the project's
# canonical term).
#
# False positives are real here — some words like "outputs" are legitimate
# in generic English prose. This script ignores:
#   - the VOCABULARY tables themselves (where synonyms are listed by design)
#   - generic prose uses inside `meridian-company/` and `templates/`
#
# Exit code: 0 if no drift found, 1 otherwise.

set -e
export LC_ALL=C

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

FAIL=0

# Forbidden synonyms — narrow on purpose. Only terms that are unambiguously
# project-specific synonyms (not generic English) qualify. Words like
# "section", "week", "exercise" are too common in normal prose to flag here;
# false positives drown signal.
#
# Each line: <canonical>=<synonym1>,<synonym2>,...
# We do whole-word, case-insensitive matching.
declare -a CHECKS=(
  "Module=chapter"
  "ProgressLedger=state-file"
  "Capstone=final-project"
)

# Files to skip — they are allowed to mention forbidden synonyms because
# they are the VOCABULARY definitions themselves, or human-prose docs where
# generic English use is unavoidable.
SKIP_FILES=(
  "ai-native-pm-os.speq"
  "AGENTS.md"
  "GEMINI.md"
  "CLAUDE.md"
  "README.md"
  "docs/SPEQ-RATIONALE.md"
  "wiki/Glossary.md"
  "wiki/Why-Speq.md"
  "wiki/How-To-Update-Spec.md"
  "wiki/Multi-Agent-Support.md"
  "wiki/Architecture-Overview.md"
  "wiki/How-To-Use-Different-Agent.md"
  "wiki/Troubleshooting.md"
  "wiki/Home.md"
  ".cursor/rules/ai-native-pm-os.mdc"
)

# Build a single grep --exclude pattern.
EXCLUDE_ARGS=()
for f in "${SKIP_FILES[@]}"; do
  EXCLUDE_ARGS+=( --exclude "$(basename "$f")" )
done

# Scan lesson markdown only.
TARGET_GLOBS=(module-*/[0-9]*.md)

echo "Vocabulary drift scan"
echo "====================="

for entry in "${CHECKS[@]}"; do
  canonical="${entry%%=*}"
  synonyms_csv="${entry#*=}"
  IFS=',' read -ra synonyms <<< "$synonyms_csv"

  for syn in "${synonyms[@]}"; do
    # Whole-word, case-insensitive grep across lesson files.
    matches=$(grep -inwE -- "\\b${syn}\\b" "${TARGET_GLOBS[@]}" 2>/dev/null || true)
    if [ -n "$matches" ]; then
      echo ""
      echo "  ✗ Forbidden synonym '${syn}' (canonical: ${canonical}) found:"
      echo "$matches" | sed 's/^/      /' | head -10
      count=$(echo "$matches" | wc -l)
      if [ "$count" -gt 10 ]; then
        echo "      ... and $((count - 10)) more"
      fi
      FAIL=1
    fi
  done
done

echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "✅ No vocabulary drift in lesson markdown"
  exit 0
else
  echo "❌ Vocabulary drift found in lesson markdown"
  echo ""
  echo "Fixes:"
  echo "  - Replace each forbidden synonym with its canonical term, OR"
  echo "  - If the use is genuinely warranted (e.g., quoting external"
  echo "    terminology), add the file to SKIP_FILES in this script"
  exit 1
fi
