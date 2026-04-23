# Module 10.4 — Peer Review: Raise the Standard Together

**Time:** ~30 minutes  
**Outcome:** A structured peer review process that makes everyone's PM OS better, not just your own

---

## Why Peer Review Matters in This Course

The biggest difference between a course certificate and real skill is feedback from someone who has done the same work.

You have built a PM OS. Your peer has built a PM OS. They made different choices. Seeing those choices — and being able to evaluate why — is how you calibrate your own judgment.

This module is not optional.

---

## What to Share (Your Capstone Package)

Share at minimum **three artifacts** from your capstone project:

1. Your best `CLAUDE.md` — either the project-level or global level. This is your most revealing artifact: it shows how you think about context.

2. One document from your capstone deliverables (strategy one-pager, analytics memo, or PRD — whichever you're proudest of).

3. Your `CLAUDE-OUTPUTS/` folder structure (just the file list — you can run `ls -R CLAUDE-OUTPUTS/`). This shows how organized and systematic you are.

---

## The Peer Review Criteria

Use these five lenses when reviewing another PM's work. Score each out of 5.

**1. Context Depth (CLAUDE.md quality)**
- Does the CLAUDE.md give Claude enough to produce useful output without hand-holding?
- Are the stakeholder personas, product context, and working style clearly defined?
- Score 1-5: 1 = vague generalities, 5 = a stranger could use this context file immediately

**2. Output Hygiene (CLAUDE-OUTPUTS/ structure)**
- Are files named with version numbers and status indicators?
- Is there a clear separation between active and archived documents?
- Score 1-5: 1 = chaotic, 5 = instantly navigable

**3. Specificity vs. Slop (in the capstone document)**
- Does the document lead with evidence or with frameworks?
- Are all recommendations specific, time-bound, and tied to a metric?
- Score 1-5: 1 = generic PM buzzwords, 5 = specific, data-grounded, actionable

**4. Agentic Thinking (automation and commands)**
- Did they automate anything recurring (Cowork, slash commands, skills)?
- Do their slash commands encode real workflow, not just common prompts?
- Score 1-5: 1 = no automation, 5 = multiple routines running without manual intervention

**5. Decision Logic (decision log quality)**
- Can you tell *why* they made a key decision from the decision log?
- Are trade-offs documented, not just conclusions?
- Score 1-5: 1 = no log or empty entries, 5 = rich context that would help a new PM immediately

---

## The Review Process — Human First

**Read before you prompt.** The most common mistake in peer review is delegating the thinking to Claude before forming your own view. If Claude writes your feedback without your input, the review is Claude's opinion, not yours — and your peer deserves your opinion.

### Step 1: Read the work (15 minutes, no Claude)

Read your peer's three shared artifacts. No prompting yet. Just read.

After reading, write three sentences — your actual reaction:

1. **What's the strongest part?** ("The stakeholder persona in their CLAUDE.md is unusually specific — I could see exactly who they're talking to.")
2. **What's the clearest gap?** ("Their capstone doc has strong frameworks but the recommendations don't have numbers attached.")
3. **What would you do differently?** ("I'd have added the decision log earlier — theirs seems to have been written after the fact.")

These three sentences are your review. Write them before opening a new Claude chat.

### Step 2: Use Claude to articulate and expand your thinking

Now bring Claude in — not to form the opinion, but to sharpen yours.

```
I am reviewing my peer's PM OS as part of the AI-Native PM OS capstone.

Here is what they shared:
[Paste their CLAUDE.md and one capstone document]

Here is my initial reaction (3 sentences I wrote before this prompt):
[Paste your 3 sentences from Step 1]

Using the five review criteria below as a framework, help me expand my reaction 
into a structured review. Keep my voice and specific observations — don't replace them 
with generic PM feedback:

1. Context Depth (CLAUDE.md quality) — score 1-5
2. Output Hygiene (folder structure) — score 1-5
3. Specificity vs. Slop (document quality) — score 1-5
4. Agentic Thinking (automation) — score 1-5
5. Decision Logic — score 1-5

For each criterion:
- Use the score I implied in my reaction where applicable
- Give one specific compliment (reference actual content, not vague praise)
- Give one specific improvement suggestion

Do NOT override my observations with generic PM frameworks. Every point must 
reference something specific in their work.

Save to: CLAUDE-OUTPUTS/capstone/peer-review-[their-name].md
```

---

## Receiving Feedback

When you receive feedback on your PM OS:

1. **Don't defend it.** Just listen. The first response to feedback is always "thank you."
2. **Update at least one thing.** Any feedback that identifies a genuine gap should result in a concrete change to your system.
3. **Ask a follow-up question.** The review is the start of a conversation, not a grade.

---

## Community Showcase (Optional but Encouraged)

Post one artifact in the course community thread. The best options:
- A screenshot of your `CLAUDE-OUTPUTS/` folder (shows organization)
- Your PM AI Principles doc (shows philosophy)
- A before/after of a document (before = raw, after = Claude-assisted)

Then review two peers' posts and leave at least one specific, actionable comment.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Three artifacts shared with a peer (CLAUDE.md, one capstone doc, folder list)
- [ ] Peer review written using the five criteria
- [ ] At least one concrete update made to your PM OS based on feedback received
- [ ] Community thread post made (optional)

---

## Next: Module 10.5
Write your PM AI Principles — your intellectual signature at the end of this course.

```
/start-m10-5
```
