# Module 6.2 — Roadmap Reasoning: Stress-Test Every Prioritization Decision

**Time:** ~40 minutes  
**Outcome:** A roadmap that survives stakeholder scrutiny because you've already challenged it yourself

---

## Why Roadmaps Get Challenged

You present the roadmap. The CTO asks: "Why this feature and not Feature X?" You explain. They say "That's not how I'd prioritize it." The meeting ends inconclusively.

This happens for one reason: you built the roadmap with a single frame. The CTO is applying a different frame — engineering feasibility. The CFO would apply ROI. The Head of Sales would apply deal velocity.

Multi-frame roadmap reasoning prevents this. You build the roadmap, then you stress-test it from every frame before anyone else does.

---

## The Four Prioritization Frames

| Frame | Question | Best for |
|-------|---------|---------|
| **Impact × Effort (RICE-like)** | What's the best ROI on engineering time? | Resource-constrained environments |
| **Sequencing** | What must be built first to unlock the next thing? | Dependency-heavy roadmaps |
| **Strategic fit** | What moves us toward the 3-year vision? | Companies with a clear north star |
| **Defensive** | What keeps us from losing customers we already have? | High churn environments |

The best roadmaps pass all four frames. Most only survive one.

---

## Stage 1: Build the Prioritization Model

```
Read PROJECTS/meridian-os/roadmap.md and PROJECTS/meridian-os/okrs.md.

Extract all features in the active roadmap. 

For each feature, score it on four frames:

IMPACT × EFFORT (1-10 each):
- Impact: Revenue or retention impact if shipped (10 = transforms a KR, 1 = negligible)
- Effort: Engineering complexity (10 = very complex, 1 = trivial)
- Score = Impact / Effort  ← higher is better

> Note: Impact here means *business outcome* (revenue, retention, activation). This is different from Strategic Fit below, which measures OKR alignment. Run both — they often disagree, and the disagreement is the conversation worth having.

SEQUENCING:
- Does this feature unlock another feature? (dependency value)
- Does any feature depend on this one being done first?

STRATEGIC FIT (1-5):
- How directly does this feature advance our Q2 OKR? ← this is a different question from Impact above
- Would this feature still matter if we were 10x our current size?

> If Impact × Effort and Strategic Fit rank features differently, don't average them away — flag the divergence explicitly. "This feature scores high on business impact but low on OKR fit" is useful information for your team to debate.

DEFENSIVE VALUE (1-5):
- Does this reduce churn risk?
- Does this address a feature gap competitors have?

Return as a table. Then recommend the top 3 features to prioritize based on 
the combined model, with a one-paragraph rationale for each.

Save to: CLAUDE-OUTPUTS/strategy-docs/roadmap-prioritization-model.md
```

---

## Stage 2: Challenge Your Own Ranking

This is the step most PMs skip:

```
Read CLAUDE-OUTPUTS/strategy-docs/roadmap-prioritization-model.md.

Now challenge the top 3 priorities with hard questions:

FOR PRIORITY #1:
- What's the weakest assumption in the Impact score?
- What would have to be true for this feature to deliver zero impact?
- Is there a cheaper, faster way to get 80% of the benefit?

FOR PRIORITY #2:
- If engineering is slower than expected, does this still make sense?
- What's the opportunity cost — what are we NOT building instead?

FOR PRIORITY #3:
- Is this genuinely strategic, or is it stakeholder pressure masquerading as strategy?
- If we removed it from the roadmap, who would push back hardest, and why?

Return the challenges as a numbered list per priority.
Then: for each challenge, write how you'd defend the priority if asked this question live.

Save to: CLAUDE-OUTPUTS/strategy-docs/roadmap-challenge-responses.md
```

---

## Stage 3: Stakeholder-Framed Roadmap Views

Different audiences need different views of the same roadmap:

```
Read PROJECTS/meridian-os/roadmap.md and 
CLAUDE-OUTPUTS/strategy-docs/roadmap-prioritization-model.md.

Generate three versions of the same roadmap — same features, different framing:

DEV KAPOOR (CEO) VIEW — Revenue and market narrative:
"We're shipping [feature] in Q2 because it directly enables [revenue outcome] 
and positions us against [competitor] in the enterprise segment."
Format: 5 bullets, lead with ARR and customer count impact.

TARA NOVAK (CTO) VIEW — Engineering sequencing and risk:
Show the roadmap as a dependency chain. Which features must be done before others?
Highlight any technical risk in the current ordering.
Format: Gantt-style text description + 3 risk flags.

ROHAN MEHTA (Sales) VIEW — Deal velocity and objection removal:
"Here's what we're shipping that closes deals you're currently losing."
Map each roadmap item to a specific sales objection it removes.
Format: Table (Feature | Objection it removes | Deal size it unlocks).

Save all three to: CLAUDE-OUTPUTS/strategy-docs/roadmap-stakeholder-views.md
```

---

## The "RICE but Better" Template

Standard RICE (Reach × Impact × Confidence / Effort) works, but it treats all features the same. Add a Defensive modifier:

```
For each roadmap item, calculate:

Score = (Reach × Impact × Confidence) / Effort × Defensive Modifier

Where Defensive Modifier:
- 1.5x if this prevents churn for Tier 1 accounts
- 1.2x if this closes a feature gap vs. a competitor who's in active deals
- 1.0x for all other features

Return the final ranked list with scores visible.
Flag any feature where the Defensive Modifier changed its ranking position.
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

- [ ] Full prioritization model built for Meridian's active roadmap
- [ ] Top 3 priorities challenged with hard questions and responses prepared
- [ ] Three stakeholder-framed roadmap views generated
- [ ] RICE+ model applied with defensive modifier

---

## Next: Module 6.3
Executive narrative — writing the strategy document that makes your roadmap impossible to question.

```
/start-m6-3
```
