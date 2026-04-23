# Module 0.4 — Write Your 2 Core Files

**Time:** ~30 minutes  
**Outcome:** CLAUDE.md + anti-style.md — the two files that do more than 50 prompts combined

---

## The Rule

One great context file beats 50 uploads. Be intentional. Don't dump everything.

Two files do the heavy lifting in any PM OS:
1. **CLAUDE.md** — Who you are, what you're working on, how Claude should behave
2. **anti-style.md** — What Claude must never say, do, or produce

---

## File 1: CLAUDE.md

This is your primary briefing document. Claude reads it at the start of every session.

Think of it as the brief you'd give an extremely capable executive assistant on their first day.

### CLAUDE.md Template (PM Edition)

```markdown
# About Me

## Identity
My name is [Name]. I am a Product Manager at [Company].
I work on [product area]. My current top priority is [one sentence].

## How I Think
- I am user-outcome focused, not feature-list focused
- I communicate decisions with evidence, not opinions
- I challenge assumptions before proposing solutions
- I represent the user in every engineering trade-off

## My Product Context
[Product name] is [one sentence description].
- Users: [primary user persona in one sentence]
- Stage: [Seed / Series A / B / C / Public]
- Core metric: [the one number that matters most]
- Current ARR/MAU/DAU: [your key scale metric]

## Stakeholders I Work With
| Name | Role | What They Care About | How to Frame for Them |
|------|------|---------------------|----------------------|
| [Name] | [Role] | [Motivation] | [Framing rule] |

## Terminology
These are the exact words my team uses. Always use these:
- "[our term]" = [what it means] (never say "[wrong word]")

## Output Format Defaults
- Lead with the recommendation, then the rationale
- Use tables for comparisons, bullets for lists of 3+
- Limit prose paragraphs to 3 sentences
- Ask one clarifying question when intent is ambiguous; don't guess

## Current Focus (update weekly)
Sprint [N] goals:
- [Goal 1]
- [Goal 2]
- [Goal 3]
```

### Filling it in for Meridian

Here's the completed version for our practice company:

```markdown
# About Me

## Identity
I am a Product Manager at Meridian, a B2B SaaS workflow orchestration company.
I work on the core platform. My current top priority is reducing time-to-value
for new enterprise customers from 14 days to 7 days.

## How I Think
- I am user-outcome focused, not feature-list focused
- I communicate decisions with data and user evidence, not opinions
- I challenge assumptions before building solutions
- I represent the user in every engineering discussion

## My Product Context
Meridian OS is a no-code workflow orchestration platform for mid-market 
operations teams (50–500 employees).
- Users: Operations Managers who build and manage workflows
- Buyers: VPs of Operations who approve the purchase
- Stage: Series B | ARR: $4.2M | Growth: 80% YoY
- Core metric: Orchestration Run Rate (ORR) — weekly workflow executions
- Customers: 142 companies

## Stakeholders I Work With
| Name | Role | What They Care About | How to Frame |
|------|------|---------------------|-------------|
| Dev Kapoor | CEO | Revenue, growth, market share | ARR and customer count |
| Tara Novak | CTO | Engineering velocity, technical debt | Effort and risk |
| James Whitfield | CFO | ROI, payback period | Payback timeline |
| Priya Singh | Head of Design | User evidence | Research before proposals |
| Rohan Mehta | Head of Sales | Deal velocity | Closes deals / removes objections |

## Terminology (use exactly these words)
- "Workflow node" = individual step (never "block", "action", "step")
- "Connector" = external tool integration (never "plugin", "integration")
- "Orchestration run" = one complete workflow execution
- "Routing sequence" = ordered list of approvers in a conditional workflow
- "ORR" = Orchestration Run Rate

## Output Format Defaults
- Lead with recommendation, then rationale (Pyramid Principle)
- Use tables for comparisons, bullets for 3+ items
- Limit prose paragraphs to 3 sentences max
- Ask one clarifying question when intent is ambiguous
- Never start a response with "Certainly!" or "Great question!"

## Current Focus (update weekly)
Q2 Sprint 6 goals:
- Finalize Approval Routing v1 spec for engineering handoff
- Run synthesis on 8 pending enterprise customer interviews
- Draft Q2 board narrative for Dev's review
```

---

## File 2: anti-style.md

This file tells Claude what it must **never** do. It's your guardrail file.

Why it matters: Claude has stylistic defaults trained into it. Some of those defaults are annoying, wrong for your context, or actively bad for professional writing.

This file overrides them.

### anti-style.md Template

```markdown
# Anti-Style Rules — What Claude Must Never Do

## Never Say These Words or Phrases
- "Leverage" as a verb (use "use" instead)
- "Ecosystem" unless discussing developer platforms specifically
- "Synergy", "synergies"
- "Delightful" or "delight" as a product goal
- "At the end of the day"
- "Move the needle"
- "Low-hanging fruit"
- "Circle back"
- "Learnings" (use "lessons" or "findings")
- "Actionable insights"
- "Robust" as a generic positive adjective

## Never Start Responses With
- "Certainly!"
- "Great question!"
- "Absolutely!"
- "Of course!"
- "Sure thing!"
- Any response that begins with validating the question

## Never Do These Things
- Write more than 3 bullets without asking if detail is needed
- Use passive voice in executive communications
- Include a disclaimer unless the risk is genuinely material
- Suggest "further research is needed" without specifying what and why
- End a document with "In conclusion" or "In summary"

## Format Rules
- No emoji in professional documents
- No bold on every other word — use bold sparingly for key terms only
- Subheadings should be sentence-case, not Title Case Unless Specified
- Table of contents only if the document exceeds 1,000 words
```

---

## How to Reference Both Files

Add this to your CLAUDE.md so Claude always looks at both:

```markdown
## Key Files
- ABOUT-ME/CLAUDE.md — Primary context (this file)
- ABOUT-ME/anti-style.md — Writing rules Claude must follow
```

---

## Hands-On Exercise

1. Create both files:
   ```bash
   touch ABOUT-ME/CLAUDE.md ABOUT-ME/anti-style.md
   ```

2. Fill in CLAUDE.md using the Meridian template above.

3. Fill in anti-style.md with at least 5 rules you actually care about.

4. Test the combination:
   ```
   Write a 3-bullet summary of Meridian's Q2 priorities for the CEO.
   ```
   
   It should: lead with the point, use correct terminology, not start with "Certainly!", not include passive voice, not use any banned words.

5. If something slips through — add it to anti-style.md immediately.

---

## Module Checkpoint

- [ ] `ABOUT-ME/CLAUDE.md` is complete with all sections filled in
- [ ] `ABOUT-ME/anti-style.md` has at least 5 concrete rules
- [ ] You've tested the combination and verified Claude follows both files
- [ ] Any violations you found have been added to anti-style.md

---

## Next: Module 0.5
Slash commands and skills — the most powerful (and most underused) feature in Claude Code.

```
/start-m0-5
```
