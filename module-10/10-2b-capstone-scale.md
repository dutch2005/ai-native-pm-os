# Module 10.2B — Capstone: The "Scale & Optimize" Track

**Time:** ~60 minutes  
**Outcome:** A data-driven analysis and interactive onboarding fix for Meridian's activation drop-off

---

## Scenario Context: The Activation Problem

Meridian's "Approval Routing" feature is widely adopted, but the onboarding funnel is leaking.

**The Data (Last 30 Days):**
- Users who start creating a workflow: 1,240
- Users who add at least one condition: 890 (71%)
- Users who add an approver: 420 (33%)
- Users who actually publish the workflow: 310 (25%)

**The Problem:** The drop-off between adding a condition and adding an approver is massive. Customer Support notes suggest users are confused about how to configure "Backup Approvers" if the primary is OOO.

---

## Step 1: The Narrative Analytics Memo

You need to present this problem to the leadership team without boring them with raw data.

```
Task: Write a Narrative Analytics Memo about the onboarding drop-off.

Use the structure from Module 4.2 (The Pyramid Principle).

Crucial elements to include:
1. The Opening: State the exact drop-off percentage and what it costs us in lost active users.
2. The "Why": Present the hypothesis based on the Customer Support notes.
3. The Recommendation: Propose an immediate A/B test to simplify the approver selection step.

Save to: CLAUDE-OUTPUTS/capstone/activation-analytics-memo.md
```

---

## Step 2: The A/B Test Design Brief

You cannot just "fix it" and hope. You need to prove your fix works.

```
Task: Write an A/B Test Design Brief for the onboarding fix.

Use the structure from Module 4.4.

The Variant (What you are testing):
Currently, "Backup Approver" is a required field. The variant will make it an optional "Advanced Setting" hidden behind an accordion, streamlining the primary flow.

Crucial elements to include:
1. Primary Metric: Conversion rate from "add condition" to "publish".
2. Guardrail Metric: Support ticket volume (if we hide the setting, do users complain they can't find it?).
3. Pre-registered decision rule: What lift do we need to see to ship the variant?

Save to: CLAUDE-OUTPUTS/capstone/activation-ab-test-design.md
```

---

## Step 3: The Interactive Onboarding Prototype

You need to show design and engineering exactly what the variant looks like.

```
Task: Build an interactive HTML prototype of the new Approver Selection UI.

Use the workflow from Module 9.4.

Requirements:
- A clean card interface for "Step 3: Select Approvers".
- A primary dropdown to select the main approver.
- A subtle text link or icon that says "Advanced Settings" or "Add Backup Approver".
- When clicked, it smoothly expands to show the backup approver UI (from Module 9.4).
- A "Publish Workflow" button that shows a success state.

Iterate until the interaction feels seamless and the primary flow is obviously faster than the advanced flow.

Save to: CLAUDE-OUTPUTS/prototypes/approver-selection-variant.html
```

---

## Step 4: Competitive Context

Fixing an onboarding problem is a choice. Explain why this approach over the alternatives.

```
Task: Write a Competitive Context section for the Approver Selection fix.

For each alternative approach below, write one sentence explaining why it falls short:

1. Removing the "Backup Approver" field entirely (simplest version)
2. Adding an in-product tooltip or help text instead of restructuring the UI
3. Fixing this with a guided onboarding checklist overlay instead of changing the form

Frame each as: "[Alternative] doesn't fully solve the problem because [reason]."

Add this section to: CLAUDE-OUTPUTS/capstone/activation-ab-test-design.md
```

---

## Step 5: How We'd Know It's Working

```
Task: Write the Measurement Plan for the Approver Selection fix.

Structure it as:

LEADING INDICATORS (30 days — signals the variant is being used as intended):
- [Metric]: target [value]
- [Metric]: target [value]

LAGGING INDICATORS (60 days — signals meaningful activation improvement):
- Primary: Condition-to-publish conversion rate: from 25% to [target]
- Secondary: Support ticket volume (backup approver topic): from [baseline] to [target]

LAGGING INDICATORS (90 days — signals business impact):
- [Metric]: from [baseline] to [target]

KILL METRIC: "If [metric] is below [threshold] at day 60, we revert to control and 
investigate the next hypothesis in the funnel."

Add this section to: CLAUDE-OUTPUTS/capstone/activation-analytics-memo.md
```

---

## Final Review

Once you have completed all steps, run this self-audit:

```
Read:
- CLAUDE-OUTPUTS/capstone/activation-analytics-memo.md
- CLAUDE-OUTPUTS/capstone/activation-ab-test-design.md

Does the A/B test design accurately measure the hypothesis presented in the analytics memo? Are the guardrail metrics appropriate?
```

If the audit passes, you have completed the Scale & Optimize track.

---

## Next Steps
Proceed to Module 10.3 to lock in the mental models:
```
/start-m10-3
```
