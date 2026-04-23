# Module 6.5 — Strategy One-Pagers, OKRs, and the Quarterly Business Review

**Time:** ~45 minutes  
**Outcome:** A full QBR packet — strategy one-pager, OKR update, and the narrative that ties them together

---

## What Lives in Module 6.5

This is the capstone of the Strategy module. You've built:
- Opportunity sizing (6.1)
- Prioritization models (6.2)
- Executive narrative (6.3)
- Objection simulation (6.4)

Now you assemble them into the full quarterly packet that senior PMs own: the QBR.

---

## Part 1: The Strategy One-Pager

Different from the executive one-pager in 6.3. That was for a specific decision. This is your product strategy — the 12-month view of where you're going and why.

```
Write a Product Strategy One-Pager for Meridian OS for H2 2025.

Use this structure:

━━━ WHERE WE PLAY ━━━
Market: [ICP, segment, geography]
Stage: [Series B, $4.2M ARR, scaling to $10M]
Time horizon: [12 months]

━━━ HOW WE WIN ━━━  
Our differentiation in one sentence:
"Meridian wins because [specific capability] that [competitor A] can't match 
because [structural reason] and [competitor B] hasn't prioritized because [reason]."

━━━ WHAT WE'RE BUILDING ━━━
Three strategic initiatives (not a feature list — initiatives):
1. [Initiative name]: [What it achieves and for whom]
2. [Initiative name]: [What it achieves and for whom]
3. [Initiative name]: [What it achieves and for whom]

━━━ HOW WE MEASURE SUCCESS ━━━
Three metric targets for the next 12 months:
- [Metric]: from [current] to [target] by [date]
- [Metric]: from [current] to [target] by [date]
- [Metric]: from [current] to [target] by [date]

━━━ WHAT WE'RE NOT DOING ━━━
Two explicit strategic bets we're NOT making (and why):
These build credibility by showing what we've ruled out deliberately.

━━━ THE BIG RISK ━━━
One sentence: What would have to be true for this strategy to fail?

Context: PROJECTS/meridian-os/CLAUDE.md, OKRs, roadmap.
Audience: Board of directors + exec team.
Length: Exactly one page when formatted at 11pt.
Save to: CLAUDE-OUTPUTS/strategy-docs/h2-product-strategy.md
```

---

## Part 2: The OKR Quarterly Update

Boards and executives don't want to know if OKRs are on track — they want to know what you're doing about the ones that aren't.

```
Read PROJECTS/meridian-os/CLAUDE.md (for Q2 OKRs and targets).
Read the most recent metrics from PROJECTS/meridian-os/analytics/.
(If you haven't added metrics data yet, create a file at PROJECTS/meridian-os/analytics/q2-metrics-snapshot.md
with the Meridian metrics from Module 4.5's mock weekly-export.csv as a starting point.)

Write the Q2 OKR update for the board:

For each Key Result:
1. Target: [the original KR]
2. Current: [actual value from data]
3. % to target: [calculated]
4. Status: ✅ On Track | ⚠️ At Risk | ❌ Behind

For any KR marked ⚠️ or ❌:
- What is the root cause? (specific, not vague)
- What specific action are we taking before quarter close?
- What is the revised expectation? (be honest — boards respect recalibration)

For any KR marked ✅:
- What drove the performance?
- Is there any risk to the trajectory in the next 4 weeks?

Closing paragraph: Overall Q2 assessment in 60 words.
Is the quarter recoverable? What's the single most important lever for the next 4 weeks?

Audience: Board + investors. Honest tone. Numbers first.
Save to: CLAUDE-OUTPUTS/strategy-docs/q2-okr-update.md
```

---

## Part 3: Assembling the QBR Packet

```
I need to assemble a QBR packet from the files I've created.

Read:
- CLAUDE-OUTPUTS/strategy-docs/h2-product-strategy.md
- CLAUDE-OUTPUTS/strategy-docs/q2-okr-update.md
- CLAUDE-OUTPUTS/strategy-docs/q2-board-narrative.md
- CLAUDE-OUTPUTS/strategy-docs/tam-sam-som-model-[date].md

Create a QBR Packet index document with:

1. EXECUTIVE SUMMARY (100 words): The 5-line version of the entire QBR. 
   Write this last, but display it first.

2. DOCUMENT INDEX:
   | Document | Key Question It Answers | Audience |
   - H2 Product Strategy | Where are we going? | Board
   - Q2 OKR Update | How did we perform? | Board + exec  
   - Board Narrative | What's the product story? | Board
   - TAM/SAM/SOM | How big is the opportunity? | Investors

3. OPEN ITEMS for board discussion (2-3 questions you want input on):
   Frame as "We'd value board perspective on: [specific question]"
   These are real decisions, not rhetorical setups.

4. APPENDIX LIST: What supporting data is available on request.

Save to: CLAUDE-OUTPUTS/strategy-docs/qbr-packet-q2.md
```

---

## The Senior PM Plateau — How This Module Helps

From Reddit r/ProductManagement (99 upvotes):
> *"The jump often requires a significant shift in strategic scope, essentially owning a whole product line or a major P&L, not just a feature set."*

The QBR packet is that shift made visible. Every document in Module 6 moves you from:
- "I manage features" → "I own a product area's strategy"
- "I write specs" → "I set the direction and defend it at board level"
- "I report metrics" → "I make the case for what to do next"

The PM who can assemble and present a QBR packet is operating at Director/VP level regardless of their title.

---

## Module 6 Complete ✅

You now have the complete strategy toolkit:
- 6-1: TAM/SAM/SOM + sensitivity analysis
- 6-2: Roadmap prioritization (multi-frame + challenge)
- 6-3: Executive one-pager + board narrative
- 6-4: Objection simulation (CTO/CFO roleplay)
- 6-5: Strategy one-pager + OKR update + QBR packet

**Start Module 7:**
```
/start-m7-1
```

*Module 7: MCP & Tool Integrations — connecting Claude to your actual work tools.*
