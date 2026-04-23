# Module 0.3 — Build Your 4 Core Folders

**Time:** ~25 minutes  
**Outcome:** A structured PM workspace that Claude can navigate, write to, and reference reliably

---

## Why Folder Architecture Matters

Claude Code has access to everything in your working directory. Without structure, it either reads too much (slow, expensive) or too little (misses context).

With the right folder structure, you give Claude a clear mental map of where everything lives. You only reference the folders Claude needs for each task. Everything else stays quiet.

---

## The 4 Folders You Need

This structure is based on the principle that **Claude should only write to one folder**. Everything else is read-only context or structured input.

```
PM-OS/
├── ABOUT-ME/          ← Read-only. Your identity and context.
├── PROJECTS/          ← Read-only. One subfolder per product/initiative.
├── TEMPLATES/         ← Read-only. Reusable document structures.
└── CLAUDE-OUTPUTS/    ← Claude writes here. Everything else: never.
```

---

## Folder 1: ABOUT-ME

**Purpose:** Who you are, how you think, what you care about.  
**Claude accesses it:** To understand the person giving instructions.  
**You write to it:** When your role, priorities, or preferences change.  
**Claude never writes to it.**

Contents:
```
ABOUT-ME/
├── CLAUDE.md              ← Primary context file (built in 0.4)
├── anti-style.md          ← What Claude must never say or do
├── pm-principles.md       ← Your PM philosophy
└── current-focus.md       ← Updated weekly: what you're working on right now
```

---

## Folder 2: PROJECTS

**Purpose:** Deep context for each product, initiative, or sprint.  
**Rule:** One subfolder per project. Each subfolder has its own CLAUDE.md.  
**Claude accesses it:** When working on a specific project.  
**Claude never writes to it.**

Contents:
```
PROJECTS/
├── meridian-os/           ← Main product
│   ├── CLAUDE.md          ← Project context
│   ├── stakeholders.md
│   ├── roadmap.md
│   ├── okrs.md
│   └── research/
├── approval-routing/      ← Feature-level project
│   ├── CLAUDE.md
│   ├── prd-notes.md
│   └── user-stories.md
└── q2-enterprise-push/    ← Initiative-level project
    ├── CLAUDE.md
    └── strategy-notes.md
```

---

## Folder 3: TEMPLATES

**Purpose:** Reusable document structures that Claude uses as scaffolding.  
**Important:** Templates contain structure, not content. Blank sections Claude fills in.  
**Claude accesses it:** When asked to produce a new document of a known type.  
**Claude never writes to it.**

Contents:
```
TEMPLATES/
├── prd-template.md
├── research-synthesis-template.md
├── stakeholder-brief-template.md
├── weekly-digest-template.md
├── okr-draft-template.md
└── decision-log-template.md
```

---

## Folder 4: CLAUDE-OUTPUTS

**Purpose:** The only folder Claude writes to. All generated content lands here.  
**Benefit:** You always know where outputs are. Nothing gets scattered across your filesystem.  
**You review outputs:** Before promoting them to PROJECTS or sharing externally.

Contents:
```
CLAUDE-OUTPUTS/
├── prds/
├── research/
├── stakeholder-comms/
├── strategy-docs/
├── data-analysis/
└── drafts/
```

---

## Set It Up Now

Run this from your PM-OS root directory:

```bash
mkdir -p ABOUT-ME PROJECTS/meridian-os TEMPLATES CLAUDE-OUTPUTS/{prds,research,stakeholder-comms,strategy-docs,data-analysis,drafts}
echo "Workspace scaffolded."
```

Then verify:
```bash
ls -la
```

---

## The Read-Only Habit

A key discipline: **train yourself to only let Claude write to CLAUDE-OUTPUTS**.

Every time you ask Claude to create a document, tell it:
```
Save this to CLAUDE-OUTPUTS/prds/[filename].md
```

This keeps your context files clean and prevents Claude from accidentally overwriting a reference document.

---

## Hands-On Exercise

**Task:** Set up your workspace and verify Claude understands the structure.

1. Run the setup command above.
2. Open Claude Code: `claude`
3. Ask:
   ```
   Look at the folder structure here and tell me: where would you save a new PRD 
   draft, and where would you look for existing Meridian product context?
   ```
4. Claude should say "CLAUDE-OUTPUTS/prds" for the draft and "PROJECTS/meridian-os" for the context.

If it answers correctly — your folder structure is communicating itself to Claude through structure alone.

---

## Module Checkpoint

- [ ] All 4 folders exist in your workspace
- [ ] CLAUDE-OUTPUTS has the 6 subfolders
- [ ] PROJECTS has at least one subfolder (meridian-os)
- [ ] Claude correctly identifies where outputs go vs. where context lives

---

## Next: Module 0.4
Write your 2 core files — the files that do more for Claude than 50 prompts combined.

```
/start-m0-4
```
