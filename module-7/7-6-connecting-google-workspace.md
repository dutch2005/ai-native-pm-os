# Module 7.6 — Connecting Google Workspace: Gmail, Calendar, and Drive

**Time:** ~40 minutes  
**Outcome:** Claude can search your emails for customer feedback, check your calendar for meeting context, and draft replies directly from your PM OS.

---

## Why Connect Google Workspace?

Much of a PM's qualitative data lives in email: customer complaints forwarded by sales, executive thread escalations, and vendor communications. Furthermore, your calendar dictates your context.

By connecting Google Workspace, you eliminate the context switch. You can ask Claude to "summarize the email thread from the CTO of Datastream Co" or "prep me for my next meeting," turning a communication tool into a queryable database.

---

## Setting Up the Google Workspace MCP Connector

Google publishes an official CLI that exposes Gmail, Calendar, Drive, Sheets, and Docs as MCP tools.

### Step 1: Install the Google Workspace CLI

```bash
npm install -g @googleworkspace/cli
```

### Step 2: Authenticate with your Google account

```bash
gws auth login
```

This opens a browser window and walks you through OAuth. Sign in with the Google account whose Gmail, Calendar, and Drive you want Claude to access. The CLI stores a refresh token locally — you only do this once.

### Step 3: Register with Claude Code

```bash
# Connect Drive, Gmail, Calendar, and Sheets
claude mcp add google-workspace -- gws mcp -s drive,gmail,calendar,sheets
```

Available services: `drive`, `gmail`, `calendar`, `sheets`, `docs` — include only what you need.

Verify it was added:
```bash
claude mcp list
# Should show: google-workspace
```

> **Security:** `gws auth login` stores credentials in `~/.config/gws/`. Never copy this folder to a shared location or commit it to git. Add it to `.gitignore`: `echo "~/.config/gws/" >> .gitignore`

On first use from Claude Code, if prompted to re-authorize, run `gws auth login` again in your terminal.

---

## Core Google Workspace Workflows

### 1. Customer Discovery via Gmail
Stop digging through your inbox to piece together customer sentiment.

```
Use the google MCP tool to search my Gmail for any emails from "@datastreamco.com" 
or containing the word "Datastream" in the last 14 days.

Summarize their current pain points, specifically looking for mentions of "API" or "rate limits".
Provide direct quotes where applicable.
```

### 2. Meeting Prep via Calendar
Get instant context before jumping into a call:

```
Use the google MCP tool to check my calendar for my next meeting today.
Who am I meeting with? 
Then, search my recent emails for threads involving those attendees and provide a 
3-bullet brief on what we last discussed so I am prepared.
```

### 3. Drafting Executive Updates
Combine Notion/local files and Gmail:

```
Read CLAUDE-OUTPUTS/strategy-docs/q2-okr-update.md.
Use the google MCP tool to draft an email to Dev Kapoor (CEO) with the subject "Q2 OKR Status Update".
Include a brief TL;DR at the top and paste the contents of the update.
Save it as a draft in my Gmail so I can review before sending.
```

---

## Security & Boundary Setting

With great access comes great responsibility. Your PM OS now has access to your inbox.
- **Never** instruct Claude to send emails automatically without drafting them first.
- Always use the explicit command to "create a draft" so you maintain the final human-in-the-loop sign-off.

---

## Hands-On Exercise

**Task:** Automate your meeting prep.

1. Ensure the Google MCP server is connected and authenticated.
2. In Claude Code, run the following prompt:
   `Use the google MCP tool to find the next external meeting on my calendar (not including internal team syncs). Tell me who the external participants are, and search my Gmail for any recent interactions with them.`
3. Evaluate the summary. Did it save you 10 minutes of inbox searching?

---

## Module Checkpoint

- [ ] Google Workspace MCP connector configured and authenticated
- [ ] You have successfully searched your inbox using Claude
- [ ] You have checked your calendar events via Claude

---

## Next: Module 7.7
Building a custom MCP server — when none of the existing connectors do exactly what you need.

```
/start-m7-7
```
