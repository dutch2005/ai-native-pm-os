# Module 7.5 — Connecting Notion: Turning Your Wiki into an Active Database

**Time:** ~35 minutes  
**Outcome:** Claude can search your company's Notion workspace, read existing PRDs, and create structured meeting notes automatically.

---

## Why Notion Integration is Essential

If your company uses Notion as its brain, treating it as a passive read-only wiki is a missed opportunity. Without MCP, you copy-paste PRD templates, manually link Jira tickets, and spend 10 minutes formatting meeting notes.

With the Notion MCP, Claude can search across your workspace to find context, automatically structure and append notes to a database, and update PRD statuses without you leaving the terminal.

---

## Setting Up the Notion MCP Connector

### Prerequisites
- A Notion account with workspace admin or developer access
- An internal Notion integration token

### Step 1: Create a Notion Integration
1. Go to https://www.notion.so/my-integrations
2. Click **New integration**.
3. Name it `Meridian PM Bot` and associate it with your workspace.
4. Copy the **Internal Integration Secret** (starts with `secret_`).

### Step 2: Share Pages/Databases with the Integration
Notion integrations only have access to pages explicitly shared with them.
1. Go to your PM Vault or Product Roadmap database in Notion.
2. Click the `...` menu at the top right of the page.
3. Select **Add connections** and choose `Meridian PM Bot`.

### Step 3: Configure Claude Code

```bash
# Install the official Notion MCP server
npm install -g @notionhq/notion-mcp-server

# Register it with Claude Code (replace the token with yours)
claude mcp add -e NOTION_API_TOKEN=secret_your-integration-token-here notion -- notion-mcp-server
```

Verify it was added:
```bash
claude mcp list
# Should show: notion
```

---

## Core Notion Workflows via MCP

### 1. Semantic Search for Context
Before writing a PRD, see what already exists:

```
Use the notion MCP tool to search for any pages mentioning "Approval Routing" or "Out of Office".
Summarize the current state of these features based on the documents you find.
```

### 2. Auto-Generating Meeting Notes into a Database
Assuming you have a "Meeting Notes" database shared with the integration:

```
I just had a meeting with the enterprise customer "Datastream Co" about their API usage.
They are frustrated with rate limits and want a dedicated SLA.
I promised to follow up by next Tuesday with an updated contract.

Use the notion MCP tool to:
1. Search for the "Meeting Notes" database ID.
2. Create a new page in that database.
3. Set the Title to "Datastream Co - API Escalation".
4. Format the content with a summary, action items, and next steps.
```

### 3. Syncing PRDs to Notion
If you draft your PRD locally in markdown, you can publish it directly to Notion:

```
Read CLAUDE-OUTPUTS/prds/api-rate-limiting-prd.md.
Use the notion MCP tool to create a new page under the "Product Specs" parent page.
Convert the markdown content into Notion blocks and publish it.
Return the URL of the new page so I can share it with the team.
```

---

## Hands-On Exercise

**Task:** Connect Notion and automate your first note.

1. Create a Notion integration and register it using `claude mcp add` (Step 3 above).
2. Create a blank page in Notion called "Claude Playground" and share it with your integration.
3. In Claude Code, ask:
   `Use the notion MCP tool to search for a page called "Claude Playground". Retrieve its ID, and append a new heading and paragraph explaining what MCP is.`
4. Verify the change in your Notion workspace.

---

## Module Checkpoint

- [ ] Notion MCP connector configured and authenticated
- [ ] You have successfully searched for a page using Claude
- [ ] You have written data to a Notion page or database via MCP

---

## Next: Module 7.6
Connecting Google Workspace — querying your Gmail and Drive directly for customer context.

```
/start-m7-6
```
