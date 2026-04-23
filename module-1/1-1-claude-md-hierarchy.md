# Module 1.1 — Global vs. Project vs. Feature-Level CLAUDE.md Hierarchy

**Time:** ~35 minutes  
**Outcome:** A working three-level CLAUDE.md hierarchy tailored to your PM workflow

---

## The Problem with a Single CLAUDE.md

A single CLAUDE.md is a good start. But as your work expands across multiple products, squads, or feature areas, one file becomes bloated and unfocused.

The solution: **a hierarchy**.

---

## The Three Levels

### Level 1: Global CLAUDE.md (`~/.claude/CLAUDE.md`)
**What it contains:** Who you are as a PM. Your core operating principles.

This file loads in every Claude Code session, everywhere on your machine.

**Ideal contents:**
- Your name, title, and PM style
- Your preferred output format (always tables? always headers?)
- Universal terminology preferences
- How you want Claude to handle uncertainty
- Your most-used frameworks (JTBD, RICE, etc.)

**Size target:** 100–200 lines. Shorter = loaded faster = cheaper.

### Level 2: Project CLAUDE.md (in your project folder root)
**What it contains:** Everything Claude needs to know about this specific product or initiative.

This file loads when you `cd` into the project directory and run `claude`.

**Ideal contents:**
- Product context (what it is, who uses it, key metrics)
- Stakeholder map for this product
- Product-specific terminology
- Current quarter's OKRs and priorities
- File structure guide (what's in which folder)

**Size target:** 200–400 lines.

### Level 3: Feature CLAUDE.md (in a feature subfolder)
**What it contains:** Deep context for a specific feature, epic, or workstream.

This file loads when you're working deep in a specific area.

**Ideal contents:**
- Feature brief and background
- User stories and acceptance criteria
- Open decisions and known constraints
- Links to related designs, research, and data
- Engineering notes relevant to PM decisions

**Size target:** 50–150 lines.

---

## How Claude Reads the Hierarchy

When you launch Claude Code, it reads CLAUDE.md files in this order:

```
1. Global: ~/.claude/CLAUDE.md
         +
2. Project: ./CLAUDE.md (in current working directory)
         +
3. Feature: ./features/[feature-name]/CLAUDE.md (if you reference it)
         =
Full context for the session
```

Each level adds context. Lower levels can override upper levels for specific terms.

---

## Hands-On Exercise: Build the Three-Level Hierarchy

**Step 1:** Create your global CLAUDE.md

```bash
mkdir -p ~/.claude
touch ~/.claude/CLAUDE.md
```

Add this content:

```markdown
# Global PM Context

## Identity
I am a Product Manager. I think in user outcomes, not feature lists.
I communicate in clear, structured language without jargon.

## Output Format Defaults
- Always use markdown headers and tables in documents
- Be concise. One sentence is better than two.
- Bullet points for lists of 3+ items
- Ask one clarifying question when intent is ambiguous, don't guess

## My Frameworks
- Prioritization: RICE (Reach, Impact, Confidence, Effort)
- Discovery: Jobs-to-be-Done
- Metrics: NSM (North Star Metric) + L1/L2 metrics tree
- Communication: Pyramid principle (conclusion first)

## Universal Preferences
- Never use "leverage" as a verb
- Avoid passive voice
- Avoid "synergy", "ecosystem", "delightful"
```

**Step 2:** Open this course as your project context

Navigate to the AI-Native-PM-OS directory and check that your project CLAUDE.md (the one in this folder) loads correctly:

```bash
claude
# Then ask:
What is my global identity as a PM?
What product am I working on in this project?
```

Both should answer correctly — global from `~/.claude/CLAUDE.md`, project from `./CLAUDE.md`.

**Step 3:** Create a feature-level CLAUDE.md

Create a folder for a hypothetical feature:

```bash
mkdir -p features/approval-routing
touch features/approval-routing/CLAUDE.md
```

Add context specific to this feature:

```markdown
# Feature Context: Approval Routing

## Overview
Approval Routing enables Operations Managers to define multi-step approval chains
for procurement, headcount, and expense workflows. Currently in Active Development.

## Key Decisions Made
- Routing logic is condition-based, not role-based (locked in engineering sprint 14)
- Max chain depth: 8 levels (legal requirement per compliance team)
- Mobile approval UI is out of scope for v1

## Open Questions
- Should we notify stakeholders mid-chain, or only at completion?
- What happens when an approver is OOO? (Escalation logic not designed yet)

## Files
- features/approval-routing/prd-draft.md
- features/approval-routing/user-stories.md
- features/approval-routing/research-notes.md
```

---

## Seeing the Hierarchy in Action

With all three levels set up, run this from the approval-routing folder:

```bash
claude
```

Then ask:
```
What framework do I use for prioritization?
What product am I working on?
What is the maximum chain depth for approval routing and why?
```

All three should answer correctly — each from a different CLAUDE.md level.

---

## Module Checkpoint

- [ ] You have a global CLAUDE.md with your PM identity and defaults
- [ ] You have a project CLAUDE.md with Meridian context
- [ ] You have at least one feature CLAUDE.md with feature-specific context
- [ ] You can demonstrate that all three levels load correctly in a session

---

## Next: Module 1.2
What goes in each layer — a detailed breakdown of persona, terminology, stakeholder maps, and product context.

```
/start-m1-2
```
