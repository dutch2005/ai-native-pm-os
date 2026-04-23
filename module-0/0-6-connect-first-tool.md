# Module 0.6 — Connect Your First Tool (MCP)

**Time:** ~30 minutes  
**Outcome:** At least one MCP connector active; Claude can pull live data from a real tool

---

## The Problem Before Connectors

Without connectors, Claude knows what you tell it. That means you copy-paste data, export CSVs manually, and relay information between tools by hand.

With connectors (MCP), Claude acts *inside* your tools. It can search Slack, create Jira tickets, read a Notion page, or pull your latest metrics — without you lifting a finger to transfer the data.

This is the difference between Claude as a writing assistant and Claude as a workflow participant.

---

## What Is MCP?

**MCP** (Model Context Protocol) is an open standard that lets Claude connect to external tools and services. Think of it like a plugin system — each connector adds a new capability.

Connectors come in two types:

| Type | What It Does | Examples |
|------|-------------|---------|
| **Read** | Claude pulls data from your tool | Search Slack threads, read a Notion page |
| **Write** | Claude acts in your tool | Create a Jira ticket, post a Slack message |

---

## The PM Tool Stack — Connectors That Matter

| Tool | What Claude Can Do With It |
|------|--------------------------|
| **Slack** | Search threads, summarize decisions, draft messages |
| **Notion** | Read pages, create documents, update databases |
| **Jira / Linear** | Create issues, update sprints, pull velocity data |
| **Google Drive** | Read docs, write summaries, find files |
| **Amplitude / Mixpanel** | Pull metric snapshots (with API connector) |
| **GitHub** | Read PRs, review specs, check engineering notes |

---

## Installing Your First Connector

We'll install the **Filesystem** connector first — it's local, requires no auth, and teaches you the pattern.

### Step 1: Check your Claude Code config location
```bash
ls ~/.claude/
```

### Step 2: Create or edit your MCP config file
```bash
touch ~/.claude/mcp.json
```

### Step 3: Add the filesystem connector

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/YOUR_USERNAME/Documents"
      ]
    }
  }
}
```

Replace `YOUR_USERNAME` with your actual username.

### Step 4: Restart Claude Code and verify
```bash
claude
```

Ask:
```
What MCP tools do you have available?
```

Claude should list `filesystem` as an available server.

---

## Installing Slack Connector (Optional — Requires Slack Token)

If you use Slack professionally, this is the highest-value connector for PMs.

### Get your Slack token
1. Go to api.slack.com/apps
2. Create a new app → "From Scratch"
3. Add scopes: `channels:read`, `channels:history`, `users:read`
4. Install to workspace → copy the OAuth token

### Add to mcp.json
```json
{
  "mcpServers": {
    "filesystem": { ... },
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-your-token-here",
        "SLACK_TEAM_ID": "T0XXXXXXXXX"
      }
    }
  }
}
```

---

## What a Connected Workflow Looks Like

**Before connectors (manual):**
1. Open Slack, search for the thread
2. Copy relevant messages
3. Paste into Claude
4. Ask for a summary
5. Copy summary back to wherever you need it

**After connectors (automated):**
```
Summarize the last 48 hours of discussion in the #product-decisions Slack channel, 
extract any open questions, and save the summary to CLAUDE-OUTPUTS/slack-digests/today.md
```

Claude searches Slack, pulls the content, writes the summary, saves the file — all in one step.

---

## Hands-On Exercise

**Task:** Test the filesystem connector.

1. Install and configure the filesystem MCP connector (instructions above).
2. Start Claude Code and ask:
   ```
   Using the filesystem tool, list all markdown files in my AI-Native-PM-OS directory.
   ```
3. Claude should return a file list without you pointing it to any folder manually.
4. Now ask:
   ```
   Read the file ABOUT-ME/CLAUDE.md using the filesystem tool and tell me 
   what my current focus is.
   ```

If Claude reads the file directly via the tool — your first connector is working.

---

## Module Checkpoint

- [ ] `~/.claude/mcp.json` exists with at least the filesystem connector
- [ ] Claude confirms MCP tools are available when asked
- [ ] Claude can read a file via the filesystem connector without you pasting content
- [ ] (Optional) Slack connector configured and tested

---

## Next: Module 0.7
The PM AI mental model — agents, sub-agents, parallel tasks, and memory hierarchy.

```
/start-m0-7
```
