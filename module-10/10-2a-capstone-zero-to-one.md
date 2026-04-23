# Module 10.2A — Capstone: The "Zero to One" Track

**Time:** ~60 minutes  
**Outcome:** A complete strategic foundation and MVP spec for Meridian Insights

---

## Scenario Context: Meridian Insights

Meridian OS currently automates workflows (if X happens, do Y).
The Board wants to move from *automation* to *prediction*.

**The Concept:** Meridian Insights. An AI layer that looks at historical workflow data and predicts bottlenecks. Example: "Based on past data, workflows involving the Legal team on Fridays take 4x longer. We suggest routing to external counsel."

**Your constraints:**
- You have exactly one engineering squad (1 EM, 3 Eng, 1 Designer).
- The CEO wants to announce this at an industry conference in 8 weeks.
- You have no historical AI features in the product.

---

## Step 1: The Strategic One-Pager

You need to justify why this is worth building before engineering writes a line of code.

```
Task: Write the Strategic One-Pager for Meridian Insights.

Use the template from Module 6.3.

Crucial elements to include:
1. The Situation: Why prediction, and why now? (Hint: competitive pressure from Zapier's new AI features).
2. The Opportunity: What is the ARR expansion opportunity for upselling this to existing Tier 1 customers?
3. What We're NOT Doing: Set a strict boundary to prevent this from turning into a 6-month generic AI project.

Save to: CLAUDE-OUTPUTS/capstone/insights-strategy.md
```

---

## Step 2: The Lightweight Spec (MVP)

You have 8 weeks. A full predictive engine takes 6 months. You need an MVP that provides value and proves the concept.

```
Task: Write the Lightweight Spec for the Meridian Insights MVP.

Use the template from Module 3.4.

Crucial elements to include:
1. Feature Scope: Focus ONLY on "Bottleneck Identification" (showing the user where workflows currently get stuck), not "Predictive Routing" (automatically changing the route).
2. Success Metrics: What proves this MVP is valuable enough to keep investing in?

Save to: CLAUDE-OUTPUTS/capstone/insights-mvp-spec.md
```

---

## Step 3: The Landing Page Prototype

To build excitement internally and validate with beta customers, you need a marketing prototype.

```
Task: Build an interactive HTML prototype of the "Meridian Insights" landing page.

Use the workflow from Module 9.1 and 9.4.

Requirements:
- A strong hero section with a compelling H1 ("Stop guessing where work gets stuck").
- A mock "Insight Card" that shows what the feature looks like (e.g., a card warning about the Legal team bottleneck).
- A "Join the Beta" email capture form (just the UI, no backend needed).
- Dark theme to match Meridian's brand.

Iterate until it looks premium enough to show the CEO.
Save to: CLAUDE-OUTPUTS/prototypes/insights-landing-page.html
```

---

## Step 4: Competitive Context

Every strategic bet needs a "why not the alternatives" argument. This is table stakes in any board review or PM interview.

```
Task: Write a Competitive Context section for Meridian Insights.

For each of the 2–3 alternatives below, write one sentence explaining why it doesn't 
fully solve the problem we're addressing:

1. Zapier's new AI-powered Copilot features — how do they differ from prediction?
2. Building a generic BI dashboard on top of Meridian workflow data
3. Buying/licensing a third-party ML platform instead of building in-house

Frame this as: "[Alternative] doesn't solve [specific gap] because [reason]."

Add this section to: CLAUDE-OUTPUTS/capstone/insights-strategy.md
```

---

## Step 5: How We'd Know It's Working

A shipped feature without a measurement plan is a guess.

```
Task: Write the Measurement Plan for Meridian Insights.

Structure it as:

LEADING INDICATORS (30 days — signals the feature is gaining traction):
- [Metric]: target [value]
- [Metric]: target [value]

LAGGING INDICATORS (60 days — signals it's creating real value):
- [Metric]: from [baseline] to [target]

LAGGING INDICATORS (90 days — signals business impact):
- [Metric]: from [baseline] to [target]

KILL METRIC: One metric that, if we miss it at 60 days, tells us to stop investing.
Format: "If [metric] is below [threshold] by [date], we pause the roadmap and reassess."

Context: 142 current customers, $29,500 ACV. Beta cohort is expected to be 15–20 Tier 1 accounts.

Add this section to: CLAUDE-OUTPUTS/capstone/insights-mvp-spec.md
```

---

## Final Review

Once you have completed all steps, run this self-audit:

```
Read:
- CLAUDE-OUTPUTS/capstone/insights-strategy.md
- CLAUDE-OUTPUTS/capstone/insights-mvp-spec.md

Are these documents aligned? Does the spec actually deliver the value promised in the strategy? Is it realistically buildable in 8 weeks?
```

If the audit passes, you have completed the Zero to One track.

---

## Next Steps
Proceed to Module 10.3 to lock in the mental models:
```
/start-m10-3
```
