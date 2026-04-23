# Module 6.4 — Objection Simulation: Roleplay the Skeptical CTO or CFO

**Time:** ~35 minutes  
**Outcome:** Your strategy documents, PRDs, and roadmap decisions stress-tested before the real meeting

---

## The Meeting You Can't Afford to Lose

Every PM has been in this meeting. You present a roadmap decision. The CTO says "I don't think our architecture supports this." The CFO says "The payback period is too long." You don't have an answer ready.

You leave the meeting with nothing decided, a dent in your credibility, and another week lost.

Objection simulation prevents this. You run the hard conversation with Claude before you have it for real.

---

## The Simulation Framework

1. **Load the artifact** — give Claude the PRD, strategy doc, or roadmap you're about to present
2. **Assign the persona** — tell Claude exactly who to roleplay (with their preferences from CLAUDE.md)
3. **Run the challenge** — Claude attacks your document from that persona's perspective
4. **Capture the objections** — extract every challenge Claude raised
5. **Prepare your answers** — for each objection, draft your response
6. **Run a second round** — present your strengthened version and see if the objections hold

---

## Simulating the Skeptical CTO (Tara Novak)

```
I'm about to present the Conditional Approval Routing PRD to Tara Novak (CTO).

Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md.

Now roleplay as Tara. Use this character brief:
- Methodical, engineering-depth required, allergic to scope creep
- She will push on: technical ambiguity, scope, engineering effort, 
  downstream complexity, and any requirement that could create tech debt
- She does NOT trust vague timelines or handwavy "small lift" estimates
- She asks one follow-up question after every answer

Challenge me on this PRD as Tara would in a real engineering review.
Ask 5 hard questions, one at a time. After each one, wait for my answer before asking the next.

Start with her opening question.
```

Run this interactively — answer each question as you would in the real meeting. After all 5, ask Claude:

```
Step out of the Tara persona.

List the 5 objections she raised. For each one:
1. What is the underlying concern (not just the surface question)?
2. How well did my answer address it?
3. What would a better answer include?

Save this debrief to: CLAUDE-OUTPUTS/stakeholder-comms/cto-review-debrief.md
```

---

## Simulating the Skeptical CFO (James Whitfield)

```
I'm about to present our Q2 roadmap to James Whitfield (CFO) 
and request budget for 2 additional engineering heads.

Read:
- CLAUDE-OUTPUTS/strategy-docs/tam-sam-som-model-[date].md
- PROJECTS/meridian-os/okrs.md
- PROJECTS/meridian-os/roadmap.md

Roleplay as James. Character brief:
- Conservative, ROI-first, payback period focused
- Wants to see the math, not the narrative
- Will question: engineering costs, payback timeline, opportunity cost, 
  and whether current team could ship the same output
- He respects financial discipline and distrusts aspirational projections

Ask me 4 hard questions about the headcount request and roadmap ROI. 
One at a time. Wait for my answer before asking the next.
```

After completing the simulation:

```
Exit the James persona.

List the 4 objections he raised. For each:
1. The financial concern underneath the question
2. What data or framing would have addressed it better
3. One sentence I should add to my headcount request doc to pre-empt this objection

Save to: CLAUDE-OUTPUTS/stakeholder-comms/cfo-objection-debrief.md
```

---

## Building Your Objection Playbook

After running 3–4 objection simulations, you'll notice patterns. Turn them into a reusable playbook:

```
Read:
- CLAUDE-OUTPUTS/stakeholder-comms/cto-review-debrief.md
- CLAUDE-OUTPUTS/stakeholder-comms/cfo-objection-debrief.md

Extract all unique objection types across both documents.
Group them into categories:
- Technical objections (CTO profile)
- Financial objections (CFO profile)  
- Scope objections (anyone)
- Timeline objections (anyone)
- Competitive objections (CEO/Sales profile)

For each category: write the 2 best pre-emptive sentences to add to any 
strategy doc before it goes to that audience.

Save as: CLAUDE-OUTPUTS/stakeholder-comms/objection-playbook.md
```

This playbook becomes part of your standard PRD and strategy doc workflow.

---

## Supplementary Exercise: The Panel Simulation
*(Advanced — draws from agents_advanced_final.pdf)*

```
I'm presenting the Q2 roadmap to the full exec team simultaneously.

Read PROJECTS/meridian-os/roadmap.md and PROJECTS/meridian-os/okrs.md.

Roleplay a panel of three executives simultaneously:
- Dev Kapoor (CEO) — growth and revenue lens
- Tara Novak (CTO) — engineering and technical lens  
- James Whitfield (CFO) — financial and ROI lens

After I give my 60-second roadmap pitch (write it for me first), 
have each of the three executives ask one question, in character.

I'll answer all three. Then give me a panel debrief: who did I address 
well, who needs more, and what's the single most important thing to fix 
before the actual exec review?
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

- [ ] You've run a CTO objection simulation on your Approval Routing PRD
- [ ] You've run a CFO simulation on a budget/headcount request
- [ ] Both debriefs are saved to CLAUDE-OUTPUTS/stakeholder-comms/
- [ ] You've started an objection playbook with pre-emptive sentences

---

## Next: Module 6.5
Strategy one-pagers, OKR drafts, and quarterly business reviews.

```
/start-m6-5
```
