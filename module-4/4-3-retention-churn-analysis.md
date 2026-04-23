# Module 4.3 — Retention & Churn Analysis: Reading the Signals Before It's Too Late

**Time:** ~40 minutes  
**Outcome:** A churn analysis workflow that identifies at-risk accounts before they send the cancellation email

---

## Why Churn Is Always a Surprise (Until It Isn't)

The accounts that churn almost never do so without warning signals. Support tickets that weren't escalated. Feature usage that dropped off. An NPS score that slipped. A key champion who stopped logging in.

The problem isn't that the signals aren't there. It's that they live in four different tools, and nobody has time to synthesize them manually every week.

This module gives you the Claude workflow that reads all four signals simultaneously.

---

## The Four Churn Signal Sources

| Signal | Where It Lives | What It Reveals |
|--------|---------------|-----------------|
| Product usage | Analytics export | Are they actually using what they bought? |
| Support tickets | Helpdesk export | What frustrations are escalating? |
| Stakeholder activity | CRM notes | Is the champion still engaged? |
| NPS/CSAT verbatim | Survey export | How do they describe their experience? |

You don't need all four for every account. Two is enough to identify patterns. Four is enough to predict with confidence.

---

## The Weekly Account Health Scan

Create this mock data to practice the workflow:

```bash
# Create the mock data files
cat > PROJECTS/meridian-os/analytics/account-health-may.md << 'EOF'
# Meridian Account Health Snapshot — May 2025

## Tier 1 Accounts (ACV > $50K)

| Account | ARR | Renewal | Last Login | ORR/week | Support Tickets | NPS |
|---------|-----|---------|-----------|----------|----------------|-----|
| Apex Logistics | $72K | Aug | 12 days ago | 1,200 | 3 open | N/A |
| Bridgewater Finance | $85K | Sep | 2 days ago | 4,800 | 0 open | 9 |
| Coastal Ops | $61K | Jul | 28 days ago | 200 | 7 open | 3 |
| Datastream Co | $90K | Oct | 5 days ago | 3,600 | 1 open | 8 |
| Edgewood Corp | $52K | Jun | 45 days ago | 80 | 0 open | N/A |
EOF
echo "Mock data created"
```

---

## The Account Health Prompt

```
Read PROJECTS/meridian-os/analytics/account-health-may.md.

For each Tier 1 account, calculate a health score and churn risk:

HEALTH SCORE (100 points total):
- ORR (Orchestration Run Rate): 
  > 2,000 runs/week = 40 pts | 500-2000 = 25 pts | < 500 = 0 pts
- Last Login:
  < 7 days = 20 pts | 7-14 days = 15 pts | 15-30 days = 5 pts | > 30 days = 0 pts
- Support tickets:
  0 open = 20 pts | 1-2 open = 15 pts | 3-5 open = 5 pts | > 5 open = 0 pts
- NPS:
  8-10 = 20 pts | 6-7 = 10 pts | < 6 = 0 pts | N/A = 10 pts

CHURN RISK RATING:
75-100: Low risk ✅
50-74: Watch list ⚠️
0-49: Urgent intervention needed ❌

For each account:
1. Calculate and show the score breakdown
2. Assign the risk rating
3. Write a one-line "churn story" (what does this pattern suggest?)
4. Recommend one specific action for CS team

Return as a table, then list urgent actions sorted by renewal date.
Save to: CLAUDE-OUTPUTS/data-analysis/account-health-may.md
```

---

## Churn Root Cause Analysis (Multi-Source)

For any account rated ❌ Urgent, run this deeper analysis:

```
I need to understand why Coastal Ops is at churn risk.

Read all available data for this account:
- Their row in PROJECTS/meridian-os/analytics/account-health-may.md
- Any support tickets mentioning "Coastal" in PROJECTS/meridian-os/research/support-tickets/
- Any notes mentioning "Coastal" in PROJECTS/meridian-os/research/

Build a churn story:
1. TIMELINE: When did their usage start declining? (infer from ORR + last login)
2. PAIN SIGNALS: What have they complained about in support?
3. SENTIMENT: What does their NPS score (3) suggest about their emotional state?
4. PREVENTABLE?: Could we have caught this earlier? What was the first signal?
5. SAVE PLAY: What one action gives us the best chance of keeping them?

Write as an account brief for Rohan Mehta (Head of Sales) to use in an emergency renewal call.
Length: 200 words max. Start with the most critical fact.
Save to: CLAUDE-OUTPUTS/stakeholder-comms/coastal-ops-churn-brief.md
```

---

## Building the Automated Churn Routine

Once you have the account health prompt working, make it a weekly routine with Cowork:

> **Note on Cowork Dispatch:** The steps below use Claude Cowork's Scheduled Tasks feature. If this isn't available in your version of Claude Desktop, use the cron job fallback method from Module 4.5 instead — the prompt content is identical.

```
In Claude Desktop → Cowork:

Create a weekly routine named "Monday Account Health Scan"
Schedule: Every Monday at 7:00 AM

Instruction:
Read PROJECTS/meridian-os/analytics/account-health-[current-date].md.
Run the full account health scoring model.
Flag any account that moved from Low Risk to Watch List since last week.
Flag any account with a renewal within 60 days that is at Watch List or worse.
Generate urgent action items for those accounts.
Save output to CLAUDE-OUTPUTS/data-analysis/account-health-[date].md.
```

Now your Monday morning starts with a prioritized churn risk report, generated while you slept.

---

## The Cohort Retention Pattern

For product-level retention analysis (not account-level):

```
I have cohort data for Meridian. Here is the format:

Cohort Month | Week 0 | Week 4 | Week 8 | Week 12
Jan 2025     | 100%   | 72%    | 61%    | 54%
Feb 2025     | 100%   | 68%    | 55%    | 49%
Mar 2025     | 100%   | 74%    | 65%    | 59%

Analyze this cohort table:
1. Which cohort retains best at Week 12? What might explain it?
2. Which cohort drops fastest between Week 0 and Week 4? (Critical onboarding signal)
3. Is overall retention trending up or down across cohorts?
4. At the current trajectory, what will Week 12 retention be for the April cohort?
5. What is the business impact if we improve Week 4 retention by 5pp?
   (Use Meridian's current ACV of $29,500 and 142 customers as baseline)

Write as a retention brief for Tara Novak (CTO) — engineering implications only.
Save to: CLAUDE-OUTPUTS/data-analysis/cohort-retention-brief.md
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

- [ ] Account health scoring model run on all Tier 1 accounts
- [ ] At least one account identified as ❌ Urgent with a churn brief generated
- [ ] Monday Account Health Scan routine set up in Cowork
- [ ] Cohort retention pattern analyzed and framed for the CTO

---

## Next: Module 4.4
A/B test design and analysis — running experiments that produce real decisions, not noise.

```
/start-m4-4
```
