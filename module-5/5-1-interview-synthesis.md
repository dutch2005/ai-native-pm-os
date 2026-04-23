# Module 5.1 — Interview Synthesis at Scale

**Time:** ~45 minutes  
**Outcome:** A complete research synthesis from 10 interview transcripts, extracted into themes with evidence quotes

---

## The Research Problem at Scale

One interview is easy to synthesize. You read it, take notes, remember the key quotes.

Ten interviews is where most PMs break down. You lose track of which theme came from which interview. You over-represent the last interview you read. You miss cross-cutting patterns because you're holding too many things in memory.

Claude solves this. Ten transcripts processed in parallel, themes extracted across all of them, evidence mapped to sources.

This module teaches you the interview synthesis workflow.

---

## The Synthesis Workflow

```
Step 1: Prepare transcripts (clean, structured files)
Step 2: Run parallel extraction (themes + quotes per interview)
Step 3: Cross-interview theme clustering
Step 4: Evidence mapping (which themes appear in N+ interviews)
Step 5: Discovery memo synthesis
```

---

## Step 1: Prepare Your Transcripts

Each transcript should be a separate `.md` file with a consistent structure:

```markdown
# Interview: [Persona Name], [Role], [Company type]
**Date:** [Date]
**Interviewer:** [Name]
**Duration:** [X minutes]

---

## Context
[1–2 sentences on why they agreed to talk]

## Raw Transcript / Key Excerpts

[Q]: [Your question]
[A]: "[Their answer verbatim or lightly cleaned]"

[Q]: [Next question]  
[A]: "[Answer]"

## Interviewer Notes
[Your post-interview observations — what wasn't said, body language, energy, etc.]
```

You've already created 3 mock interviews in Module 2.3. Add 3 more now:

```bash
cat > PROJECTS/meridian-os/research/interviews/interview-04.md << 'EOF'
# Interview: James Park, Operations Director, FinScale Corp
Date: 2025-04-08

[Q]: Walk me through your current approval process for vendor payments.
[A]: "We have an email chain. It goes to the requester's manager, then 
finance, then me. If anyone is out, it stops. We had a vendor payment 
delayed 18 days because one person was on parental leave."

[Q]: What would fix this?
[A]: "Automatic escalation to backup approvers. And I want to see the 
whole chain on a dashboard. Right now I have no idea what's pending."

Pain: OOO escalation + visibility
Would pay for: Real-time approval visibility, automatic escalation routing
EOF

cat > PROJECTS/meridian-os/research/interviews/interview-05.md << 'EOF'
# Interview: Preethi Sharma, Chief of Staff, GrowthWave
Date: 2025-04-10

[Q]: How do you currently handle cross-department approval workflows?
[A]: "It's a mess. Each department has their own system. HR uses 
Greenhouse, Finance uses a spreadsheet, Legal uses email. Nothing 
talks to each other. I spend 20% of my time being the integration layer."

[Q]: What's the cost of that?
[A]: "Last quarter we had a headcount offer go out before Finance approved 
the budget. Cost us $40K in backfill costs when we had to rescind."

Pain: Cross-tool fragmentation, no single source of truth
Would pay for: One system that connects all departmental approval flows
EOF

cat > PROJECTS/meridian-os/research/interviews/interview-06.md << 'EOF'
# Interview: David Chen, VP Finance, Nexus Analytics
Date: 2025-04-12

[Q]: Tell me about your monthly approval cycle.
[A]: "It's brutal. We have 200+ invoices that need two or three approval 
levels. The biggest bottleneck is always at the CFO level for anything 
over $25K. I want conditional routing — anything under $10K should 
auto-approve, $10–50K goes to controller, over $50K goes to CFO."

[Q]: Does that logic exist anywhere today?
[A]: "In my head and in a spreadsheet. That's it. When I'm out, 
everything waits for me."

Pain: Manual threshold-based routing, no conditional logic
Would pay for: Condition-based routing by amount, department, or requester
EOF
```

---

## Step 2: Parallel Extraction

```
I have 6 interview transcripts in PROJECTS/meridian-os/research/interviews/.
Read all 6 simultaneously and for each interview extract:

1. Primary pain (the core problem they described)
2. Secondary pain (a related or downstream problem)
3. Exact quote that best captures their pain (verbatim)
4. "Would pay for" signal (what solution they described wanting)
5. Surprise insight (anything unexpected or that you didn't predict)

Return as a table with columns: Interview | Primary Pain | Secondary Pain | Key Quote | Would Pay For | Surprise

Do not synthesize yet — just extract from each interview independently.
```

---

## Step 3: Theme Clustering

```
Based on the extraction table, identify recurring themes across the 6 interviews.

A theme qualifies only if it appears in 3 or more interviews.

For each qualifying theme:
- Name the theme (2–4 words)
- Count: how many of 6 interviews include it?
- Evidence: list the supporting quote from each interview
- JTBD framing: "When [situation], I want to [motivation] so I can [outcome]"
- PM implication: what does this tell us to build?
```

---

## Step 4: Evidence Mapping

```
Create an evidence map as a table:

| Theme | Interview 1 | Interview 2 | Interview 3 | Interview 4 | Interview 5 | Interview 6 |
|-------|-------------|-------------|-------------|-------------|-------------|-------------|
| [Theme 1] | ✓ quote | - | ✓ quote | ✓ quote | - | ✓ quote |

Use ✓ with a 5-word quote snippet if present, - if not.
This becomes the evidence appendix for your discovery memo.
```

---

## Step 5: The Discovery Memo

```
Read all extraction work above and write a discovery memo.

Structure:
1. HEADLINE FINDING (one sentence — the most important thing we learned)
2. WHAT WE LEARNED (3 themes, each with: description, evidence count, representative quote)
3. JOBS-TO-BE-DONE (2–3 JTBD statements derived from the themes)
4. WHAT WE DID NOT FIND (things we hypothesized but saw no evidence for)
5. OPEN QUESTIONS (what these interviews couldn't answer that we need to resolve)
6. RECOMMENDED NEXT STEPS (max 3, specific and actionable)

Audience: Priya (Head of Design) — she needs user evidence before approving design work.
Length: 400–600 words.

Save to: CLAUDE-OUTPUTS/research/interview-synthesis-q2.md
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

- [ ] All 6 interview files exist in PROJECTS/meridian-os/research/interviews/
- [ ] Parallel extraction table generated with all 6 interviews
- [ ] At least 2 qualifying themes identified (appear in 3+ interviews)
- [ ] Evidence map created showing theme presence per interview
- [ ] Discovery memo saved to CLAUDE-OUTPUTS/research/

---

## Next: Module 5.2
Support ticket mining — find patterns in Zendesk/Intercom exports.

```
/start-m5-2
```
