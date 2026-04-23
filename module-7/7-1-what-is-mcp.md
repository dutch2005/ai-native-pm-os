# Module 7.1 — What Is MCP and Why It Changes Everything for PMs

**Time:** ~30 minutes  
**Outcome:** Deep understanding of MCP, what it enables for PMs, and a working connector configured

---

## The Context Problem Before MCP

Before MCP, the workflow looked like this:

1. You open Jira, find the ticket
2. You copy the description
3. You paste it into Claude
4. Claude gives you a response
5. You copy the response back into Jira
6. You update the ticket manually

Every step that crosses a tool boundary is a copy-paste step. You are the integration layer. You are the bottleneck.

MCP eliminates the copy-paste loop.

---

## What MCP Is

**MCP** (Model Context Protocol) is an open standard published by Anthropic that allows Claude to connect directly to external tools and services. Instead of you relaying information between Claude and your tools, Claude reads and writes directly.

An MCP connector is a small server that translates Claude's requests into tool-specific API calls. When you say "create a Jira ticket," Claude calls the Jira MCP server, which calls the Jira API, which creates the ticket.

You don't move data. Claude does.

---

## The Three Types of MCP Connectors

| Type | What It Does | Example |
|------|-------------|---------|
| **Read** | Claude fetches data from your tool | Search Slack threads, read a Notion page |
| **Write** | Claude creates or updates data in your tool | Create Jira ticket, post Slack message |
| **Interactive** | Claude both reads and writes, responding to context | Pull metrics, write commentary, post digest |

---

## Where Connectors Live in Claude's Ecosystem

### Claude Code (terminal)
Configure via `~/.claude/mcp.json`. Active for all Claude Code sessions.  
Best for: Local file operations, developer-adjacent tools (GitHub, databases)

### Claude Desktop / Cowork
Configure via Desktop app settings → Customize → Connectors.  
Best for: Knowledge work connectors (Slack, Notion, Google Workspace, Jira)

### Claude.ai (web)
Add via Settings → Connectors → Browse directory.  
Best for: Web-based connectors, team-shared integrations

### Pre-built vs. Custom
- **Pre-built:** Available in the connector directory at claude.com/connectors — one-click install
- **Custom (remote MCP):** You build a connector for your specific internal tools
- **Desktop Extensions (MCPB):** Packaged connectors installable via Claude Desktop

---

## The PM Connector Stack

Here are the connectors that provide the highest leverage for PM work:

| Connector | PM Use Case | Where to Install |
|-----------|-------------|-----------------|
| **Slack** | Search threads, summarize decisions, post digests | Desktop / Web |
| **Notion** | Read pages, create PRDs, update databases | Desktop / Web |
| **Jira** | Create issues, update sprints, pull velocity | Desktop / Web |
| **Linear** | Same as Jira for Linear users | Desktop / Web |
| **Google Drive** | Read docs, find files, write summaries | Desktop / Web |
| **GitHub** | Read PRs and issues, check eng specs | Claude Code / Desktop |
| **Amplitude** | Pull metric snapshots (via API connector) | Custom |
| **Filesystem** | Full local file access | Claude Code |
| **Google Calendar** | Draft events, check availability | Desktop / Web |

---

## Installing the Slack Connector (Step-by-Step)

This is the highest-value connector for most PMs. Here's how to set it up in Claude Desktop.

### Step 1: Get Slack API credentials
1. Go to [api.slack.com/apps](https://api.slack.com/apps)
2. Click **Create New App** → **From Scratch**
3. Name: "Claude PM Assistant" | Workspace: Your team workspace
4. Under **OAuth & Permissions**, add these Bot Token Scopes:
   - `channels:read`
   - `channels:history`
   - `groups:read` (for private channels)
   - `users:read`
   - `chat:write` (for posting digests)
5. Click **Install to Workspace**
6. Copy the **Bot User OAuth Token** (starts with `xoxb-`)
7. Copy your **Team ID** (Settings → scroll to bottom → Workspace ID)

### Step 2: Add to Claude Desktop
1. Open Claude Desktop
2. Click **Customize** (bottom-left sidebar)
3. Click **Connectors** → **Add Custom**
4. Select **Add via MCP config** and paste:

```json
{
  "slack": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-slack"],
    "env": {
      "SLACK_BOT_TOKEN": "xoxb-YOUR-TOKEN-HERE",
      "SLACK_TEAM_ID": "T0XXXXXXXXX"
    }
  }
}
```

### Step 3: Test it
In Claude (Desktop or Code):
```
Search the last 7 days of messages in the #product-decisions Slack channel.
Summarize the key decisions made and any open questions flagged.
```

---

## What Changes When MCP Is Active

**Before MCP:**
- You summarize the Slack thread and paste it in
- You create the Jira ticket from Claude's output manually
- Every tool interaction is a context switch

**After MCP:**
```
Read the last 5 days of discussion in #approval-routing-feature on Slack.
Extract any product decisions that were made, any open questions raised,
and any blockers mentioned.

Then create a Jira ticket titled "Sprint Review: Approval Routing Decisions"
in the Meridian project with this summary in the description.
Label it "sprint-review" and assign it to me.
```

Claude reads Slack and writes to Jira in one prompt. You never touch either tool.

---

## Hands-On Exercise

**Task:** Install at least one connector and run a real query.

1. Install the filesystem connector (from Module 0.6) if you haven't already
2. Optionally install the Slack connector using the steps above
3. Test with a real query:
   - Filesystem: "List all markdown files in my CLAUDE-OUTPUTS folder created in the last 7 days"
   - Slack: "What was discussed in #product-data this week?"

4. Note how different the experience is from copy-paste. That difference is your future.

---

## Module Checkpoint

- [ ] You can explain what MCP is and the three connector types
- [ ] You know the difference between Claude Code, Desktop, and Web connector configs
- [ ] At least one connector is installed and returning live data
- [ ] You've run a prompt that actually interacts with an external tool

---

## Next: Module 7.2
Connect Jira — create issues, update sprints, pull velocity data.

```
/start-m7-2
```

> **Optional extension:** Module 7.8 covers additional connectors (GitHub, PostgreSQL, Brave Search, Playwright, Memory Bank) once you've completed the core stack in 7.2–7.7.
