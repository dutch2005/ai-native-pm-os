# Module 2.5 — Organizing Your PM Vault

**Time:** ~25 minutes  
**Outcome:** A clean, navigable PM vault structure that Claude can reference without confusion

---

## The Mess That Kills Productivity

Without structure, your PM workspace becomes:
- Outputs scattered across the desktop
- Research mixed with drafts mixed with final documents
- Claude referencing outdated files because you have `prd-v1`, `prd-v2`, `prd-FINAL`, `prd-FINAL-2` all in the same folder
- No clear path for new content → you spend 3 minutes deciding where to save every file

The vault structure solves this permanently.

---

## The Complete PM Vault

```
PM-OS/                              ← Your root workspace
│
├── ABOUT-ME/                       ← WHO YOU ARE (read-only to Claude)
│   ├── CLAUDE.md                   ← Primary context file
│   ├── anti-style.md               ← Writing guardrails
│   ├── pm-principles.md            ← Your PM philosophy
│   └── current-focus.md            ← Updated weekly
│
├── PROJECTS/                       ← PRODUCT CONTEXT (read-only to Claude)
│   ├── meridian-os/                ← Main product
│   │   ├── CLAUDE.md               ← Project context
│   │   ├── stakeholders.md
│   │   ├── roadmap.md
│   │   ├── okrs.md
│   │   ├── research/
│   │   │   ├── interviews/         ← Raw interview transcripts
│   │   │   ├── support-tickets/    ← Support ticket exports
│   │   │   └── competitive/        ← Competitor research
│   │   └── analytics/              ← Raw data exports (CSV, MD)
│   │
│   └── [feature-name]/             ← Feature-level context
│       ├── CLAUDE.md
│       └── [feature notes]
│
├── TEMPLATES/                      ← DOCUMENT STRUCTURES (read-only)
│   ├── prd-template.md
│   ├── research-synthesis-template.md
│   ├── stakeholder-brief-template.md
│   ├── weekly-digest-template.md
│   ├── decision-log-template.md
│   └── supplementary-exercises.md  ← Practice exercises from reference PDFs
│
├── CLAUDE-OUTPUTS/                 ← EVERYTHING CLAUDE WRITES (write-allowed)
│   ├── prds/                       ← PRD drafts and revisions
│   ├── research/                   ← Synthesis memos, discovery docs
│   ├── data-analysis/              ← Analytics memos, digests
│   ├── stakeholder-comms/          ← Exec briefs, Slack drafts, emails
│   ├── strategy-docs/              ← One-pagers, OKR drafts, QBR docs
│   ├── drafts/                     ← Anything not yet categorized
│   └── prototypes/                 ← HTML/CSS/JS prototypes (Module 9)
│
├── .claude/                        ← CLAUDE CONFIGURATION
│   ├── commands/                   ← Slash commands
│   │   ├── meridian.md
│   │   ├── context-check.md
│   │   ├── progress.md
│   │   └── weekly-digest.md
│   └── skills/                     ← Skills
│       └── load-context/
│           └── SKILL.md
│
├── TEAM-CLAUDE.md                  ← Shared team context (Git versioned)
├── CLAUDE.md                       ← Project-level context (links to ABOUT-ME/)
├── learning.md                     ← Your running log and progress tracker
└── README.md                       ← How this workspace is organized
```

---

## The Vault Setup Script

Run this once to scaffold the full structure:

```bash
mkdir -p ABOUT-ME
mkdir -p PROJECTS/meridian-os/{research/{interviews,support-tickets,competitive},analytics}
mkdir -p PROJECTS/approval-routing
mkdir -p TEMPLATES
mkdir -p CLAUDE-OUTPUTS/{prds,research,data-analysis,stakeholder-comms,strategy-docs,drafts,prototypes}
mkdir -p .claude/{commands,skills/load-context}

echo "PM Vault structure created."
ls -la
```

---

## The Golden Rules

**Rule 1: Claude only writes to CLAUDE-OUTPUTS/**  
Never ask Claude to write to PROJECTS/ or ABOUT-ME/. Those are your source-of-truth folders. Claude reads them; you maintain them.

**Rule 2: Version with filenames, not folders**  
`approval-routing-prd-v1.md` → `approval-routing-prd-v2.md` → `approval-routing-prd-v2-post-review.md`  
Not: `prd/v1/`, `prd/v2/`, `prd/final/`

**Rule 3: Date-stamp recurring files**  
Digests, meeting notes, decision logs: always include the date.  
`digest-2025-04-21.md` — easy to sort, easy to reference by date.

**Rule 4: Reference, don't copy**  
Instead of copying content between files, tell Claude to read the source:  
`Read PROJECTS/meridian-os/stakeholders.md` — not paste it in.

**Rule 5: Archive, don't delete**  
When a PRD or research doc is superseded, move it to a `_archive/` subfolder rather than deleting. Claude can still reference historical context when needed.

---

## Adding a Vault README

Create a README that helps Claude navigate your vault:

```bash
cat > README.md << 'EOF'
# PM Vault Navigation Guide

## Folder Map
- ABOUT-ME/ → Read-only. Who I am, preferences, current focus.
- PROJECTS/ → Read-only. Product context, research, analytics.
- TEMPLATES/ → Read-only. Document structures for Claude to use.
- CLAUDE-OUTPUTS/ → Write-allowed. All generated files land here.
- .claude/ → Configuration. Slash commands and skills.

## Key Files
- ABOUT-ME/CLAUDE.md → My PM identity and output preferences
- ABOUT-ME/anti-style.md → Writing rules Claude must follow
- PROJECTS/meridian-os/CLAUDE.md → Meridian product context
- TEAM-CLAUDE.md → Shared team context (all PMs)
- learning.md → Course progress and CLAUDE.md gap log

## Rules for Claude
1. NEVER write to ABOUT-ME/ or PROJECTS/ directly
2. ALL generated files go to CLAUDE-OUTPUTS/
3. Date-stamp all recurring files (digests, meeting notes)
4. Reference files by path — don't paste content unless instructed
EOF
```

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Full vault structure exists (run the setup script)
- [ ] README.md created with navigation guide
- [ ] You can state the 5 golden rules from memory
- [ ] Claude can correctly identify where outputs go vs. where context lives when asked

---

## Module 2 Complete

You have the building blocks of your PM OS:
- ✅ File operations (read, write, synthesize)
- ✅ Learning companion and progress tracker
- ✅ Sub-agents for parallel tasks
- ✅ Memory layers understood and operational
- ✅ Vault structure organized

**Start Module 3:**
```
/start-m3-1
```

*Module 3: PRDs & Specs — the 5-stage PRD workflow that produces engineering-ready documents.*
