# Module 7.3 — Connecting Slack: Automated PM Updates to Your Team

**Time:** ~35 minutes  
**Outcome:** Claude posts weekly digests, alerts, and status updates directly to your Slack channels

---

## What Changes When Slack Is Connected

Without Slack MCP: You generate a digest → copy it → open Slack → paste → format → post.  
With Slack MCP: Claude writes the digest and posts it. You wake up to it already in the channel.

For recurring updates (weekly digest, sprint summary, metric alerts), this saves 30+ minutes per week and eliminates the copy-paste failure mode where updates get stale before they're posted.

---

## Setting Up the Slack MCP Connector

### Step 1: Create a Slack App

1. Go to: https://api.slack.com/apps
2. Click "Create New App" → "From scratch"
3. Name: `Meridian PM Bot`
4. Workspace: your workspace
5. Click "Create App"

### Step 2: Configure OAuth Permissions

In the app settings → "OAuth & Permissions" → "Bot Token Scopes", add:
- `chat:write` — post messages
- `channels:read` — list channels
- `channels:history` — read recent messages (optional)

### Step 3: Install the App to Workspace

Click "Install to Workspace" → copy the `Bot User OAuth Token` (starts with `xoxb-`)

### Step 4: Configure Claude Code

```bash
# Install the Slack MCP server package
npm install -g @modelcontextprotocol/server-slack

# Register it with Claude Code (replace both values with yours)
# SLACK_TEAM_ID: go to slack.com, open your workspace URL — the T-prefixed ID is your Team ID
claude mcp add \
  -e SLACK_BOT_TOKEN=xoxb-your-token-here \
  -e SLACK_TEAM_ID=T0123456789 \
  slack -- mcp-server-slack
```

Verify it was added:
```bash
claude mcp list
# Should show: slack
```

### Step 5: Invite the Bot to Channels

In Slack: go to your `#product-updates` channel → type `/invite @Meridian PM Bot`

---

## Posting the Weekly Digest to Slack

```
Run the weekly digest:

1. Read PROJECTS/meridian-os/analytics/weekly-export.csv
2. Generate the narrative digest (follow the /weekly-digest command format)
3. Use the slack MCP tool to post the digest to channel #product-updates

Format the Slack message with these formatting rules:
- Use *bold* for section headers
- Use emoji: 📈 for improving metrics, ⚠️ for flagged metrics, ✅ for on-track items
- Keep the full message under 250 words (Slack readers scan, not read)
- Add a final line: "Full report: CLAUDE-OUTPUTS/data-analysis/digest-[date].md"

Post it. Confirm the channel and timestamp when done.
```

---

## Automated Sprint Update to Engineering Channel

```
Use the jira MCP tool to pull Sprint 16 status.
Then use the slack MCP tool to post to #engineering:

Message format:
---
*Sprint 16 Update — [date]* 🚀

*In Progress:*
[List active tickets with assignees]

*Completed This Week:*
[List completed tickets]

*Blocked:*
⚠️ [Any tickets with blocked status + reason if available]

*On Track for Sprint Close:* [X of Y stories complete]
---

Post it every Friday at 4 PM by scheduling it as a Cowork Dispatch task.
```

---

## The Metric Alert System

The most powerful Slack integration: automatic alerts when a metric crosses a threshold.

Set this up in Cowork:

```
In Claude Desktop → Cowork:

Create a recurring task: "Daily Metric Alert Check"
Schedule: Every weekday at 8 AM

Instructions:
1. Read the most recent data in PROJECTS/meridian-os/analytics/
2. Check these specific thresholds:
   - ORR: Flag if WoW change is < -10%
   - Activation rate: Flag if falls below 60%
   - Support ticket volume: Flag if > 20 new tickets in a single day

3. If ANY threshold is breached:
   - Post an alert to Slack #product-alerts channel
   - Format: ⚠️ [Metric] Alert: [current value] vs threshold [threshold value]
   - Include: One hypothesis for why this might be happening
   - Include: One recommended immediate action

4. If NO thresholds are breached:
   - Do not post anything (avoid notification fatigue)

This is a silent success, loud failure system.
```

---

## Reading Slack for Product Intelligence

Slack isn't just a posting surface — it's a data source:

```
Use the slack MCP tool to read the last 50 messages in #customer-feedback.

Extract:
1. Any customer name mentioned with a complaint or issue
2. Any feature request mentioned by name (even informally)
3. Any competitive mention (Zapier, Make, ServiceNow)
4. Any internal frustration that signals a process problem

Return as a categorized list with the original Slack message text as evidence.
Save to: CLAUDE-OUTPUTS/research/slack-signals-[date].md
```

This turns your internal Slack into a weekly discovery input, automatically.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Slack MCP connector configured and bot invited to at least one channel
- [ ] Weekly digest posted to Slack directly from Claude Code
- [ ] Daily metric alert system set up in Cowork Dispatch
- [ ] At least one Slack channel read for product signals

---

## Next: Module 7.4
Connecting your analytics tool (Amplitude/Mixpanel) to close the full data loop.

```
/start-m7-4
```
