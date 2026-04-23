# Module 3.1 — PRD From Scratch: Prompt → Outline → Draft → Critique → Polish

**Time:** ~50 minutes  
**Outcome:** A complete, critique-tested PRD for Meridian's Conditional Approval Routing feature

---

## Why PRDs Need a Workflow, Not a Prompt

A single prompt produces a generic PRD. It has structure but no soul — no decisions, no trade-offs, no real thinking.

A PRD workflow produces a document that survived pressure. It was challenged from multiple angles, revised based on critique, and sharpened through iteration.

This module teaches the 5-stage PRD workflow. By the end, your PRD will be engineering-ready.

---

## The 5-Stage PRD Workflow

```
Stage 1: SEED      → Give Claude the raw brief
Stage 2: OUTLINE   → Agree on structure before writing
Stage 3: DRAFT     → Generate the full document
Stage 4: CRITIQUE  → Challenge it from 3 perspectives
Stage 5: POLISH    → Final revision incorporating critique
```

Each stage produces an artifact. Each artifact feeds the next. Nothing is wasted.

---

## Stage 1: Seed — The Feature Brief

Before writing a word of the PRD, give Claude everything it needs to know.

**Prompt:**
```
I'm going to write a PRD for Meridian's Conditional Approval Routing feature.
Before we start, let me give you the brief.

Feature: Conditional Approval Routing
Problem: Operations teams need workflows where the approval path changes 
based on attributes of the request — amount, department, requester role, 
or custom conditions. Currently all approvals go to the same person regardless 
of context, creating bottlenecks and misrouted requests.

Target user: Marcus (Operations Manager) — builds the workflow
End user: Asha (Finance Analyst) — submits requests through the workflow

Locked decisions (cannot change):
- Routing logic is condition-based (if/then), not ML-based
- Maximum chain depth: 8 levels
- Mobile approval UI is out of scope for v1
- OOO escalation: auto-escalate after 48 hours to manager

Open questions (to be resolved in PRD):
- Partial approvals: can a chain complete if 3/4 approvers approve?
- Audit trail depth: what level of detail do enterprise customers need?
- Notification cadence: how often to remind pending approvers?

Business context:
- This feature directly supports Q2 KR1 (reduce activation time) and KR4 (enterprise ARR)
- Competitor Zapier has basic approval routing but no conditional logic
- Three enterprise prospects have cited this feature as a blocker to signing

Read this brief carefully. Then confirm you understand it by summarizing 
the core problem, the target user, and the top open question in 2 sentences each.
Do not start drafting yet.
```

---

## Stage 2: Outline — Agree on Structure First

After Claude confirms the brief, get alignment on structure:

```
Based on the brief, propose an outline for this PRD.

Use this as your structural guide:
1. Overview (problem, solution hypothesis, why now)
2. User Context (primary user, secondary users, current behavior)
3. Goals & Success Metrics (primary metric, secondary metrics, guardrails)
4. What We're Building (feature description, key behaviors)
5. What We're NOT Building (explicit scope exclusions)
6. Open Questions & Decisions (your recommended answer for each)
7. Technical Considerations (constraints from locked decisions)
8. Launch Checklist (pre-launch dependencies)

For each section, note what the 2-3 most important things to cover are.
Do not write the PRD yet — just the outline with bullet points per section.
```

Review the outline. Adjust anything that doesn't match your intended structure. This saves significant revision time later.

---

## Stage 3: Draft — Generate the Full PRD

```
The outline looks good. Now write the full PRD.

Guidelines:
- Use the Meridian terminology from ABOUT-ME/CLAUDE.md (routing sequence, workflow nodes, etc.)
- For the Open Questions section, provide your recommended answer for each question,
  with brief rationale
- Write the "What We're NOT Building" section with at least 4 explicit exclusions
- Success metrics must be measurable and time-bound
- Write for a technical audience — engineers should be able to build from this

Save the draft to: CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.md
```

---

## Stage 4: Critique — Challenge From 3 Angles

This is the step most PMs skip. Don't skip it.

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.md.

Review it from three perspectives simultaneously:

ENGINEER CRITIQUE:
- What requirements are technically ambiguous?
- What edge cases aren't handled?
- What assumptions could cause a mid-sprint surprise?

DESIGNER CRITIQUE:
- What user flows are underspecified?
- Where might the UX create friction for Marcus or Asha?
- What user states (empty, error, loading) aren't addressed?

EXEC CRITIQUE (CEO lens):
- What's missing from the "why now" argument?
- Is the business impact clear and quantified?
- What would a competitor already have done here?

Return each critique as a numbered list under its header.
Save critique to: CLAUDE-OUTPUTS/prds/approval-routing-prd-v1-critique.md
```

---

## Stage 5: Polish — Incorporate Critique

```
Read:
- CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.md (original draft)
- CLAUDE-OUTPUTS/prds/approval-routing-prd-v1-critique.md (critique)

Revise the PRD incorporating the highest-priority critique points.
For each change you make, add a brief inline note: [REVISED: reason]
so I can see what changed and why.

Prioritize:
1. Technical ambiguities (engineer critique)
2. Missing user states (designer critique)  
3. Business impact clarity (exec critique)

Save to: CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md
```

---

## The PRD Template

Save this to `TEMPLATES/prd-template.md` for reuse:

```markdown
# PRD: [Feature Name]
**Author:** [Name] | **Date:** [Date] | **Status:** Draft / Review / Approved  
**Version:** v[N]

---

## 1. Overview

### Problem
[1–2 sentences: what pain exists and who feels it]

### Solution Hypothesis
[1–2 sentences: what we're building and why it solves the problem]

### Why Now
[What makes this the right moment: business context, competitive pressure, user demand]

---

## 2. User Context

### Primary User
**[Persona name]** — [role and company type]
Current behavior: [what they do today without this feature]
Desired outcome: [what success looks like for them]

### Secondary Users
[Other users affected by this feature]

---

## 3. Goals & Success Metrics

### Primary Metric
[One number that tells us if this feature worked]
Target: [X% improvement in Y within Z weeks of launch]

### Supporting Metrics
- [Metric 2]: [target]
- [Metric 3]: [target]

### Guardrail Metrics (must not degrade)
- [Metric]: [threshold]

---

## 4. What We're Building

### Feature Description
[Clear prose description of the feature]

### Key Behaviors
- [Behavior 1]
- [Behavior 2]
- [Edge case handling]

---

## 5. What We're NOT Building (v1)

- [Explicit exclusion 1]
- [Explicit exclusion 2]
- [Explicit exclusion 3]
- [Explicit exclusion 4]

---

## 6. Open Questions & Decisions

| Question | Recommended Answer | Rationale | Owner | Due |
|----------|-------------------|-----------|-------|-----|
| [Q1] | [A1] | [Why] | [Name] | [Date] |

---

## 7. Technical Considerations

[Constraints, locked decisions, dependencies]

---

## 8. Launch Checklist

- [ ] Engineering spec reviewed by Tara
- [ ] Design mockups approved
- [ ] Success metrics instrumented in Amplitude
- [ ] Documentation updated
- [ ] Sales enablement brief sent to Rohan
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

- [ ] You've run all 5 stages of the PRD workflow
- [ ] `approval-routing-prd-v2.md` exists in CLAUDE-OUTPUTS/prds/
- [ ] The PRD has a "What We're NOT Building" section
- [ ] The critique stage changed at least 3 things in the draft
- [ ] `TEMPLATES/prd-template.md` saved for future use

---

## Next: Module 3.2
Multi-perspective PRD review — having Claude argue as engineer, designer, and exec simultaneously.

```
/start-m3-2
```
