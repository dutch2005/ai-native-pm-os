# Module 6.3 — Executive Narrative: Write Strategy Docs That Win Decisions

**Time:** ~40 minutes  
**Outcome:** A one-pager and board-ready narrative that turns your roadmap into a fundable, executable plan

---

## The Document That Changes Decisions

There are two types of strategy documents:
1. Documents that inform (here's what we know)
2. Documents that persuade (here's what we should do, and why now)

Most PMs write type 1. The ones who get promoted write type 2.

A type 2 strategy document:
- Opens with the decision it's asking for
- Builds the case in three moves: problem → evidence → recommendation
- Anticipates the top 2 objections and addresses them pre-emptively
- Closes with one clear ask and a deadline

This lesson builds that document.

---

## The Executive One-Pager Template

```
Write an executive one-pager for this decision:

DECISION: Fund and prioritize the Conditional Approval Routing feature 
for Meridian's Q2 roadmap.

Use the following structure exactly:

━━━ THE SITUATION ━━━
One paragraph. What is happening in the market / with customers / with data 
that makes this decision urgent NOW? 
Lead with a number. No history, no background.
(Target: 60 words)

━━━ THE OPPORTUNITY ━━━
One paragraph. What does success look like in 6 months if we act?
Quantify: ARR impact, NRR impact, or customer metric.
(Target: 60 words)

━━━ THE EVIDENCE ━━━
Three bullets only. The strongest evidence supporting this decision.
Each bullet: Fact + source + implication.
(No vague claims. Every bullet must be specific and verifiable)

━━━ WHAT WE'RE NOT DOING ━━━
Two bullets. What is explicitly out of scope for this initiative.
This builds trust by showing we've thought about boundaries.

━━━ THE ASK ━━━
One sentence. Specific. Time-bound.
"Approve [X] engineering sprints starting [date] to ship [MVP scope] by [date]."

━━━ IF WE DON'T ACT ━━━
One sentence. The cost of inaction.

Context to use:
- Meridian company context: PROJECTS/meridian-os/CLAUDE.md
- Opportunity sizing: CLAUDE-OUTPUTS/strategy-docs/tam-sam-som-model-[date].md
- Prioritization model: CLAUDE-OUTPUTS/strategy-docs/roadmap-prioritization-model.md

Audience: Dev Kapoor (CEO). Apply his communication preferences.
Save to: CLAUDE-OUTPUTS/strategy-docs/approval-routing-one-pager.md
```

---

## The Quarterly Board Narrative

A board update is a different artifact. It's not for winning a decision — it's for building confidence in your trajectory.

```
Write the Product section of a Q2 board update for Meridian.

Structure:
1. HEADLINE METRIC: The single number that best represents product health this quarter.
   Format: [Metric]: [Current] vs [Target] vs [Q1 baseline]

2. WHAT WE SHIPPED: 3 bullets, each as "[Feature]: [Business outcome it enabled]"
   Not: "We shipped the dashboard." 
   Yes: "Dashboard v2: Reduced Olivia's reporting time from 4 hours → 25 minutes/week"

3. WHAT WE LEARNED: 1-2 insights from research or data that changed our roadmap thinking.
   This is the most important section — boards invest in teams that learn fast.

4. WHAT'S NEXT: 3 roadmap items for Q3, each with a success metric.
   Format: "[Feature] → Success metric: [specific measurable outcome]"

5. RISKS: 2 risks, each with a mitigation.
   Format: "Risk: [X]. Mitigation: [Y]. Owner: [Name]."

6. WHAT WE NEED FROM THE BOARD: 1 thing (connection, decision, or resource).

Audience: External investors and board members.
Tone: Confident but honest. Data-driven but narrative-led.
Length: Maximum 400 words. This will be spoken to, not read.
Context: PROJECTS/meridian-os/CLAUDE.md and any relevant outputs.
Save to: CLAUDE-OUTPUTS/strategy-docs/q2-board-narrative.md
```

---

## The Anti-Patterns in Executive Writing

Build these into your anti-style.md:

```
Add an "Executive Writing" section to ABOUT-ME/anti-style.md with these rules:

NEVER write:
- "We believe that..." → Replace with what the data says
- "In today's rapidly changing landscape..." → Cut. Start with the number.
- "This will help us achieve our strategic goals" → Name the specific goal
- Long paragraphs of background before the point → Lead with the point
- "I'd like to propose..." → Propose it. Don't announce the proposal.

ALWAYS write:
- The ask in the first or last line (never buried in the middle)
- A specific number or date in every claim
- One clear decision per document (not three decisions in one page)
- A "so what" at the end of every data point
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

- [ ] Executive one-pager written for approval routing decision
- [ ] Q2 board narrative written following the 6-section structure
- [ ] Anti-style.md updated with executive writing rules
- [ ] You can explain the difference between a document that informs vs. persuades

---

## Next: Module 6.4
Objection simulation — roleplay the skeptical CTO or CFO before the real meeting.

```
/start-m6-4
```
