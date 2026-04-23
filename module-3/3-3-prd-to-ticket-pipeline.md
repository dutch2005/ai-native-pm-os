# Module 3.3 — PRD → Ticket Pipeline: Auto-Generate Engineering Stories

**Time:** ~35 minutes  
**Outcome:** A complete sprint-ready ticket set generated from your PRD in under 10 minutes

---

## The Problem This Solves

**From Reddit r/ProductManagement (130 upvotes):**
> *"In my org, every time something breaks, the default response from engineering is: 'requirements weren't clear.' Doesn't matter that we have PRDs, grooming sessions, user stories with acceptance criteria — somehow there's always something that wasn't 'explicit enough.'"*

The "unclear requirements" blame cycle is real. But it's often not a PRD problem — it's a handoff problem. The PRD lives in one place. The tickets live in another. They should be the same document.

This lesson gives you a pipeline that closes that gap.

---

## The Pipeline

```
PRD (v3, approved)
      ↓
Ticket extraction (Claude reads the PRD)
      ↓
Stories generated with acceptance criteria
      ↓
Edge cases identified and added
      ↓
Jira tickets created via MCP (Module 7)
OR
Markdown tickets saved for manual import
```

---

## Stage 1: Ticket Extraction from PRD

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v3.md

Extract every distinct engineering unit of work as a separate ticket.

For each ticket:
- Title: verb + outcome format (e.g. "Build conditional routing logic engine")
- Type: Backend / Frontend / Integration / Testing / Design / Infra
- User story: "As a [persona], I want to [action] so that [outcome]"
- Acceptance criteria: minimum 3, maximum 6 specific, testable criteria
- Edge cases: list at least 2 edge cases that must be handled
- Dependencies: list any other ticket this blocks or is blocked by
- Estimated complexity: XS / S / M / L / XL with 1-sentence rationale

Return as a numbered list. Do not create more than 12 tickets for a single PRD.
If the PRD implies more, ask me which area to start with.
```

---

## Stage 2: Acceptance Criteria Quality Check

Good acceptance criteria are the single most effective way to prevent "requirements weren't clear" post-launch.

Run this check:

```
Review the acceptance criteria you generated for all tickets.

For each criterion, check:
1. Is it testable? (Can a QA engineer write a test against it?)
2. Is it specific? (Does it name the exact behavior, not "handle errors")
3. Does it define the negative case? (What happens when it fails?)

Flag any criterion that fails any of these checks.
Rewrite flagged criteria to pass all three tests.
Save the improved ticket set to: CLAUDE-OUTPUTS/prds/approval-routing-tickets-v1.md
```

---

## Stage 3: Edge Case Expansion

Edge cases are where bugs live. This prompt force-discovers them:

```
Read CLAUDE-OUTPUTS/prds/approval-routing-tickets-v1.md

For the 3 most complex tickets (L or XL), run an edge case expansion:

For each ticket, answer:
1. What happens if the user is on a slow connection?
2. What happens if the upstream service (e.g. the identity provider) is unavailable?
3. What happens if the data is malformed or incomplete?
4. What happens if the user has insufficient permissions?
5. Is there a race condition risk? (Two actions happening simultaneously)

For each edge case identified, either:
- Add it as a new acceptance criterion to the existing ticket
- OR create a new ticket specifically for it, if it's complex enough

Save updated ticket set.
```

---

## The Ticket Template (for your TEMPLATES/ folder)

```markdown
## [TICKET-XXX] [Verb + Outcome Title]

**Type:** Backend / Frontend / Integration / Testing / Design / Infra  
**Epic:** [Feature name]  
**Priority:** Critical / High / Medium / Low  
**Estimate:** XS / S / M / L / XL  
**Reporter:** [Your name]  
**Sprint:** [Sprint number]

---

### User Story
As a [persona], I want to [action] so that [outcome].

### Context
[1–2 sentences linking this ticket back to the PRD and the user pain it solves]

### Acceptance Criteria
- [ ] [Specific, testable criterion 1]
- [ ] [Specific, testable criterion 2]
- [ ] [Specific, testable criterion 3]

### Edge Cases to Handle
- [Edge case 1]
- [Edge case 2]

### Out of Scope for This Ticket
- [Explicit exclusion 1]

### Dependencies
- Blocks: [TICKET-XXX]
- Blocked by: [TICKET-XXX]

### Definition of Done
- [ ] Code reviewed and approved
- [ ] Tests written and passing
- [ ] QA sign-off
- [ ] Documentation updated if needed
```

---

## Adding "What This Isn't" to Every Ticket

One of the highest-ROI additions to any ticket is an explicit "Out of Scope" section. This is drawn directly from the PRD's "What We're NOT Building" section.

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v3.md — specifically the 
"What We're NOT Building" section.

For each exclusion in that section, identify which ticket(s) it most 
directly affects, and add it as an "Out of Scope" line to that ticket.

Update the ticket file.
```

This one step eliminates a category of mid-sprint "can we just also..." scope creep.

---

## Hands-On Exercise

1. Run the full 3-stage pipeline on your `approval-routing-prd-v3.md`
2. Generate 6–10 tickets
3. Run the acceptance criteria quality check
4. Add edge case expansions to the 2 most complex tickets
5. Count: how many acceptance criteria are in your full ticket set?

> **Target:** At least 3 acceptance criteria per ticket. If any ticket has fewer, it's underspecified — run the Stage 2 quality check to fix it.

---

## Module Checkpoint

- [ ] Ticket set generated from PRD (6–10 tickets)
- [ ] Acceptance criteria quality check run and weak criteria rewritten
- [ ] Edge cases expanded for complex tickets
- [ ] "Out of Scope" added to at least 3 tickets from the PRD exclusion list
- [ ] `approval-routing-tickets-v1.md` saved to CLAUDE-OUTPUTS/prds/

---

## Next: Module 3.4
Lightweight specs — when a PRD is overkill and a one-pager gets you further.

```
/start-m3-4
```
