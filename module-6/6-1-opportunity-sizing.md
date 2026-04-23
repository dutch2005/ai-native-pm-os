# Module 6.1 — Opportunity Sizing: TAM/SAM/SOM with Real Data

**Time:** ~40 minutes  
**Outcome:** A defensible opportunity sizing model for Meridian's enterprise segment, built with real logic

---

## Why PMs Need to Own Opportunity Sizing

Most PMs delegate opportunity sizing to finance or strategy. That's a mistake.

When you show up to a roadmap review with a number you can't defend, you lose credibility. When you bring a model you built — with your own assumptions laid out transparently — you control the conversation.

Claude makes this fast. You still bring the thinking.

---

## The Three Numbers

| Term | What It Means | How to Calculate |
|------|--------------|-----------------|
| **TAM** | Total Addressable Market — if every possible buyer bought your product | # of companies in the market × average contract value |
| **SAM** | Serviceable Addressable Market — the segment you can realistically reach | TAM × % you can actually sell to (ICP filter) |
| **SOM** | Serviceable Obtainable Market — what you'll win in 3–5 years | SAM × your realistic market share capture |

---

## The Sizing Workflow

### Step 1: Define the Market

```
I'm sizing the market opportunity for Meridian OS — 
a no-code workflow orchestration platform for operations teams.

Help me build a TAM/SAM/SOM model. Start by helping me define the market:

1. What is the market category? (options: workflow automation, operations software, 
   business process management)
2. What are the standard industry analyst definitions for this category?
3. What are the major public company benchmarks (publicly traded comps or funding rounds) 
   that give us reference points for market size?

Return 3–4 market definition options with the trade-offs of each (too broad vs. too narrow).
```

---

### Step 2: Build the Bottom-Up Model

Bottom-up is more credible than top-down for Series B companies. Build from what you know.

```
Build a bottom-up TAM model for Meridian.

Known inputs:
- ICP: Mid-market companies, 50–500 employees, strong operations function
- Geographic focus: English-speaking markets (US, UK, Canada, Australia) initially
- Current ACV: ~$29,500/year
- Current NRR: 118%

Build the model:
1. Estimate # of mid-market companies in English-speaking markets 
   (use standard business census data as reference)
2. Apply an "operations-led" filter — what % of those companies have 
   a dedicated ops function? (use LinkedIn headcount data as proxy)
3. Apply an "automation-ready" filter — what % have the tool stack maturity 
   to buy workflow software?
4. Calculate: Filtered companies × $29,500 ACV = Bottom-Up TAM

Show all math. State every assumption. Flag which assumptions are weakest.
```

---

### Step 3: SAM and SOM

```
Given the TAM model, now calculate SAM and SOM:

SAM:
- From the filtered TAM companies, which segments can Meridian realistically sell to 
  given current sales capacity and geographic coverage?
- Apply: sales cycle length, AE capacity, geographic focus, competitive displacement rate

SOM (3-year):
- Current ARR: $4.2M, Growth: 80% YoY
- If growth sustains at 60% YoY for 3 years: what ARR do we reach?
- What % of the SAM does that represent?
- Is that a reasonable market capture rate for a Series B SaaS?

Return the full model as a table.
Flag: which number would James Whitfield (CFO) push back on hardest and why?
Save to: CLAUDE-OUTPUTS/strategy-docs/tam-sam-som-model-[date].md
```

---

## Making It Defensible

A good opportunity sizing model has these properties:

1. **Transparent assumptions** — every number has a source or stated assumption
2. **Sensitivity analysis** — what happens if your key assumption is wrong by 50%?
3. **Bottom-up + top-down sanity check** — do both approaches give similar answers?
4. **Named critics** — you've already anticipated the pushback (James on the SOM %, Tara on GTM capacity)

```
Add a sensitivity analysis to the TAM/SAM/SOM model:

For the SOM, vary these two assumptions:
- ACV: $20K / $29.5K / $40K
- Market capture rate: 1% / 3% / 5%

Show the resulting SOM matrix (3×3) so we can see the range of outcomes.

Then write a one-paragraph "How to defend this in a board meeting" brief that 
pre-addresses the most likely challenge to the model.
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

- [ ] You have a completed TAM/SAM/SOM model for Meridian
- [ ] Every assumption is stated explicitly
- [ ] Sensitivity analysis shows range of outcomes
- [ ] Saved to CLAUDE-OUTPUTS/strategy-docs/ with a defense brief

---

## Next: Module 6.2
Roadmap reasoning — using Claude to stress-test prioritization decisions.

```
/start-m6-2
```
