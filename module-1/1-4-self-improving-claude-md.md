# Module 1.4 — Self-Improving CLAUDE.md

**Time:** ~30 minutes  
**Outcome:** A feedback loop system that automatically evolves your CLAUDE.md over time

---

## The Problem with Static Context

CLAUDE.md is only valuable if it's accurate. A stale CLAUDE.md is worse than no CLAUDE.md — it gives Claude wrong context and produces confidently incorrect outputs.

Most PMs write their CLAUDE.md once and forget it. This module teaches you to make it a living system.

---

## The Self-Improvement Loop

```
1. Work with Claude in a session
         ↓
2. Notice a gap: Claude gets something wrong or needs clarification
         ↓
3. Record the gap immediately (don't let it slip)
         ↓
4. Update CLAUDE.md with the correction
         ↓
5. Verify the update works in the next session
         ↓
Back to 1
```

---

## Types of CLAUDE.md Gaps

### Type 1: Missing Terminology
*Claude uses the wrong word for something your team calls a specific thing.*

**Signal:** You find yourself typing "no, we call that X" more than once  
**Fix:** Add the term to your Terminology section

```markdown
## Terminology
- "Workflow node" (NOT "block", "step", or "action") = individual step in a workflow
- "Connector" (NOT "integration" or "plugin") = external tool connection
- "Orchestration run" = one complete execution of a workflow
```

### Type 2: Missing Stakeholder Context
*Claude writes a stakeholder email that doesn't match how that person thinks.*

**Signal:** The exec communication Claude produces doesn't sound right for the person  
**Fix:** Add more specific framing rules to your stakeholder map

```markdown
## Stakeholder Framing: Dev Kapoor (CEO)
- Always lead with a number: ARR impact, customer count, or growth rate
- Keep recommendations under 3 bullet points — he reads fast and makes fast decisions
- Frame every trade-off in terms of "do we win or lose deals because of this?"
- Avoid: long-form rationale, technical detail, or process-heavy proposals
```

### Type 3: Wrong Output Format
*Claude writes in a style you don't use or like.*

**Signal:** You keep editing Claude's formatting in the same way  
**Fix:** Make your format preferences more explicit

```markdown
## Output Format Rules
- Executive summaries: max 3 bullets + 1 recommendation
- PRD sections: always include a "why now" paragraph
- Meeting notes: action items in a table with owner and date
- Data analysis: narrative paragraph first, then supporting table
```

### Type 4: Missing Business Context
*Claude makes recommendations that don't fit your business stage.*

**Signal:** Claude suggests things that are too ambitious for your resources or wrong for your market  
**Fix:** Add business constraints to your project CLAUDE.md

```markdown
## Business Constraints (Q2 2025)
- Engineering capacity: 12 engineers across 3 squads
- No new headcount until Series C close (Q4 estimate)
- Enterprise features are blocked until SOC 2 Type II audit (August)
- Mobile app is not in scope — web-only for 2025
```

---

## Building the Feedback Habit

Create a `learning.md` file in your workspace that captures gaps as they happen:

```bash
touch learning.md
```

Template:

```markdown
# CLAUDE.md Learning Log

## How to use this file
When Claude gets something wrong or you notice a gap, record it here immediately.
Review weekly. Update CLAUDE.md. Then delete the entry.

## [Date] — [Gap Type] — [Short Description]
**What happened:** [What Claude did wrong or didn't know]
**Fix:** [What to add to CLAUDE.md]
**Status:** [ ] Pending | [x] Added to CLAUDE.md

---
```

Example entry:

```markdown
## 2025-04-15 — Missing Terminology — "Approval chain" vs "Routing sequence"
**What happened:** Claude keeps writing "approval chain" in comms, but our team 
uses "routing sequence" since engineering renamed it in Sprint 12.
**Fix:** Add to terminology: "Routing sequence" (NOT "approval chain") = the ordered 
list of approvers in a conditional workflow
**Status:** [ ] Pending
```

---

## The Weekly CLAUDE.md Review

Set a 15-minute calendar block every Friday called "PM OS Weekly Review."

Agenda:
1. Open `learning.md`
2. Review all pending entries
3. Update CLAUDE.md for each entry
4. Delete the entries you've resolved
5. Update the "Current Focus" section with next week's priorities

This keeps your context current with zero overhead.

---

## Hands-On Exercise

**Task:** Deliberately find a gap and fix it.

1. Ask Claude a question you know requires specific Meridian context:
   ```
   Draft a one-paragraph Slack message to Dev Kapoor explaining why 
   we're pushing the Connector Hub launch by two weeks.
   ```

2. Evaluate the response:
   - Does it lead with a number?
   - Is it under 3 sentences?
   - Does it use the right terminology?

3. If it's off, record the gap in `learning.md` and update your CLAUDE.md.

4. Ask the same question again after the update and compare.

---

## Module Checkpoint

- [ ] You have a `learning.md` file for tracking context gaps
- [ ] You've found at least one gap in your current CLAUDE.md and fixed it
- [ ] You have a weekly review habit set up (even just a calendar reminder)

---

## Next: Module 1.5
Team CLAUDE.md — sharing and versioning context across a PM team in Git.

```
/start-m1-5
```
