# Module 0.5 — Slash Commands & Skills

**Time:** ~35 minutes  
**Outcome:** Your first custom slash command + understanding of what skills are and how to build them

---

## This Is the Most Underused Feature in Claude Code

Most PMs who use Claude Code never discover slash commands or skills. They keep typing the same prompts over and over — loading the same context, setting the same stage, asking the same setup questions.

Slash commands eliminate all of that. Skills extend Claude's behavior permanently.

After this lesson, you'll stop retyping things forever.

---

## Part 1: Slash Commands

### What They Are

Slash commands are shortcuts that trigger pre-written prompts, context loads, or multi-step workflows — all with a single `/command`.

Type `/` in Claude Code and hit tab to see available commands.

### Where They Live

Slash commands live in the `.claude/commands/` folder in your workspace:

```
.claude/
└── commands/
    ├── meridian.md         ← /meridian
    ├── start-m0-1.md       ← /start-m0-1
    ├── progress.md         ← /progress
    ├── context-check.md    ← /context-check
    └── weekly-digest.md    ← /weekly-digest
```

Each file is a markdown document. When you type the slash command, Claude executes the contents of that file as an instruction.

### Anatomy of a Slash Command

```markdown
# Command: /meridian
# Purpose: Load Meridian company context and orient Claude for PM work

Read the following files and hold their context for this session:
- PROJECTS/meridian-os/CLAUDE.md
- PROJECTS/meridian-os/stakeholders.md
- PROJECTS/meridian-os/roadmap.md

Then confirm: "Meridian context loaded. I'm ready to work on [state current sprint focus]."

Do not summarize the files back to me — just confirm you've read them and state 
the current focus from the CLAUDE.md.
```

### Build Your First Slash Command

**Command: `/meridian`** — Load all Meridian context in one shot.

Step 1: Create the commands folder:
```bash
mkdir -p .claude/commands
```

Step 2: Create the command file:
```bash
touch .claude/commands/meridian.md
```

Step 3: Add this content:

```markdown
You are now working in the context of Meridian, a B2B SaaS workflow orchestration company.

Please read and hold context from:
- ABOUT-ME/CLAUDE.md
- PROJECTS/meridian-os/CLAUDE.md

Then confirm with: "Meridian OS loaded. Current focus: [state the current sprint focus from CLAUDE.md]"

For this session: use Meridian's exact terminology, frame all recommendations using 
the stakeholder map, and save any generated files to CLAUDE-OUTPUTS/.
```

Step 4: Test it:
```bash
claude
/meridian
```

Claude should respond with a brief confirmation — and be fully briefed on Meridian without you saying another word.

---

### Build Your Second Slash Command

**Command: `/context-check`** — Audit whether Claude's context is current.

```bash
touch .claude/commands/context-check.md
```

Content:
```markdown
Audit my current session context by answering these questions:

1. What product am I working on? (should be Meridian OS)
2. What is my single current top priority? (from ABOUT-ME/CLAUDE.md current focus)
3. Who are my three most important stakeholders and what do they care about?
4. What are the Q2 OKRs? (from PROJECTS/meridian-os/okrs.md)
5. What folder should you save generated files to? (should be CLAUDE-OUTPUTS/)

If any answer is "I don't know" or uncertain, flag it. We need to add that context 
to the appropriate file.

Format as a table: | Question | Answer | Status (✓ / ⚠️ Missing) |
```

---

### The 6 Slash Commands You'll Build in This Course

| Command | Purpose |
|---------|---------|
| `/meridian` | Load Meridian context |
| `/context-check` | Audit session context |
| `/progress` | Show module completion status |
| `/weekly-digest` | Run the weekly metrics workflow |
| `/prd [feature]` | Start a new PRD for a named feature |
| `/research-sync` | Load and synthesize latest research files |

Build each one as you reach the relevant module.

---

## Part 2: Skills

### What Are Skills?

