# Module 1.5 — Team CLAUDE.md

**Time:** ~40 minutes  
**Outcome:** A Git-versioned, team-shareable CLAUDE.md system for a multi-PM org

---

## The Problem at Team Scale

Solo CLAUDE.md works great for individual PMs. But when you have a team:
- Every PM has slightly different context
- Stakeholder knowledge isn't shared
- Terminology diverges silently
- New PMs take weeks to ramp up

A shared, versioned Team CLAUDE.md solves all of this.

---

## The Architecture: Shared + Personal Layers

```
team-context/
├── TEAM-CLAUDE.md          ← Shared by all PMs (versioned in Git)
├── product-a/
│   └── CLAUDE.md           ← Product A PM's context
├── product-b/
│   └── CLAUDE.md           ← Product B PM's context
└── personal/
    ├── pm-alice.md         ← Alice's personal overrides
    ├── pm-bob.md           ← Bob's personal overrides
    └── pm-vishal.md        ← Your personal overrides
```

**Rule:** `TEAM-CLAUDE.md` contains only what's true for every PM on the team. Individual overrides live in personal files.

---

## What Goes in TEAM-CLAUDE.md

```markdown
# Meridian — Team PM Context

## Company Shared Context
Meridian builds workflow orchestration software for mid-market operations teams.
ARR: $4.2M | Growth: 80% YoY | Stage: Series B

## Shared Terminology (enforce across all PM docs)
- "Workflow node" — individual step (never "block", "action", or "step")
- "Connector" — external tool integration (never "plugin" or "integration")
- "Orchestration run" — one workflow execution
- "ORR" — Orchestration Run Rate (core engagement metric)
- "Routing sequence" — ordered list of approvers in a conditional workflow

## Company OKRs (Q2 2025)
1. Accelerate time-to-value for enterprise customers
2. Reach $5M ARR by June 30
3. Launch SOC 2 Type II compliance by August

## Cross-PM Stakeholder Map

| Name | Role | Key Motivation | Framing Rule |
|------|------|----------------|-------------|
| Dev Kapoor | CEO | Revenue + growth speed | Lead with ARR or customer count |
| Tara Novak | CTO | Engineering velocity, low debt | Frame in effort and risk |
| James Whitfield | CFO | ROI, burn efficiency | Lead with payback period |
| Priya Singh | Head of Design | User evidence | Show research before solutions |
| Rohan Mehta | Head of Sales | Deal velocity | Frame in "closes deals" or "removes objections" |

## Cross-PM Process Rules
- PRDs must include a "What we're NOT building" section
- Every feature shipped needs a success metric defined before launch
- Use RICE for prioritization — include scores in roadmap decisions
- Research must be sourced — no "users want X" without evidence

## PM Squad Map
- Product A (Platform): [Name] — workflow builder core
- Product B (Integrations): [Name] — connectors and API
- Product C (Enterprise): [Name] — SSO, audit, admin
- Product D (Growth): [Name] — activation, onboarding, retention

## Shared File Locations
- User research: /research/interviews/
- Analytics: /analytics/exports/
- Design assets: Figma link [URL]
- Engineering specs: Notion link [URL]
```

---

## Versioning with Git

Treat your shared CLAUDE.md like code. Every change should be:
- Committed with a descriptive message
- Reviewed by at least one other PM before merging
- Tagged with a version when major changes happen

### Setting up a simple Git workflow

```bash
# One-time setup
cd your-pm-workspace
git init
git add TEAM-CLAUDE.md
git commit -m "init: shared PM context for Meridian team"

# When updating
git checkout -b update/q2-okrs
# Edit TEAM-CLAUDE.md
git add TEAM-CLAUDE.md
git commit -m "context: update Q2 OKRs and stakeholder map"
git push origin update/q2-okrs
# Open PR for team review
```

### Commit message convention for CLAUDE.md changes

```
context: [what changed]           ← Updates to company/product context
persona: [what changed]           ← Updates to team process or framing rules
stakeholder: [who was updated]    ← Stakeholder map changes
terminology: [what was added]     ← New or corrected terminology
okr: [which OKR and change]       ← OKR updates
```

---

## Onboarding New PMs with Your Team CLAUDE.md

A new PM joining the team should do:

1. `git clone` the shared PM workspace
2. Open Claude Code from the workspace root
3. Ask: `Based on our shared CLAUDE.md, brief me on our product, our team's top priorities, and our key stakeholders.`

They get a 5-minute brief that would have taken a week of meetings.

This is one of the most valuable uses of CLAUDE.md at team scale.

---

## Hands-On Exercise

**Task:** Create a team CLAUDE.md for Meridian's PM team.

1. Create the file:
   ```bash
   touch TEAM-CLAUDE.md
   ```

2. Fill in the template above with Meridian's context.

3. Initialize a Git repo and commit it:
   ```bash
   git init
   git add TEAM-CLAUDE.md
   git commit -m "init: Meridian team PM context"
   ```

4. Simulate a new PM onboarding:
   ```
   /meridian
   You are a new PM joining Meridian. Based only on TEAM-CLAUDE.md, 
   give me a 5-point brief of the company, product, team, and priorities.
   ```

5. Evaluate the output. Is there anything missing that a new PM would need?

---

## Module Checkpoint

- [ ] You have a `TEAM-CLAUDE.md` with shared company and product context
- [ ] It's committed to a Git repo with a descriptive commit message
- [ ] You've run the "new PM brief" exercise and evaluated the output

---

## Module 1 Complete

You now have the deepest CLAUDE.md setup of any PM in your organization. You've built:
- A three-level hierarchy (global → project → feature)
- Archetype-specific content at each layer
- A self-improvement loop with `learning.md`
- A team-versioned shared context file

**Start Module 2:**
```
/start-m2-1
```

*Module 2: File & Memory Operations — the core building blocks of your PM OS.*
