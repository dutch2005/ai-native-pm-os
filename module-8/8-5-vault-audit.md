# Module 8.5 — The Vault Audit: Preventing Digital Entropy

**Time:** ~20 minutes  
**Outcome:** An automated script and Claude routine that keeps your PM OS perfectly organized, forever

---

## The Law of Digital Entropy

Without maintenance, every folder structure eventually becomes a junk drawer.
- Draft PRDs mix with approved ones.
- Old competitor analyses clog up search results.
- `temp-notes.md` multiplies into `temp-notes-final-v2.md`.

An AI-Native PM OS relies on clean context. If you feed Claude a folder containing three conflicting versions of a roadmap, Claude will hallucinate.

This module builds the self-cleaning mechanism.

---

## The Audit Script

Create an executable bash script that enforces the Golden Rules from Module 2.5.

> **Note:** This script assumes the standard PM OS folder structure (`CLAUDE-OUTPUTS/prds/`, `CLAUDE-OUTPUTS/prototypes/`, `PROJECTS/meridian-os/`). If you haven't created these yet, run `setup.sh` first or create them manually:
> ```bash
> mkdir -p CLAUDE-OUTPUTS/prds CLAUDE-OUTPUTS/prototypes CLAUDE-OUTPUTS/data-analysis PROJECTS/meridian-os
> ```

```bash
cat > vault-audit.sh << 'EOF'
#!/bin/bash
# Meridian PM OS — Vault Audit Script

echo "🔍 Starting Vault Audit..."
echo "--------------------------"

# Ensure expected folders exist before scanning
mkdir -p CLAUDE-OUTPUTS/prds CLAUDE-OUTPUTS/prototypes

# 1. Check for outputs outside CLAUDE-OUTPUTS
ROOT_MD_FILES=$(find . -maxdepth 1 -name "*.md" | grep -v "README.md\|decision-log.md")
if [ ! -z "$ROOT_MD_FILES" ]; then
  echo "⚠️ WARNING: Found markdown files in root directory. These belong in CLAUDE-OUTPUTS/ or PROJECTS/"
  echo "$ROOT_MD_FILES"
  echo ""
fi

# 2. Check for un-archived v1 PRDs when v2 exists
echo "📁 Checking PRD versioning..."
ACTIVE_PRDS=$(ls CLAUDE-OUTPUTS/prds/ 2>/dev/null | grep -v "_archive")
if [ ! -z "$ACTIVE_PRDS" ]; then
  echo "$ACTIVE_PRDS" | awk -F'-v' '{print $1}' | sort | uniq -d > /tmp/duplicate_prefixes.txt
  if [ -s /tmp/duplicate_prefixes.txt ]; then
    echo "⚠️ WARNING: Found multiple versions of the same PRD in active folder. Move older versions to _archive/."
    cat /tmp/duplicate_prefixes.txt
    echo ""
  fi
  rm /tmp/duplicate_prefixes.txt
fi

# 3. Check CLAUDE.md presence
if [ ! -f "PROJECTS/meridian-os/CLAUDE.md" ]; then
  echo "❌ CRITICAL: PROJECTS/meridian-os/CLAUDE.md is missing!"
else
  echo "✅ Core context (CLAUDE.md) present."
fi

# 4. Find stale files (older than 90 days in prototypes folder)
echo "🧹 Checking for stale temporary files..."
STALE_FILES=$(find CLAUDE-OUTPUTS/prototypes -type f -mtime +90 2>/dev/null)
if [ ! -z "$STALE_FILES" ]; then
  echo "⚠️ Suggestion: You have prototypes older than 90 days. Consider deleting:"
  echo "$STALE_FILES"
fi

echo "--------------------------"
echo "🏁 Audit Complete."
EOF

# Make it executable
chmod +x vault-audit.sh
echo "Vault audit script created."
```

---

## Running the Audit with Claude

You don't need to run the bash script manually. Tell Claude to do it and fix the issues:

```
Run the ./vault-audit.sh script.

Review the output. For any warnings or errors found:
1. Move any misfiled documents to their correct folders in CLAUDE-OUTPUTS/
2. Move superseded PRDs to CLAUDE-OUTPUTS/prds/_archive/
3. Summarize the actions you took.
```

---

## The "End of Month" Cowork Routine

Schedule this cleanup in Claude Cowork Dispatch so it happens automatically:

```
In Claude Desktop → Cowork:

Create a recurring task: "Monthly Vault Cleanup"
Schedule: The last Friday of every month at 4 PM

Instructions:
1. Run ./vault-audit.sh
2. Fix any organizational errors (move files, archive old PRDs)
3. Read the decision-log.md and generate a "Monthly Decisions Digest" 
4. Read the CLAUDE-OUTPUTS/research/ folder and summarize the top 3 insights from the month
5. Post the digest and insights to my personal #pm-notes Slack channel
```

---

## Archiving a Complete Project

When a major epic or project ships, you don't delete the folder — you freeze it.

```
I am closing out the Approval Routing Q2 Epic. It has shipped.

1. Create a folder: PROJECTS/_archived_projects/approval-routing-q2/
2. Move the relevant PRDs, design context, and research briefs into this folder.
3. Generate a "Project Post-Mortem & Index" file in the root of the archive folder that links to the final PRD, the decision log entries, and the final sprint velocity report.
```

This keeps your active `PROJECTS/` folder focused only on what is currently in flight, while preserving the history for when someone asks a question 6 months later.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] `vault-audit.sh` script created and made executable
- [ ] Script run successfully (manually or via Claude)
- [ ] Monthly Vault Cleanup routine set up in Cowork
- [ ] You understand the difference between active context and frozen archives

---

## Module 8 Complete ✅

You now have a scalable PM organizational system:
- 8-1: Shared CLAUDE.md Architecture (cross-team context)
- 8-2: The Decision Log (ADR formatting)
- 8-3: Shared Context (PM/Design translation)
- 8-4: Knowledge Map (Informal org routing)
- 8-5: Vault Audit (Automated self-cleaning)

**Start Module 9:**
```
/start-m9-1
```

*Module 9: UI Prototyping — replacing wireframes with working, deployable code.*
