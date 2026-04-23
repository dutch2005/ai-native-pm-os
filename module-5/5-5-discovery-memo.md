# Module 5.5 — The Discovery Memo: From Research Chaos to Decision Clarity

**Time:** ~35 minutes  
**Outcome:** A single discovery memo that synthesizes everything you know into what the team should build next

---

## The Research Graveyard Problem

Most PM research dies in one of three places:
1. A Notion page nobody revisits
2. An interview recording nobody has time to watch
3. A synthesis doc that's too long for anyone to act on

The discovery memo is the antidote. It's short, opinionated, and built for decisions — not documentation.

---

## What Makes a Discovery Memo Different

| Research Synthesis | Discovery Memo |
|-------------------|---------------|
| Documents what you found | Argues what you should do |
| Comprehensive | Selective (only what changes a decision) |
| Written for your archive | Written for a specific decision and audience |
| Reports evidence | Makes a recommendation |
| 5–10 pages | 1–2 pages |

A discovery memo is a persuasive document. It has a point of view.

---

## The Multi-Source Synthesis Pattern

A great discovery memo synthesizes at minimum three sources. This is where Claude's parallel reading capability pays off:

```
Read all of these simultaneously:
- CLAUDE-OUTPUTS/research/interview-synthesis-q2.md
- CLAUDE-OUTPUTS/research/ticket-signals-march.md
- CLAUDE-OUTPUTS/research/jtbd-map-q2.md
- PROJECTS/meridian-os/research/competitive/competitive-overview.md

I want to write a discovery memo on this question:
"Should we prioritize OOO routing or bulk approval as the next Approval Routing feature?"

Synthesize the evidence across all four sources:

1. SIGNAL ALIGNMENT: Where do interviews, tickets, JTBD, and competitive data agree?
2. SIGNAL CONFLICT: Where do they disagree? Which source do we trust more and why?
3. THE GAP: What do users clearly want that we haven't addressed yet?
4. COMPETITIVE URGENCY: Is there a competitive reason to move on one of these faster?

Return as a 4-section evidence brief (not yet a memo — just the synthesis).
Flag any gap in the evidence: "We don't have data on X — this is an assumption."
```

---

## Writing the Discovery Memo

After the evidence brief:

```
Read the evidence brief above and write a discovery memo.

DISCOVERY MEMO: OOO Routing vs. Bulk Approval

Use this structure exactly:

━━━ THE QUESTION ━━━
"We need to decide: [specific decision in one sentence]"

━━━ WHAT WE KNOW ━━━
The 3 most important findings from the research. Each one:
- Finding (stated as a fact)
- Source (where it came from)
- Implication (what it means for the decision)

━━━ WHAT WE DON'T KNOW ━━━
2 assumptions we're making that could be wrong.
What would we need to learn to validate them?

━━━ THE RECOMMENDATION ━━━
One clear recommendation. No hedging.
Format: "Build [X] before [Y] because [1 reason]."

━━━ THE RISK OF BEING WRONG ━━━
If we choose wrong — what's the worst case? How reversible is it?
One paragraph. Be honest.

Audience: Tara Novak (CTO) for technical feasibility sign-off.
Length: 300 words max.
Tone: Opinionated and data-grounded. No "it depends."

Save to: CLAUDE-OUTPUTS/research/discovery-memo-ooo-vs-bulk.md
```

---

## The Anti-AI-Slop Check

From Reddit r/ProductManagement (145 upvotes):
> *"Working with this senior PM feels like working with AI. He speaks in generalities. Constantly uses phrases like 'what is the problem we are trying to solve here?' but none of his initiatives move forward. His documents are mostly written by AI and are not helpful."*

The risk is real. Run this check on any discovery memo before sharing it:

```
Read CLAUDE-OUTPUTS/research/discovery-memo-ooo-vs-bulk.md.

Check this document for "AI slop" patterns:

FLAG if the document contains:
- Generic PM phrases without evidence ("we need to understand the user's journey", 
  "it's important to consider", "this will help us achieve")
- Recommendations without specific data backing them
- Hedging language that avoids commitment ("it depends", "this could potentially")
- Framework names dropped without application ("using JTBD thinking...")
- Passive voice that hides who's responsible for what

For each flagged instance: show the original text and a more specific rewrite.

A clean document should read like: specific claim + specific evidence + specific recommendation.
Not: vague observation + framework name + non-committal suggestion.
```

This check is the difference between a document that gets a decision made and one that gets filed.

---

## Module 5 Complete ✅

You now have the full discovery pipeline:
- 5-1: Interview synthesis at scale (parallel extraction)
- 5-2: Support ticket mining (product signals from CS data)
- 5-3: Competitive intelligence (signal over noise)
- 5-4: JTBD mapping (jobs from existing research)
- 5-5: Discovery memo (research chaos → decision clarity)

**Start Module 6:**
```
/start-m6-1
```

*Module 6: Strategy & Stakeholder Work — from opportunity sizing to board-ready narratives.*
