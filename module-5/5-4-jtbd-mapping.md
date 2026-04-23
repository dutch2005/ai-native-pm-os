# Module 5.4 — JTBD Mapping: Extract Jobs-to-be-Done from Existing Research

**Time:** ~35 minutes  
**Outcome:** A validated JTBD map built from interviews and tickets you already have — no new research required

---

## Why JTBD Before You Build Anything

Jobs-to-be-Done answers the question PRDs don't ask: *What progress is the user trying to make in their life?*

Not "what feature do they want?" — that's the solution space.  
Not "what are they doing?" — that's behavior.  
JTBD: "What are they trying to accomplish, and what is currently getting in the way?"

The difference:
- Feature request: "I need a bulk approval button"
- JTBD: "When I have 20 POs to approve on a Friday afternoon, I want to process them all without touching each one individually, so I can leave on time without things sitting in my queue over the weekend"

The JTBD gives you latitude to solve the problem better than the requested feature would.

---

## The JTBD Extraction Prompt

Run this on your existing interview synthesis or support ticket data:

```
Read:
- CLAUDE-OUTPUTS/research/interview-synthesis-q2.md (if it exists)
- PROJECTS/meridian-os/research/support-tickets/march-tickets.md

Extract Jobs-to-be-Done from this data.

For each job, write using the JTBD statement format:
"When [situation/trigger], I want to [motivation/goal], so I can [desired outcome]."

Then classify each job:
- FUNCTIONAL: A practical task they need to accomplish
- EMOTIONAL: How they want to feel during or after the task
- SOCIAL: How they want to be perceived by others

Map each job to the specific evidence (quote or ticket number) that revealed it.

After extracting all jobs, group them into 3–5 "job clusters" — themes of related jobs that suggest a shared underlying need.

For each cluster:
- Name it with a verb phrase (e.g., "Maintain control without manual oversight")
- List the jobs it contains
- Rate it: HIGH / MEDIUM / LOW priority based on frequency in the data

Save to: CLAUDE-OUTPUTS/research/jtbd-map-q2.md
```

---

## The JTBD Validation Check

Not all extracted jobs are real JTBD statements. Run this check:

```
Read CLAUDE-OUTPUTS/research/jtbd-map-q2.md.

For each job statement, check it against the JTBD validity criteria:

1. TRIGGER TEST: Does the "When" describe a specific situation, not a general state?
   Bad: "When I'm using the product..." (too vague)
   Good: "When I'm covering for a colleague who's OOO..." (specific trigger)

2. MOTIVATION TEST: Does the "I want to" describe a desire, not a feature?
   Bad: "I want a bulk approve button" (that's a solution)
   Good: "I want to clear my queue without reviewing each item" (that's a job)

3. OUTCOME TEST: Does the "so I can" describe a meaningful outcome, not just a task completion?
   Bad: "so I can click approve" (not meaningful)
   Good: "so I can leave work knowing nothing is stuck on me" (meaningful)

Rewrite any statement that fails one or more tests.
Flag any statements that are too vague to validate from the available data.
```

---

## Mapping JTBD to Your Roadmap

This is where JTBD pays off — it reveals misalignment between what you're building and what jobs users actually have:

```
Read:
- CLAUDE-OUTPUTS/research/jtbd-map-q2.md
- PROJECTS/meridian-os/roadmap.md

For each HIGH priority job cluster:
1. Which roadmap item most directly serves this job? (if any)
2. If no roadmap item serves it — is there a gap?
3. For roadmap items that serve multiple jobs: are there any jobs being served by that feature that are LOW priority? (scope creep signal)

Return as a mapping table:
| Job Cluster | Priority | Roadmap Item | Gap? | Notes |

Then write a "JTBD Roadmap Alignment Brief" — 150 words:
What does our roadmap get right? What does it miss?
Audience: Dev Kapoor (CEO). One paragraph. Lead with the most important insight.

Save to: CLAUDE-OUTPUTS/research/jtbd-roadmap-alignment.md
```

---

## JTBD as a Spec Input

When you start Module 3.1 (PRD writing), feed it the relevant JTBD:

```
Before I write the PRD for Conditional Approval Routing, 
read the JTBD cluster "Maintain control without manual oversight" 
from CLAUDE-OUTPUTS/research/jtbd-map-q2.md.

Use the jobs in this cluster to strengthen the PRD:

1. Add a "User Jobs We're Serving" section to the PRD (list the specific JTBD statements)
2. For each job, trace which feature in the PRD directly serves it
3. Flag any job in the cluster that the PRD does NOT address — 
   these become V2 backlog candidates

This ensures the PRD is grounded in actual user motivations, not just feature logic.
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

- [ ] JTBD map extracted from existing research (minimum 5 jobs across 3 clusters)
- [ ] All job statements validated against the 3-part JTBD test
- [ ] Roadmap alignment analysis run — at least one gap identified
- [ ] JTBD used as input for an existing or new PRD section

---

## Next: Module 5.5
The discovery memo — synthesizing research across sources into a decision-ready document.

```
/start-m5-5
```
