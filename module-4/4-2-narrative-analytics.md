# Module 4.2 — Narrative Analytics: From Numbers to Insight Memos

**Time:** ~35 minutes  
**Outcome:** A habit of writing analytics memos that start with the insight, not the data

---

## What Separates a PM Who Has Data from a PM Who Has Insight

From Reddit r/ProductManagement:
> *"A lot of A/B test 'wins' are just fake. I keep checking results every day, and the moment p < 0.05 I call it and ship. Turns out this is the peeking problem."*

Data without interpretation is noise. The PM who can read a number and immediately say *what it means and what to do* is the PM who gets promoted.

This module teaches the narrative analytics pattern — the skill of turning any data into a decision-relevant memo.

---

## The Core Structure: Pyramid Principle for Data

The pyramid principle in data writing: **lead with the insight, support with the evidence, close with the action.**

```
Opening line:    THE SINGLE MOST IMPORTANT THING (insight)
Body paragraphs: What the data shows (evidence, 2–3 paragraphs)
Closing:         What to do about it (one recommendation)
```

Most PMs write this backwards — they lead with the data setup, build to the insight, and forget the recommendation. That's the wrong order for busy executives.

---

## The Narrative Analytics Formula

For any dataset:

```
Read [data file].

Write a narrative analytics memo using this structure:

OPENING LINE (mandatory): The single most important finding, stated as 
a fact with a number. No preamble. No "This week we looked at..."
Example: "Our activation rate dropped 4 percentage points this week, 
reversing three weeks of gains."

SECTION 1 — WHAT HAPPENED: 
Describe the key movements in the data. Quantify everything. 
Use % and absolute numbers together.
Avoid: "activation went down." 
Use: "Activation fell from 71% to 67% (-4pp), the first decline since March."

SECTION 2 — WHY IT MIGHT HAVE HAPPENED:
Offer 2–3 hypotheses. State your confidence level for each.
Connect to anything that changed this week (new feature, change in traffic, seasonal).
Be explicit about what you don't know.

SECTION 3 — WHAT TO WATCH NEXT WEEK:
2 specific metrics to monitor. What would confirm or refute each hypothesis.

CLOSING LINE: One recommended action.
Format: "If [hypothesis], then [action]. If not, then [alternative action]."

Audience: [CEO / Head of Design / CFO — state before generating]
Length: 250–400 words.
```

---

## Applied to the Meridian Funnel

```
Read PROJECTS/meridian-os/analytics/q1-activation-funnel.csv

Write a narrative analytics memo for Dev Kapoor (CEO).

Opening: State the most important funnel insight in one sentence.

What happened: Walk through funnel performance week 1-6, 
focusing on where conversion is lost (not gained).

Why: Generate 2 hypotheses for the biggest drop-off stage.
One hypothesis should be product-side. One should be go-to-market side.

What to watch: Name 2 leading indicators to track next week.

Recommendation: One action we can take in the next sprint to address the 
top drop-off stage.

Audience: Dev Kapoor — max 3 bullets in any list, lead with numbers.
Save to: CLAUDE-OUTPUTS/data-analysis/q1-funnel-narrative-memo.md
```

---

## The A/B Test Interpretation Pattern

This addresses a real r/ProductManagement pain point — PMs calling tests too early:

```
I have A/B test results. Before I interpret them, run the following checks:

Data: [paste your test summary or point to a file]

CHECK 1 — SAMPLE SIZE:
Was the sample size determined before the test started?
Is the current sample large enough for the observed effect?
Estimate: given the effect size, what sample size would we need?

CHECK 2 — PEEKING:
How many days has this test been running?
What was the intended runtime?
If we're calling it before the intended end date, what's the false positive risk?

CHECK 3 — STATISTICAL SIGNIFICANCE:
Is p < 0.05 at the current sample size?
What is the confidence interval for the observed lift?
Is the lift practically significant (not just statistically significant)?

CHECK 4 — GUARDRAIL METRICS:
Did any secondary metrics move in the wrong direction?
If so, should this override the primary metric win?

DECISION: Based on checks 1-4, recommend: 
SHIP / KILL / KEEP RUNNING (with specific end date)

Write as a decision memo. Max 300 words. Audience: Dev Kapoor.
```

---

## Building Your Analytics Voice

Every PM has a different way of thinking about data. Build your own into Claude's vocabulary:

```
Read ABOUT-ME/anti-style.md and ABOUT-ME/CLAUDE.md.

Here is how I think about analytics:
- I always lead with what it means for the business, not what the metric is
- I use ranges, not point estimates ("between 60–70%" not "65.3%")
- I distinguish between "we know" and "we think" explicitly
- I never say "significant" without specifying practical vs. statistical
- I end with a specific, time-bound recommendation

Update my anti-style.md with an "Analytics Voice" section that encodes these preferences.
From now on, apply them to every analytics memo you write for me.
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

- [ ] You've written a narrative funnel memo for the Meridian data
- [ ] The opening line leads with a finding (not a setup)
- [ ] You've run the A/B test interpretation checks on any test you have access to
- [ ] Your analytics voice is encoded in anti-style.md

---

## Next: Module 4.3
Retention cohort analysis — reading the data that predicts churn before it happens.

```
/start-m4-3
```