Skills are more powerful than slash commands. A skill is a **folder** that contains:
- A `SKILL.md` instruction file (the "brain" of the skill)
- Optional scripts, templates, and resources

Skills extend what Claude can *do* — not just what it knows.

### The Difference

| | Slash Command | Skill |
|--|--------------|-------|
| What it is | A prompt shortcut | A capability extension |
| Lives in | `.claude/commands/` | `.claude/skills/` or a skills folder |
| What it does | Runs a pre-written instruction | Teaches Claude a new multi-step workflow |
| Complexity | Single prompt | Multi-file, multi-step, can include scripts |
| Best for | Loading context, triggering tasks | Complex repeatable workflows |

### Example Skills for PMs

**Skill: `research-synthesizer`**  
Teaches Claude to: ingest N interview transcripts → extract themes → write a synthesis doc → identify evidence gaps

**Skill: `prd-generator`**  
Teaches Claude to: accept a feature brief → query stakeholder context → draft PRD → run multi-perspective critique → produce final version

**Skill: `metrics-digest`**  
Teaches Claude to: load a CSV export → run analysis → write a narrative memo → format for Slack posting

### Build Your First Skill: `load-context`

This skill loads all your context in one shot and confirms readiness.

Step 1: Create the skills directory:
```bash
mkdir -p .claude/skills/load-context
```

Step 2: Create the SKILL.md:
```bash
touch .claude/skills/load-context/SKILL.md
```

Step 3: Content:
```markdown
---
name: load-context
description: Loads all PM context files and prepares Claude for a productive session. 
Run at the start of every session.
---

# Load Context Skill

## Purpose
Load all relevant context for a PM work session and confirm readiness.

## Steps

1. Read `ABOUT-ME/CLAUDE.md` — Hold the PM identity, preferences, and current focus.
2. Read `ABOUT-ME/anti-style.md` — Apply all writing rules immediately and permanently for this session.
3. Read `PROJECTS/meridian-os/CLAUDE.md` — Load product context, stakeholders, and OKRs.
4. Check `PROJECTS/meridian-os/roadmap.md` if it exists — Note current sprint state.

## Output
After reading all files, respond with exactly this format:

---
**Context loaded. Ready to work.**

- Product: Meridian OS (B2B workflow orchestration, Series B)
- Current focus: [pull from ABOUT-ME/CLAUDE.md current focus]
- Active OKR: [pull from project CLAUDE.md]
- Writing rules: Anti-style.md active
- Output target: CLAUDE-OUTPUTS/

What would you like to work on?
---

## Notes
- If any file is missing, note it as "⚠️ Missing: [filename]"
- Do not summarize file contents — just confirm they're loaded
- This skill should run in under 30 seconds
```

Step 4: Invoke it:
```
Use the skill in .claude/skills/load-context/SKILL.md to load my session.
```

---

## The Habit: Start Every Session the Same Way

Build this into muscle memory:

```bash
# Start of every PM work day:
claude
/meridian          ← or run the load-context skill
# Now you're ready. No setup. No re-explaining. Just work.
```

---

## Hands-On Exercise

1. Create your `.claude/commands/` folder and build the `/meridian` command.
2. Create your `.claude/skills/load-context/` folder and build the skill.
3. Start a fresh Claude Code session and test both:
   - First test: Type `/meridian` — does Claude load context correctly?
   - Second test: Run the load-context skill — does it confirm all files and state current focus?
4. Build the `/context-check` command and verify it catches any gaps.

---

## Module Checkpoint

- [ ] `.claude/commands/meridian.md` exists and works
- [ ] `.claude/commands/context-check.md` exists and works
- [ ] `.claude/skills/load-context/SKILL.md` exists and works
- [ ] You can start a fresh session, run `/meridian`, and be fully briefed in under 30 seconds

---

## Next: Module 0.6
Connect your first tool — MCP connectors and why they change everything.

```
/start-m0-6
```
