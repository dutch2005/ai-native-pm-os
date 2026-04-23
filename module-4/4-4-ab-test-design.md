# Module 4.4 — A/B Test Design: Experiments That Produce Real Decisions

**Time:** ~35 minutes  
**Outcome:** A complete experiment brief + interpretation framework that prevents false positives

---

## The Peeking Problem (Real, Not Theoretical)

From Reddit r/ProductManagement (117 upvotes — a highly resonant discussion):
> *"I keep checking results every day, and the moment p < 0.05 I call it and ship. We've got this, yay! Turns out this is the peeking problem — every time we check results early, we increase the chance of seeing a 'significant' result purely by luck."*

If you've ever declared a winner before the test was done, you've shipped noise. This module fixes that permanently.

---

## Part 1: Pre-Experiment Design Brief

The most important part of an experiment happens before you run it.

```
I want to run an A/B test on Meridian's onboarding flow.

Help me write an experiment brief with these sections:

HYPOTHESIS:
"We believe that [change] will result in [measurable outcome] 
because [reason based on user research or data]."

VARIANTS:
- Control: describe the current state
- Variant A: describe the specific change

PRIMARY METRIC: The one metric that determines win/loss.
(Must be: measurable in our analytics, sensitive to this change, 
and directly tied to our OKR)

GUARDRAIL METRICS: Secondary metrics we must not harm.
(If any guardrail metric degrades by >10%, we kill the test regardless of primary)

MINIMUM DETECTABLE EFFECT: What lift is worth shipping?
(Express as absolute change: "We need at least +5pp in activation rate to justify the engineering effort")

SAMPLE SIZE: Given our traffic of [X sessions/week], how long must we run this?
(Use this formula: n = 16 × σ² / δ², where σ² ≈ p(1-p) for proportions and δ is your MDE.
Or use a calculator: https://www.evanmiller.org/ab-testing/sample-size.html —
set "Baseline conversion rate" = your current rate, "Minimum Detectable Effect" = your MDE,
confidence = 95%, power = 80%. The result is the required sample per variant.
For Meridian: ~180 weekly signups × 2 variants → confirm the run duration needed.)

ANALYSIS PLAN: How will we analyze results?
- How often can we check? (Recommendation: set a fixed analysis date, no peeking)
- What statistical test will we use?
- How will we segment? (Region, plan type, user type)

Meridian context:
- Current 30-day activation rate: 67%
- Weekly new trial signups: ~180
- Target improvement: +5pp
- OKR: Reduce activation time from 11 days → 7 days

Fill in all sections. Flag any assumptions I need to verify before launching.
Save to: CLAUDE-OUTPUTS/data-analysis/onboarding-ab-brief.md
```

---

## Part 2: Pre-Registered Analysis (Before You See Results)

This step prevents analysis bias — you decide how to analyze the data before you look at it.

```
Before I check the results of our onboarding test, help me pre-register my analysis plan.

Write the following commitments:

1. PRIMARY DECISION RULE: "We will call this test when [sample size] is reached, 
   not before. We will ship the variant only if [primary metric] improves by at 
   least [MDE] at 95% confidence AND [guardrail metric] does not decrease by >10%."

2. SEGMENTATION PLAN: "We will break results down by [region / plan type / 
   new vs returning], but these sub-groups cannot override the overall result."

3. INCONCLUSIVE RULE: "If we reach target sample size without a clear winner, 
   we will [kill the test / run for additional X weeks / commit to a follow-up test]."

4. STOPPING RULE: "We will stop the test early only if [guardrail metric] 
   degrades by >15% OR the variant causes user-facing errors at a rate >2%."

Save as: CLAUDE-OUTPUTS/data-analysis/onboarding-ab-pre-registration.md
```

Now you have a public commitment. Stick to it.

---

## Part 3: Post-Experiment Interpretation

Run this only after the pre-registered end date:

```
The onboarding A/B test has concluded. Here are the results:

Control: 1,240 users, 67.4% activated (835 activations)
Variant A: 1,258 users, 72.1% activated (907 activations)
Lift: +4.7pp
P-value: 0.032
Test duration: 28 days (matched pre-registered plan)

Guardrail metrics:
- Time to first workflow created: Control 3.2 days, Variant 3.1 days (no degradation ✅)
- Support tickets: Control 12, Variant 9 (no degradation ✅)

Read CLAUDE-OUTPUTS/data-analysis/onboarding-ab-pre-registration.md.
Check these results against every pre-registered commitment.

Write an experiment verdict:
1. Does the result meet the primary decision rule? (Explain)
2. Does the lift clear the MDE of +5pp? (Note: 4.7pp is close — your call)
3. Do all guardrail metrics pass?
4. What is your recommendation: SHIP / KILL / INVESTIGATE FURTHER?
5. If SHIP: what is the expected business impact?
   (Use Meridian's 142 customers and $29,500 ACV as baseline)

Write as a decision memo. Audience: Dev Kapoor.
One paragraph per section. Close with a single decision sentence.
Save to: CLAUDE-OUTPUTS/data-analysis/onboarding-ab-verdict.md
```

---

## The Real Question About MDE

The 4.7pp vs 5pp MDE question above is intentional. This is the judgment call only a PM can make:

> Is the engineering cost of shipping this change worth a 4.7pp improvement instead of 5pp? Is the test underpowered, or is 4.7pp genuinely less meaningful?

Claude helps you frame the question. You make the call.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Pre-experiment design brief written for one real or mock Meridian test
- [ ] Analysis plan pre-registered before seeing results
- [ ] Experiment verdict memo written against the pre-registered commitments
- [ ] You can explain the peeking problem to an engineer in two sentences

---

## Next: Module 4.5
The automated weekly digest via Cowork Dispatch — runs while you sleep.

```
/start-m4-5
```
