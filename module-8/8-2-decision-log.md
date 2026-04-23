# Module 8.2 — The Decision Log: Never Lose Context on Why You Built Something

**Time:** ~30 minutes  
**Outcome:** A living decision log that gives future-you (and new teammates) instant context on every major product call

---

## The Forgotten Cost of Undocumented Decisions

Six months from now, someone (probably an engineer, maybe a new PM) asks:
"Why does the approval routing skip OOO detection for guest users?"

You know the answer. But it's in your head, in a Slack thread that's been archived, and in a meeting note from February that nobody can find.

The decision log solves this with zero overhead — Claude writes the entries from your conversations, you review them, they live in git.

---

## What Goes in a Decision Log

Not everything. Only decisions that:
- Have non-obvious rationale (why you chose this over a reasonable alternative)
- Will create confusion if the reasoning is forgotten
- Were made under time pressure with incomplete information

**Examples:**
- Why approval routing V1 uses sequential ordering instead of parallel
- Why you decided NOT to build a Notion connector in Q2 despite customer requests
- Why the OOO logic applies only to primary approvers, not backup approvers

**Not in the decision log:**
- Tactical implementation choices (engineering makes those)
- Decisions that are obvious from the feature itself
- Meeting agendas or action items

---

## The Decision Log Template

Create this file:

```bash
cat > PROJECTS/meridian-os/decision-log.md << 'EOF'
# Meridian Decision Log

Format: [ADR-XXX] [Short title]
Status: Accepted | Deprecated | Superseded by [ADR-XXX]

---

## ADR-001: Sequential approval ordering in V1

**Date:** 2025-03-15  
**Status:** Accepted  
**Deciders:** [Your name], Tara Novak (CTO)

**Context:**
The Approval Routing feature supports workflows where multiple approvers 
must sign off sequentially. We debated whether V1 should support parallel 
approval (all approvers notified simultaneously) or sequential (next approver 
notified only when previous approves).

**Decision:**
Sequential ordering in V1.

**Rationale:**
1. Enterprise customers (Tier 1 target) require sequential for compliance 
   and audit purposes — parallel approval creates ambiguity about sign-off authority
2. Sequential is technically simpler to implement and audit
3. Parallel is a natural V2 addition if demand materializes

**Consequences:**
- V1 approval chains will feel slower for low-stakes workflows
- We will hear requests for "parallel mode" — defer to V2 roadmap
- Technical implementation is simpler: one pending state per workflow, not N

**Alternatives considered:**
- Parallel approval (rejected: compliance risk, implementation complexity)
- User-configurable ordering (rejected: too complex for V1, deferred to V2)
EOF
echo "Decision log created"
```

---

## Auto-Generating Decision Entries from Conversations

After any significant product discussion, run this:

```
I just made a product decision. Help me document it as a decision log entry.

Here is what we decided:
[Paste your summary of the decision — even 2-3 sentences is enough]

Generate a decision log entry in ADR format:

Fields to complete:
- Title (short, verb phrase: e.g., "Use sequential approval in V1")
- Context (what problem were we solving? why did this need a decision?)
- Decision (what exactly did we decide?)
- Rationale (why this, not something else? name the specific trade-offs)
- Consequences (what does this create for future decisions or development?)
- Alternatives considered (what did we rule out and why?)

After generating, ask me: "Is there anything I got wrong or missed?"
Then save to: PROJECTS/meridian-os/decision-log.md (append, don't overwrite)
```

This prompt takes 30 seconds and prevents months of confusion.

---

## Querying the Decision Log

When someone asks "why did we do X?":

```
Read PROJECTS/meridian-os/decision-log.md.

I need to answer this question: [paste the question]

Find the most relevant decision log entry and explain:
1. When was this decision made?
2. What was the rationale at the time?
3. Has anything changed that might make us reconsider? (check against current OKRs)

If no decision log entry exists for this topic, tell me so I can create one.
```

---

## The Onboarding Read

New PM joining the team? One command gives them 6 months of context:

```
Read PROJECTS/meridian-os/decision-log.md.

A new Associate PM is joining Meridian's product team tomorrow.
They have a strong product background but know nothing about our decision history.

Write a "First Week Decision Context" brief that covers:
1. The 5 most important decisions they need to understand (and why they matter)
2. The 2 decisions that are most likely to come up in their first sprint
3. Any decision that's been superseded — so they don't go by old information

Length: 400 words. Conversational tone. Written to a smart colleague, not a committee.
Save to: CLAUDE-OUTPUTS/stakeholder-comms/new-pm-decision-brief.md
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

- [ ] `decision-log.md` created in your project folder
- [ ] At least 2 ADR entries written (one real, one from the module example)
- [ ] Auto-generation prompt tested on a real or mock decision
- [ ] Onboarding read generated from the decision log

---

## Next: Module 8.3
PM × Design collaboration — shared context documents that eliminate "I thought you wanted X" conversations.

```
/start-m8-3
```
