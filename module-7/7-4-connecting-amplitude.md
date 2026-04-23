# Module 7.4 — Connecting Amplitude: Closing the Full Data Loop

**Time:** ~35 minutes  
**Outcome:** Claude reads your Amplitude data directly and generates insight memos without export-and-paste

---

## Why Analytics Tool Integration Matters

Without MCP: You export from Amplitude → save a CSV → reference it in Claude → paste results back.  
With MCP: Claude queries Amplitude directly, writes the memo, posts it to Slack.

This closes the full data loop. No manual steps, no stale exports, no copy-paste errors.

---

## Setting Up the Amplitude MCP Connector

### Prerequisites
- An Amplitude account (any paid plan)

### Step 1: Add the Amplitude MCP Server to Claude Code

Amplitude provides an official remote MCP server — no local package installation needed. Add it with one command:

```bash
claude mcp add --transport http Amplitude https://mcp.amplitude.com/mcp
# EU customers use: https://mcp.eu.amplitude.com/mcp
```

### Step 2: Authenticate

On first use, run `/mcp` inside Claude Code. You'll see the Amplitude server listed — click to authenticate via your Amplitude account (OAuth flow, same credentials you use to log into Amplitude). Your permissions in Amplitude determine which projects and data you can access.

### Step 3: Test the Connection

```
Use the amplitude MCP tool to:
1. List the available event types in my project
2. Pull the event count for "workflow_created" for the last 7 days
```

---

## Core Analytics Queries via MCP

### Funnel Query
```
Use the amplitude MCP tool to query the onboarding funnel:

Steps:
1. "trial_signup" 
2. "workspace_created"
3. "first_workflow_created"
4. "workflow_run_completed"

Time range: Last 30 days
Segment by: Plan type (free, starter, pro, enterprise)

Return: Conversion rate at each step, broken down by plan type.
Then write a 150-word narrative memo identifying the biggest drop-off point.
Audience: Dev Kapoor (CEO).
Save to: CLAUDE-OUTPUTS/data-analysis/onboarding-funnel-[date].md
```

### Retention Query
```
Use the amplitude MCP tool to pull retention data:

Event: "workflow_run_completed" (any workflow run)
Cohort window: Weekly, last 8 weeks
Return on: Day 1, Day 7, Day 14, Day 30

Then compare:
- Enterprise plan users vs. Pro plan users
- Users who received onboarding call vs. self-serve

Identify: Which cohort segment has the highest Day-30 retention?
Write a 100-word recommendation based on this data.
Save to: CLAUDE-OUTPUTS/data-analysis/retention-analysis-[date].md
```

### Feature Adoption Query
```
Use the amplitude MCP tool to query feature adoption for our Q2 features:

Events to pull (last 60 days, unique users):
- "conditional_routing_enabled" (Approval Routing V1)
- "ooo_routing_configured"
- "template_used"

For each feature:
- Total unique users who triggered it
- % of active users (define active as: triggered any event in last 14 days)
- Day-7 repeat usage rate (did users come back?)

Flag any feature with < 20% adoption rate among active users.
This is an "adoption gap" — a shipped feature users aren't finding.

Save to: CLAUDE-OUTPUTS/data-analysis/feature-adoption-[date].md
```

---

## Building an Amplitude → Slack → Report Pipeline

The full automated pipeline once MCP is connected:

```
In Claude Desktop → Cowork → Dispatch:

Task name: "Weekly Amplitude Digest"
Schedule: Every Monday 7:30 AM

Instructions:
1. Use amplitude MCP to pull:
   - ORR for the past 7 days (workflow_run_completed count)
   - Onboarding funnel completion rate for new trials this week
   - Top 3 events by volume this week

2. Compare to last week's baseline in CLAUDE-OUTPUTS/data-analysis/

3. Write narrative digest (250 words, Slack-ready)

4. Post to Slack #product-analytics channel using slack MCP

5. Save full analysis to CLAUDE-OUTPUTS/data-analysis/amplitude-digest-[date].md
```

---

## Working Without Amplitude

If your analytics stack uses Mixpanel, Heap, PostHog, or Looker, the connector names differ but the workflow is identical:

| Platform | MCP Package | Query Style |
|---------|------------|------------|
| Mixpanel | Search MCP registry for community server | Insights API |
| PostHog | Search MCP registry for community server | Insights API |
| Heap | Search MCP registry for community server | SQL via Heap Connect |
| Looker | Search MCP registry for community server | LookML / REST API |

> **Note:** Analytics tool MCP availability changes frequently. Before building a workflow around any connector, run `claude mcp list` after adding it and verify the connection works with a simple test query.

The prompt structure is the same — just replace "amplitude" with your tool name.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Amplitude (or your analytics tool) MCP connector configured
- [ ] At least one funnel query run and memo generated
- [ ] Feature adoption analysis run for your most recent shipped feature
- [ ] Automated weekly Amplitude digest pipeline set up in Cowork

---

## Next: Module 7.5
Connecting Notion — turning your company wiki into an active database.

```
/start-m7-5
```
