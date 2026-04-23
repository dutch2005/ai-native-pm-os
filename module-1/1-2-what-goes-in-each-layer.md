# Module 1.2 — What Goes in Each Layer

**Time:** ~40 minutes  
**Outcome:** A fully populated CLAUDE.md at each level with the right content in the right place

---

## The Content Architecture Decision

One of the most common mistakes PMs make with CLAUDE.md: putting everything in one file, or putting things in the wrong layer.

This lesson gives you a clear framework for deciding what belongs where.

---

## Layer 1: Global CLAUDE.md — Your PM Persona

The global layer is about **you**, not any specific product. It should work equally well if you changed jobs tomorrow.

### What belongs here

**1. Your PM Persona**
```markdown
## PM Persona
- I prioritize user outcomes over feature delivery
- I communicate decisions with data and user evidence, not opinions
- I challenge assumptions before building solutions
- I represent the user in every engineering discussion
```

**2. Universal Output Preferences**
```markdown
## Output Preferences
- Lead with the recommendation, then the rationale (Pyramid Principle)
- Limit prose paragraphs to 3 sentences max
- Use tables for comparisons of 2+ options
- Use numbered lists for steps, bullets for unordered items
```

**3. Core Frameworks**
```markdown
## Frameworks I Use
- **Prioritization:** RICE score (Reach × Impact × Confidence / Effort)
- **Discovery:** Jobs-to-be-Done (functional, social, emotional jobs)
- **Metrics:** North Star Metric + supporting metric tree
- **Strategy:** Wardley Mapping for positioning decisions
- **Communication:** Pyramid Principle for exec-facing docs
```

**4. Language Preferences**
```markdown
## Language Rules
- Never say "leverage" as a verb. Use "use" instead.
- Avoid "ecosystem" unless discussing developer platforms specifically
- Prefer "users" over "customers" in product writing
- Use active voice. Rewrite passive constructions.
```

---

## Layer 2: Project CLAUDE.md — Product Context

The project layer is about **the product you're currently working on**. It should capture everything a new PM would need to get up to speed in their first week.

### What belongs here

**1. Product Overview**
```markdown
## Product: Meridian OS
Meridian OS is a B2B workflow orchestration platform for operations teams
at mid-market companies (50–500 employees).

Core value prop: Replace manual approval chains, escalations, and reporting 
with automated workflows that connect existing SaaS tools.

ARR: $4.2M | Growth: 80% YoY | Customers: 142 | Stage: Series B
```

**2. User Personas (in detail)**
```markdown
## Primary Users

### Olivia — VP of Operations
- Pain: Spends 4 hours/week manually compiling status reports across departments
- Goal: Real-time operational visibility without chasing people for updates
- Quote: "I need to know what's stuck before it becomes a fire."
- Success metric: Time spent on manual reporting drops by 80%

### Marcus — Operations Manager
- Pain: Manages 15+ active workflows in spreadsheets; breaks constantly
- Goal: One place to build, monitor, and fix all operational workflows
- Quote: "Every tool change means rebuilding everything from scratch."
- Success metric: Mean time to workflow creation drops from 2 days to 2 hours
```

**3. Stakeholder Map**
```markdown
## Internal Stakeholders

| Name | Role | What They Care About | How to Frame Decisions |
|------|------|---------------------|----------------------|
| Dev Kapoor | CEO | Revenue, growth rate, market share | Lead with ARR impact or customer count |
| Tara Novak | CTO | Technical debt, scope, engineering velocity | Frame in engineering effort and risk |
| James Whitfield | CFO | Payback period, unit economics, burn | Lead with ROI and payback timeline |
| Priya Singh | Head of Design | User experience, research grounding | Show user evidence before proposing solutions |
```

**4. Product Terminology**
```markdown
## Meridian Terminology
- "Workflow node" = individual step in a workflow (not "block" or "step")
- "Orchestration run" = one execution of a complete workflow
- "ORR" = Orchestration Run Rate (our core engagement metric)
- "Connector" = integration with an external tool (not "plugin" or "integration")
- "Trigger" = event that starts a workflow (not "webhook" unless technical context)
```

**5. Current OKRs**
```markdown
## Q2 OKRs

Objective: Accelerate time-to-value for new enterprise customers
- KR1: Reduce median activation time from 14 days to 7 days
- KR2: Increase 30-day workflow creation rate from 60% to 85%
- KR3: Launch 3 enterprise connector templates by June 30
```

---

## Layer 3: Feature CLAUDE.md — Deep Dive Context

The feature layer is for when you're deep in a specific area. It gives Claude everything needed to be a useful collaborator on that specific work.

### What belongs here

**1. Feature Brief**
```markdown
## Feature: Conditional Approval Routing

**Problem:** Operations teams need workflows where approval routing changes 
based on the value, department, or requester of a request. Currently, 
all approvals go to the same person regardless of context.

**Solution:** Allow workflow builders to define conditions (e.g., "if amount > $10,000, 
route to CFO") that dynamically select the next approver.

**Target user:** Marcus (Operations Manager)
**Stage:** Active Development (Sprint 15)
```

**2. Open Questions & Locked Decisions**
```markdown
## Status

### Locked Decisions
- Routing logic is condition-based (if/else), not ML-based
- Maximum chain depth: 8 levels
- Mobile approval UI is out of scope for v1

### Open Questions
- OOO handling: escalate after 24h or block the chain?
- Partial approvals: can a chain complete if 3/4 approvers approve?
- Audit trail: which level of detail do enterprise customers need?
```

---

## Hands-On Exercise

**Task:** Populate all three levels for Meridian.

1. Open `~/.claude/CLAUDE.md` and fill in your PM Persona, Output Preferences, and Frameworks using the examples above as a starting point.

2. Open this project's `CLAUDE.md` and fill in the Meridian product context, user personas, and Q2 OKRs.

3. Create a feature CLAUDE.md for any one of these Meridian features:
   - `features/dashboard-v2/CLAUDE.md` — A redesigned operational dashboard
   - `features/connector-hub/CLAUDE.md` — A marketplace for pre-built connectors
   - `features/onboarding-revamp/CLAUDE.md` — A new user onboarding experience

4. Test the hierarchy by asking Claude questions that pull from each layer:
   ```
   What framework do I use for prioritization? (Global)
   Who is Olivia and what does she care about? (Project)
   What is locked vs. open in the feature I'm working on? (Feature)
   ```

---

## Module Checkpoint

- [ ] Global CLAUDE.md has your persona, output preferences, and frameworks
- [ ] Project CLAUDE.md has Meridian context, personas, stakeholders, terminology, and OKRs
- [ ] Feature CLAUDE.md has a brief, decisions, and open questions for one feature
- [ ] You've verified that all three load correctly in a session

---

## Next: Module 1.3
CLAUDE.md templates by PM archetype — B2B SaaS, Consumer, Platform, API-first.

```
/start-m1-3
```
