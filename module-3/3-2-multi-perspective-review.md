# Module 3.2 — Multi-Perspective PRD Review

**Time:** ~35 minutes  
**Outcome:** Your PRD challenged from three expert angles simultaneously before engineering ever sees it

---

## Why Single-Author PRDs Fail

You wrote the PRD. You understand the context. You filled in every section. And you're still the worst person to review it.

You have blind spots. You know what you meant to write, so you read what you meant — not what's actually there. You skip the ambiguities because you already know the answers in your head.

Multi-perspective review forces your PRD through lenses you can't apply yourself: the engineer who'll build it, the designer who'll make it usable, the exec who'll fund it.

This lesson gives you the workflow and the exact prompts.

---

## The Three Lenses

### The Engineer Lens
Engineers ask: *What exactly do I build? What happens in edge cases? What could go wrong mid-sprint?*

They flag:
- Ambiguous requirements ("should handle various states" → which states?)
- Missing error handling ("what if the API call fails?")
- Scope creep hidden in language ("support all existing workflows" → how many? Which types?)
- Integration assumptions that aren't stated

### The Designer Lens
Designers ask: *How does a real user actually experience this? What happens when it goes wrong?*

They flag:
- Missing user states (empty, loading, error, success, edge)
- Flows that skip steps a user would naturally take
- Assumed user sophistication ("the user will know to...")
- Notification and feedback gaps

### The Exec Lens
Executives ask: *Why are we doing this now? What's the return? What are we giving up?*

They flag:
- Weak "why now" framing
- Success metrics that aren't actually measurable
- Opportunity cost not addressed
- Competitive context missing

---

## The Parallel Review Prompt

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md

Review it simultaneously from three expert perspectives:

━━━ SENIOR ENGINEER ━━━
You are a senior engineer at Meridian with 8 years of backend experience.
You are allergic to ambiguity and have been burned by underspecified PRDs before.

Find every place where:
1. A requirement is technically ambiguous (multiple valid interpretations)
2. An edge case is unhandled (what happens when X is true?)
3. An integration assumption is unstated (assumes system Y behaves like Z)
4. A scope boundary is fuzzy ("support all cases" type language)

Return as a numbered list. Be specific — quote the exact PRD language that's problematic.

━━━ SENIOR UX DESIGNER ━━━
You are Priya Singh (Head of Design at Meridian). You have seen too many 
PRDs that ignore the user's actual journey.

Find every place where:
1. A user state is missing (empty, loading, error, disabled, success)
2. A user flow has a gap (what does the user do between step A and step B?)
3. The feature assumes more user sophistication than our personas have
4. Feedback and confirmation moments are missing

Return as a numbered list. Reference Marcus (Ops Manager) and Asha (Finance Analyst) 
when describing user impact.

━━━ CEO (Dev Kapoor) ━━━
You are Dev Kapoor. You read fast. You think in ARR and competitive position.

Find every place where:
1. The "why now" argument is weak or missing
2. A success metric can't actually be measured
3. The competitive differentiation isn't stated
4. The ROI case is implicit rather than explicit

Return as 3–5 bullets only. Dev is brief.

━━━ SYNTHESIS ━━━
After all three reviews, identify:
- The single highest-priority fix (appears in 2+ reviews or is a showstopper)
- 3 changes to make before this goes to engineering
- 1 thing this PRD does well that should be preserved

Save full review to: CLAUDE-OUTPUTS/prds/approval-routing-multi-review.md
```

---

## Using the Review to Revise

After reading the review:

```
Read:
- CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md
- CLAUDE-OUTPUTS/prds/approval-routing-multi-review.md

Make the following targeted revisions:
[Paste the 3 prioritized changes from the synthesis]

For each revision, add a comment: <!-- REVISED: [reason] --> 
immediately after the changed text so I can track what changed.

Save as: CLAUDE-OUTPUTS/prds/approval-routing-prd-v3.md
```

---

## Building the Review into Your Standard Workflow

Add a step to your PRD slash command. Edit `.claude/commands/` to include a `/prd-review` command:

```bash
touch .claude/commands/prd-review.md
```

Content:
```markdown
Read the most recent PRD file in CLAUDE-OUTPUTS/prds/ (the highest version number).

Run a multi-perspective review from: Senior Engineer, Senior UX Designer, and CEO.
Follow the review format from Module 3.2.

Return the review in full.
Ask me: "Which perspective's feedback do you want to address first?"
```

---

## Hands-On Exercise

1. Run the full parallel review prompt on your `approval-routing-prd-v2.md`
2. Read all three perspectives carefully
3. Identify which single finding would cause the most pain if discovered mid-sprint
4. Make that fix first, then the next two
5. Save v3 and compare it to v2 — count how many lines changed

---

## Module Checkpoint

- [ ] Multi-perspective review run on your PRD
- [ ] At least 3 concrete revisions identified from the synthesis
- [ ] `approval-routing-prd-v3.md` saved with revision comments
- [ ] `/prd-review` slash command created

---

## Next: Module 3.3
The PRD → ticket pipeline: auto-generate Jira/Linear stories from a PRD.

```
/start-m3-3
```
