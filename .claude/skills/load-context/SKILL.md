---
name: load-context
description: Loads all PM context files and prepares Claude for a productive session. 
Run this skill at the start of every session instead of re-explaining your context.
---

# Load Context Skill

## Purpose
Load all relevant context for a PM work session, apply writing rules, and confirm readiness. This is the fastest way to get Claude fully briefed in under 30 seconds.

## Steps

### Step 1: Read Core Identity
Read `ABOUT-ME/CLAUDE.md` — hold the PM identity, output preferences, current focus, and stakeholder map.

If the file doesn't exist at that path, look for `CLAUDE.md` in the root directory.

### Step 2: Apply Anti-Style Rules
Read `ABOUT-ME/anti-style.md` — apply all writing rules immediately and permanently for this session.

If the file doesn't exist, skip this step and note it as missing.

### Step 3: Load Product Context
Read `PROJECTS/meridian-os/CLAUDE.md` — load product context, stakeholders, OKRs, and current sprint.

If that path doesn't exist, read `meridian-company/company-context.md` as a fallback.

### Step 4: Check Current State
If `PROJECTS/meridian-os/roadmap.md` exists — scan it and note the current active features.

## Output Format

After reading all files, respond with exactly this format:

```
Context loaded. Ready to work.

Product: [product name and one-line description]
Current focus: [from ABOUT-ME/CLAUDE.md — current sprint goal]
Active OKR: [from project CLAUDE.md — Q2 primary OKR]
Writing rules: [✅ Anti-style active | ⚠️ anti-style.md not found]
Output target: CLAUDE-OUTPUTS/

Active roadmap items: [2-3 bullets from roadmap.md if available]

Missing files: [list any files that weren't found]

What would you like to work on?
```

## Error Handling
- If ABOUT-ME/CLAUDE.md is missing: say "⚠️ ABOUT-ME/CLAUDE.md not found — complete Module 0.4 to create it"
- If project CLAUDE.md is missing: say "⚠️ No project context found — complete Module 1.2 to set it up"
- Never invent context that isn't in a file — only report what you actually read

## Notes
- Do not summarize file contents back to the user — just confirm they're loaded
- This skill should complete in under 30 seconds
- After running, Claude is fully briefed and ready to do real work immediately
