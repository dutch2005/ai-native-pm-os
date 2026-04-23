# Module 5.3 — Competitive Intelligence: Signal Over Noise

**Time:** ~35 minutes  
**Outcome:** A structured competitive tracking system that surfaces what matters without the daily noise

---

## The Problem with How PMs Track Competitors

Most PMs track competitors one of two ways:
1. **Too reactive** — they see a tweet, forward it to Slack, everyone panics, nothing happens
2. **Too sporadic** — they do a quarterly deep-dive, the deck goes stale immediately

Neither produces useful, decision-relevant competitive intelligence. This module builds a middle path: structured, file-based tracking that feeds directly into your strategy documents and PRDs.

---

## The Competitive Intelligence Stack

```
Sources (inputs)                  Processing               Outputs
─────────────────────────────    ──────────────────────   ────────────────────────────
Competitor release notes    →                            → Competitive brief for Sales
G2/Capterra reviews        →   Claude synthesizes       → PRD section: competitive angle
LinkedIn job postings      →   weekly                   → Exec update: market movement
Pricing pages              →                            → Decision log: how we respond
Customer win/loss notes    →
```

---

## Setting Up Your Competitor Files

Create the competitive tracking structure:

```bash
mkdir -p PROJECTS/meridian-os/research/competitive/{zapier,make,servicenow}

cat > PROJECTS/meridian-os/research/competitive/competitive-overview.md << 'EOF'
# Meridian Competitive Landscape

## Direct Competitors

### Zapier
- Positioning: SMB-focused automation, brand recognition, ease of use
- Weakness: No conditional approval logic, can't handle complex enterprise routing
- Watch signals: Any enterprise tier launch, pricing changes, new approval/workflow features
- G2 rating: 4.5/5 (7,400+ reviews)

### Make (formerly Integromat)
- Positioning: Power users, visual workflow builder, lower price point
- Weakness: Steep learning curve, primarily IT-owned not ops-team-owned
- Watch signals: Simplification of UI, enterprise partnership announcements
- G2 rating: 4.7/5 (1,200+ reviews)

### ServiceNow (Workflow Studio)
- Positioning: Enterprise IT workflow, deep integration with ITSM
- Weakness: Price (minimum $150K+ contracts), requires IT ownership
- Watch signals: Mid-market push, lower-entry SKUs, ops-team targeting
- G2 rating: 4.3/5 (1,800+ reviews)

## Indirect Competitors
- Monday.com Automations (existing customer base, limited conditional logic)
- Microsoft Power Automate (bundled with M365, low depth for ops workflows)
- Notion Automations (nascent, document-centric)
EOF

echo "Competitive overview created"
```

---

## The Weekly Competitive Scan

> **⚠️ Real data only.** Asking Claude to "simulate" or "generate a plausible" competitive update produces convincing-sounding fiction — competitor names, fake feature announcements, invented pricing. Never share Claude-simulated competitive intel with stakeholders or use it to make roadmap decisions. Use the prompt below only when you have real source material to point at.

**How to gather real competitive data before running this prompt:**
- G2 / Capterra: filter recent reviews for your top 3 competitors, sort by newest
- Competitor blogs and release notes: check their "What's New" or changelog pages
- LinkedIn: search the competitor's company page for recent posts; check their job postings for strategic signals
- Save your notes to: `PROJECTS/meridian-os/research/competitive/[competitor-name]-notes.md`

**Then run:**
```
I want to do a competitive intelligence update for Meridian.

Read PROJECTS/meridian-os/research/competitive/competitive-overview.md 
for context on our three main competitors.

Read my research notes at PROJECTS/meridian-os/research/competitive/
for any recent competitor observations I've collected.

Based on the actual research notes, generate a structured update covering:

FOR EACH COMPETITOR (only based on real data from my notes):
1. Any product announcements or changes you found evidence of
2. Customer sentiment shifts from review sites I noted
3. Hiring signals (roles they're posting for)
4. Any pricing movement observed

IMPLICATIONS FOR MERIDIAN:
- What does this competitive movement mean for our roadmap priority?
- Is there any "attack surface" — an area where they're weakening that we can strengthen?
- Is there any threat — an area where they're strengthening that puts us at risk?

If my notes don't have data for a category, say "No data" rather than inferring.

Save as: CLAUDE-OUTPUTS/research/competitive-update-[date].md
```

---

## The Win/Loss Analysis Pattern

One of the richest competitive sources you have: your own win/loss call notes.

```
Read PROJECTS/meridian-os/research/[win-loss-notes-file].md

Extract competitive intelligence from our recent win/loss data:

WIN PATTERNS:
- What did customers say they chose us for? (Specific quotes preferred)
- Which features came up most often as differentiators?
- Was there a specific Zapier/Make/ServiceNow weakness we beat?

LOSS PATTERNS:
- What did customers say we were missing?
- What did competitors offer that we didn't?
- Were there any deals lost on price alone? (Price sensitivity signal)

IMPLICATION RANKING:
Rank the top 3 product implications from win/loss data:
1. [Feature gap that lost us 2+ deals in the last quarter]
2. [Feature strength that won us 3+ deals — protect and double down]
3. [Surprising competitive pattern — something we didn't expect]

Save to: CLAUDE-OUTPUTS/research/win-loss-q1-analysis.md
```

---

## Turning Competitive Intel into Stakeholder Value

Competitive intelligence is most valuable when it changes a decision or arms someone for a conversation.

```
Read CLAUDE-OUTPUTS/research/competitive-update-[date].md

Write three competitive briefs from this update — one for each audience:

BRIEF FOR ROHAN (Sales):
- 2 new objection-handling talking points based on competitor weaknesses
- One "Why Meridian Now" update based on a competitor's recent move
- One new differentiator to add to the pitch deck
Format: 3 bullets + one quote they can use verbatim in a call

BRIEF FOR TARA (CTO):
- One architectural area we should accelerate based on competitor movement
- One technical differentiator that's currently under-marketed
Format: 2 bullets, technical framing

BRIEF FOR DEV (CEO):
- Market signal: is the competitive intensity increasing or decreasing?
- ARR risk: how much of our ARR is potentially threatened by a specific competitor move?
Format: One paragraph, lead with the market signal, close with a number

Save all three to: CLAUDE-OUTPUTS/stakeholder-comms/competitive-briefs-[date].md
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

- [ ] Competitor overview file created for Meridian's top 3 competitors
- [ ] Weekly competitive scan run and saved
- [ ] Win/loss patterns extracted from available data (real or mock)
- [ ] Three audience-specific competitive briefs generated

---

## Next: Module 5.4
JTBD mapping — extracting jobs-to-be-done from existing research without new interviews.

```
/start-m5-4
```
