# Module 3.4 — Lightweight Specs: When a PRD Is Overkill

**Time:** ~25 minutes  
**Outcome:** A spec format that takes 20 minutes to write and is more useful than a 6-page PRD for 80% of features

---

## The PRD Is Dead (Partially)

From Reddit r/ProductManagement (479 upvotes — one of the highest engagement posts this month):
> *"PRD almost always is not needed."*
> *"Due to the speed at which AI is able to move product teams through ideation/prioritisation, design and MVP, I'm hearing more and more AI-led PMs swearing PRD is dead."*

They're partially right. A 12-section PRD for a small feature change is overkill. But "no spec" creates the "requirements weren't clear" blame cycle we covered in Module 3.3.

The answer isn't PRD or nothing. It's **right-sizing the spec to the decision risk.**

---

## The Spec Sizing Matrix

| Feature Size | Risk Level | Right Spec Format |
|-------------|-----------|------------------|
| Bug fix / minor tweak | Low | 3-line ticket with acceptance criteria |
| Small new feature (< 2 sprint weeks) | Medium | Lightweight spec (this lesson) |
| Large new feature (> 2 sprint weeks) | High | Full PRD (Module 3.1) |
| Platform-level change | Very high | Full PRD + Architecture Review Doc |

The lightweight spec handles the medium bucket — the majority of what you actually ship.

---

## The Lightweight Spec Template

One page. Five sections. 20 minutes to write.

```bash
cat > TEMPLATES/lightweight-spec-template.md << 'EOF'
# [Feature Name] — Lightweight Spec

**Author:** [Name]  
**Date:** [Date]  
**Status:** Draft | Review | Approved  
**Epic:** [Parent epic or roadmap item]  
**Estimated scope:** [X story points / X sprint days]

---

## Why We're Building This
*One paragraph. The specific user problem or business signal that triggered this.*
*Do NOT start with "We believe..." — start with evidence.*

## What We're Building
*3–5 bullets describing the feature in user-observable terms.*
*Each bullet: "The user can now [do X] when [condition]."*
*Not implementation details — behavior.*

## What We're NOT Building
*2–3 explicit exclusions. This is as important as what we are building.*
*Each exclusion prevents a "can we just also..." scope creep conversation.*

## How We Know It Worked
*2–3 success metrics. Measurable. Time-bound.*
*"By [date], [metric] should [change] by [amount]."*

## Open Questions
*Any decisions still to be made before engineering starts.*
*Each question: Owner + Expected resolution date.*

EOF
echo "Lightweight spec template created"
```

---

## Writing a Lightweight Spec with Claude

```
Write a lightweight spec for the following feature:

Context: Read PROJECTS/meridian-os/CLAUDE.md for product background.

Feature: OOO (Out of Office) Routing for Approval Workflows

Background: Our support tickets show a recurring issue where approval 
workflows get stuck when a primary approver is OOO. Ticket examples:
"When my manager is OOO it just gets stuck. How do I set a backup approver?"

Use the template from TEMPLATES/lightweight-spec-template.md.

For "Why We're Building This": cite specific support ticket evidence.
For "What We're Building": write 4 bullets, each starting with "The user can now..."
For "What We're NOT Building": include at least 2 exclusions that set scope boundaries.
For "How We Know It Worked": tie metrics to the OKR in PROJECTS/meridian-os/CLAUDE.md.

After writing the spec, add a one-line recommendation:
"This spec requires [PRD / ticket / lightweight spec] because [reason]."

Save to: CLAUDE-OUTPUTS/prds/ooo-routing-spec.md
```

---

## The Spec vs. PRD Decision Protocol

Build this into your slash command:

```bash
cat > .claude/commands/spec-or-prd.md << 'EOF'
I need to decide whether to write a lightweight spec or a full PRD.

Ask me these 5 questions, one at a time. Wait for my answer after each.

1. "How many sprint-weeks will engineering spend on this feature?"
2. "Does this feature touch any platform-level infrastructure (auth, APIs, data schema)?"
3. "Will this feature be user-facing in a way that requires design review?"
4. "Is there any compliance, legal, or security consideration?"
5. "Does this feature have dependencies on other teams outside your squad?"

After my answers, recommend:
- TICKET (< 1 sprint week, no platform touch, no design)
- LIGHTWEIGHT SPEC (1-3 sprint weeks, contained scope)
- FULL PRD (> 3 sprint weeks, platform touch, multi-team dependency, or compliance)

State the recommendation in one sentence and explain which answers drove the decision.
EOF
```

---

## The "PRD as Prototype" Pattern

The highest-engagement Reddit thread on this topic had a nuance worth addressing:

> *"They rarely mention how they prevent feature scope drift, versioning, non-UI/UX feature handling"*

The answer: a lightweight spec + working prototype can replace a full PRD **for the UI/UX conversation**, but the spec still handles the non-UI scope (edge cases, error states, data handling, compliance). They're complementary, not competing.

Workflow:
1. Write lightweight spec (20 min)
2. Build prototype in Claude Code (Module 9)
3. Use prototype in design review
4. Update spec with decisions from the review
5. Generate tickets (Module 3.3)

The spec never goes away — it gets smaller and sharper.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Lightweight spec template created in TEMPLATES/
- [ ] OOO Routing spec written using the template
- [ ] `/spec-or-prd` slash command created
- [ ] You can state in one sentence when to use each format

---

## Next: Module 3.5
PRD versioning — tracking changes, managing reviews, and archiving decisions cleanly.

```
/start-m3-5
```
