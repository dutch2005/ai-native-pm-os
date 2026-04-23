# Module 8.4 — The "Who Knows What" Map: Navigating the Informal Org

**Time:** ~25 minutes  
**Outcome:** A functional map of your company's informal knowledge graph that accelerates cross-functional work

---

## The Org Chart is a Lie

The formal org chart tells you who reports to whom. It does not tell you:
- Who actually understands the legacy billing API (it's not the VP of Eng)
- Who holds the most influence over the sales team's adoption of new features (it's a specific AE, not the Head of Sales)
- Who knows the history of the failed Q3 launch (it's a senior CS rep)

When a PM needs answers quickly, navigating the formal org chart is slow. Navigating the informal knowledge graph is fast.

This module builds that graph.

---

## Building the Knowledge Map

Create this file in your root or PM vault:

```bash
cat > PROJECTS/meridian-os/stakeholders/knowledge-map.md << 'EOF'
# Meridian OS: Informal Knowledge Map

*Last updated: [Current Date]*

## Technical Architecture & Legacy Code
- **Billing API (v1):** David Chen (Backend Eng) — built it 3 years ago, knows the undocumented quirks.
- **Webhook Infrastructure:** Sarah Lin (Staff Eng) — the only one who truly understands the rate-limiting logic.

## Customer & Market Reality
- **Enterprise Deal Objections:** Marcus T. (Enterprise AE) — always knows what competitors are pitching against us right now.
- **Churn Risk Signals:** Elena R. (CS Manager) — can predict churn 3 months out just from looking at account health.

## Processes & History
- **Why we don't build X:** Tara Novak (CTO) — holds the historical context on past failed initiatives.
- **Procurement/Legal Blockers:** James K. (Legal Counsel) — knows exactly what security questions will stall an enterprise deal.

## Informal Influence
- **Sales Team Adoption:** If Alex W. (Senior AE) uses a new feature, the rest of the floor will adopt it. Pitch him first.

EOF
echo "Knowledge map template created"
```

---

## Querying the Knowledge Map

When you hit a blocker, ask Claude to consult the map before you ask the wrong person:

```
Read PROJECTS/meridian-os/stakeholders/knowledge-map.md.

I am planning the PRD for the "Billing Dashboard Revamp" feature. 
It requires touching the old subscription management logic.

Who are the 2 people I absolutely must talk to before I finalize the scope?
For each person, write the specific 1-sentence Slack message I should send them to get 15 minutes of their time.
```

---

## Keeping the Map Updated

The map degrades quickly if not maintained. Add this to your monthly routines (or your `/weekly-digest` command):

```
Review my project logs and decision logs from the last month.

Did we discover any new informal knowledge holders? 
(e.g., someone who answered a complex technical question, or someone who provided crucial historical context on a feature).

If yes, draft an update to PROJECTS/meridian-os/stakeholders/knowledge-map.md.
```

---

## The "Stakeholder Matrix" Extension

For major launches, the knowledge map feeds into a formal stakeholder matrix (RACI or similar).

```
Read:
- PROJECTS/meridian-os/CLAUDE.md
- PROJECTS/meridian-os/stakeholders/knowledge-map.md

I am kicking off the Approval Routing V2 project. 
Generate a stakeholder matrix:

1. DECIDER (Who signs off on scope?)
2. CONSULT (Who must we talk to based on the knowledge map?)
3. INFORM (Who needs to know when it ships?)

For the CONSULT group, list the specific risk they are mitigating.
Save to: CLAUDE-OUTPUTS/stakeholder-comms/approval-routing-v2-matrix.md
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

- [ ] `knowledge-map.md` created in your stakeholder folder
- [ ] At least 3 actual or mock people added with their specific informal knowledge
- [ ] Stakeholder matrix generated for a specific project
- [ ] You understand why the formal org chart is insufficient for PMs

---

## Next: Module 8.5
The PM Vault Audit — a script to keep your OS clean, archived, and fast.

```
/start-m8-5
```
