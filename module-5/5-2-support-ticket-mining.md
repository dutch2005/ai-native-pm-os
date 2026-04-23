# Module 5.2 — Support Ticket Mining: Your Fastest Path to Product Insight

**Time:** ~30 minutes  
**Outcome:** A repeatable workflow that extracts product signals from support tickets weekly

---

## Why Support Data Is Underused

Support tickets are the most unfiltered customer voice you have access to. Nobody writes a support ticket in brand-approved language. Nobody uses product jargon. They describe their problem in the exact words that reveal what's broken and why they're frustrated.

Most PMs never read them. They're in a separate tool, assigned to CS, and the volume is too high to parse manually. That's the gap this module closes.

---

## Setting Up Your Support Data

Create mock support tickets based on Meridian's product:

```bash
cat > PROJECTS/meridian-os/research/support-tickets/march-tickets.md << 'EOF'
# Meridian Support Tickets — March 2025

1. "I set up an approval workflow for our PO process but when my manager is OOO it just gets stuck. How do I set a backup approver?" — Asha P., Finance Analyst, Coastal Ops

2. "Tried to duplicate a workflow template from one department to another but it keeps saying 'permission denied'. This is frustrating as I need to replicate it for 6 teams" — Marcus R., Operations Manager, Apex Logistics

3. "The webhook isn't firing when the form submits. I've checked the URL and it looks right. It worked yesterday. This is blocking our whole approval cycle" — IT Admin, Datastream Co

4. "Is there a way to see who has and hasn't approved yet? I can only see the final status, not the individual steps" — Department Head, Bridgewater Finance

5. "We're getting too many email notifications for every little thing. Can we set batched notifications?" — Asha T., Finance Analyst, Edgewood Corp

6. "Our new hire can't access the workflow I assigned them. Do they need a separate license?" — Operations Manager, Coastal Ops

7. "The workflow ran but the Slack message didn't send. No error shown anywhere." — Priya M., Ops Analyst, Apex Logistics

8. "Is there documentation on how to build conditional branches? I couldn't find it." — Marcus L., Operations, Bridgewater Finance

9. "We had a workflow fail silently — approved but the downstream action didn't happen. No notification that it failed." — Admin, Edgewood Corp

10. "How many workflow runs do we get per month? We're worried about hitting a limit." — Head of Ops, Coastal Ops

11. "OOO routing doesn't seem to be working consistently. Sometimes it routes, sometimes it doesn't." — Finance Analyst, Datastream Co

12. "We want to restrict which users can create new workflows vs. only trigger existing ones. Is there a role-based feature?" — IT Admin, Apex Logistics
EOF
echo "Support tickets created"
```

---

## Stage 1: Categorization and Quantification

```
Read PROJECTS/meridian-os/research/support-tickets/march-tickets.md.

Categorize all tickets using these categories:
- Missing Feature (the product doesn't have what they need)
- Bug (something that should work doesn't)
- Documentation Gap (they couldn't find the answer themselves)
- Permission/Access (account or role configuration issue)
- Notification Overload (too many or too few notifications)

For each category:
1. Count the tickets
2. List the specific tickets by number
3. Write a one-line pattern description

Then identify:
- TOP THEME: The single most common problem (by category count)
- HIDDEN INSIGHT: Something that appears in only 1-2 tickets but signals a 
  deeper product gap
- AT-RISK SIGNALS: Any ticket from an account with a renewal in the next 60 days
  (check against account-health-may.md if available)

Return as a table + two bullet points.
```

---

## Stage 2: Extracting Product Signals

Support tickets are discovery data in disguise. Mine them for product signal:

```
Re-read the support ticket data.

Extract product signals — specific evidence that we should build, change, 
or remove something:

For each signal:
1. SIGNAL: What is the user actually trying to do?
2. WORKAROUND: What are they doing instead today?
3. FREQUENCY: How often does this type of issue likely occur? (Estimate from ticket volume)
4. PRIORITY SCORE: Rate 1-5 based on:
   - User impact (does it block core workflow?)
   - Customer tier affected (are Tier 1 accounts affected?)
   - Revenue risk (is this causing churn signals?)

Sort signals by priority score, highest first.
Flag any signal that directly maps to an existing OKR from PROJECTS/meridian-os/CLAUDE.md.
Save to: CLAUDE-OUTPUTS/research/ticket-signals-march.md
```

---

## Stage 3: The CS ↔ PM Handoff Memo

Support teams sit on a goldmine of data that rarely reaches the PM. Create a memo that makes the exchange habitual:

```
Read CLAUDE-OUTPUTS/research/ticket-signals-march.md.

Write a CS ↔ PM handoff memo:

TO: Sarah (CS Lead)  
FROM: [Your name] (PM)  
RE: March Support Insights — Action Items

Section 1: What I'm taking back to product
[3 product signals and what I plan to do about them]

Section 2: What I need from CS this month
[2 specific questions I want CS to ask customers in their next check-in calls]

Section 3: What to escalate immediately
[Any ticket pattern where CS should escalate to me before next weekly sync]

Length: 200 words. One page. Actionable.
Save to: CLAUDE-OUTPUTS/stakeholder-comms/cs-pm-handoff-march.md
```

---

## The Monthly Routine

Make this a Cowork Dispatch task:

```
In Claude Desktop → Cowork:

Create a recurring task: "Monthly Support Signal Mining"
Schedule: First Monday of each month at 9 AM

Instructions:
1. Read the most recent file in PROJECTS/meridian-os/research/support-tickets/
2. Run full categorization, quantification, and signal extraction
3. Flag any signals that map to current OKRs
4. Generate a CS ↔ PM handoff memo
5. Save to CLAUDE-OUTPUTS/research/ticket-signals-[month].md
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

- [ ] March support tickets categorized and quantified
- [ ] Top 3 product signals extracted with priority scores
- [ ] CS ↔ PM handoff memo generated
- [ ] Monthly routine set up in Cowork

---

## Next: Module 5.3
Competitive intelligence — tracking competitors systematically without the information overload.

```
/start-m5-3
```
