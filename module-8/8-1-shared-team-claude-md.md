# Module 8.1 — Shared CLAUDE.md Architecture Across a PM Team

**Time:** ~35 minutes  
**Outcome:** A functioning shared context architecture that any PM on your team can use immediately

---

## The Solo vs. Team Gap

Solo CLAUDE.md is a personal productivity tool.  
Team CLAUDE.md is organizational infrastructure.

The difference: when you leave the company, your institutional knowledge leaves with you. When it lives in a shared, versioned CLAUDE.md, it stays.

This module builds the architecture for a PM team of 3–10 people. It works equally well for a team of 1 who plans to scale.

---

## The Two-Layer Team Architecture

```
SHARED (everyone reads this)
└── TEAM-CLAUDE.md
    - Company context
    - Shared terminology
    - Cross-team stakeholders
    - Current company OKRs
    - Process standards (PRD format, launch checklist)
    - File structure guide

PERSONAL (each PM maintains their own)
└── ABOUT-ME/CLAUDE.md
    - Individual role and focus
    - Personal preferences
    - Personal stakeholder notes
    - Current sprint priorities
```

Rules:
- Only update TEAM-CLAUDE.md via pull request (needs one reviewer)
- Each PM owns their personal CLAUDE.md completely
- TEAM-CLAUDE.md is loaded first; personal CLAUDE.md overrides where they conflict

---

## TEAM-CLAUDE.md Template

```markdown
# Meridian — Shared PM Team Context
**Version:** 2.3 | **Last updated:** [Date] | **Owner:** [PM Lead]

---

## About the Company
Meridian builds workflow orchestration software for mid-market operations teams.
Series B ($28M raised) | ARR: $4.2M | Growth: 80% YoY | Customers: 142

## The Product
Meridian OS is a no-code workflow orchestration platform.
Core value: Replace manual approval chains and fragmented ops processes with 
automated workflows that connect existing SaaS tools.

## Shared Terminology (enforce everywhere, no exceptions)

| Use This | Never Say |
|----------|-----------|
| Workflow node | Block, step, action |
| Connector | Plugin, integration |
| Orchestration run | Execution, run |
| Routing sequence | Approval chain, approval flow |
| ORR | Usage rate, run rate |

## Company OKRs (Q2 2025)
1. Accelerate enterprise time-to-value (14 days → 7 days)
2. Grow ARR to $5M by June 30
3. Achieve 119%+ NRR maintained

## Cross-Team Stakeholder Map

| Name | Role | What They Care About | Framing Rule |
|------|------|---------------------|-------------|
| Dev Kapoor | CEO | ARR, growth rate, market share | Lead with a number |
| Tara Novak | CTO | Engineering velocity, debt | Effort and risk |
| James Whitfield | CFO | ROI, payback period | Financial framing |
| Priya Singh | Head of Design | User evidence | Research before solutions |
| Rohan Mehta | Head of Sales | Deal velocity | "Closes deals or doesn't" |

## PM Squad Map
| PM | Product Area | Active Focus |
|----|-------------|-------------|
| [Name A] | Platform Core | Conditional Approval Routing |
| [Name B] | Integrations | Connector Hub |
| [Name C] | Growth | Onboarding Revamp |

## PM Process Standards
- All PRDs must include a "What We're NOT Building" section
- Success metrics must be defined before engineering kicks off
- Use RICE for all prioritization decisions (include scores in decisions)
- Research must be cited — no "users want X" without evidence source
- All generated files go to CLAUDE-OUTPUTS/ (never write to PROJECTS/ directly)

## Shared File Locations
- Research: PROJECTS/meridian-os/research/
- Analytics: PROJECTS/meridian-os/analytics/
- Competitive: PROJECTS/meridian-os/competitive/
- Templates: TEMPLATES/ (read-only, shared)
- All outputs: CLAUDE-OUTPUTS/ (your outputs go in subdirectories by type)

## Version History
| Version | Date | What Changed |
|---------|------|-------------|
| 2.3 | 2025-04-15 | Updated Q2 OKRs, added Rohan to stakeholder map |
| 2.2 | 2025-04-01 | Reframed approval chain → routing sequence across all docs |
| 2.1 | 2025-03-15 | Added PM squad map |
```

---

## Git Workflow for TEAM-CLAUDE.md

### Setup (one-time)
```bash
cd your-pm-workspace
git init
git add TEAM-CLAUDE.md
git commit -m "init: shared Meridian PM context v1.0"
git branch -M main
git remote add origin https://github.com/your-org/meridian-pm-os.git
git push -u origin main
```

### Update Flow
```bash
git checkout -b context/update-q2-okrs
# Edit TEAM-CLAUDE.md
git add TEAM-CLAUDE.md
git commit -m "context: update Q2 OKRs and add Rohan to stakeholder map"
git push origin context/update-q2-okrs
# Open PR, tag one PM to review
# Merge when approved
```

### Commit Message Conventions
```
context:     Company or product context updates
terminology: New or corrected terms
stakeholder: Stakeholder map changes
okr:         OKR additions or updates
process:     PM process standards changes
squad:       Team structure updates
```

---

## New PM Onboarding Protocol

When a new PM joins, their Day 1 setup:

```bash
# Clone the shared workspace
git clone https://github.com/your-org/meridian-pm-os.git

# Open Claude Code
claude

# Run the onboarding command
/onboard
```

The `/onboard` slash command (create in `.claude/commands/onboard.md`):

```markdown
A new PM is joining the team today.

1. Read TEAM-CLAUDE.md in full
2. Read the PM Squad Map and identify which product area they'll own
3. Brief them on:
   - The company in 3 bullet points
   - The product in 2 sentences
   - Their primary stakeholders and how to frame for each
   - The 3 most important process rules for PM work here
   - What files they'll work with most

4. Ask them: "What's your first area of focus? I'll pull the specific 
   project context you need."

Write this as if you're welcoming them on their first day.
```

A new PM gets a better briefing from `/onboard` than most week-one schedules provide.

---

## Hands-On Exercise

1. Create `TEAM-CLAUDE.md` using the Meridian template above
2. Initialize a Git repo and commit it
3. Create `.claude/commands/onboard.md`
4. Simulate a new PM: start a fresh Claude Code session and run `/onboard`
5. Evaluate: does the briefing cover everything a real new PM would need on Day 1?

---

## Module Checkpoint

- [ ] TEAM-CLAUDE.md created with all sections filled in
- [ ] Committed to a Git repo with a descriptive message
- [ ] `/onboard` command created and tested
- [ ] You've run the onboarding simulation and evaluated its completeness

---

## Next: Module 8.2
Handoff workflows — from PM output to engineering-ready artifacts.

```
/start-m8-2
```
