# Module 7.2 — Connecting Jira: Close the PRD-to-Ticket Gap

**Time:** ~40 minutes  
**Outcome:** Claude Code reads your Jira backlog and creates tickets directly from PRDs via MCP

---

## Why Jira Integration Changes Everything

Without MCP: You write tickets in Claude → copy-paste into Jira → lose formatting → re-edit.  
With MCP: Claude writes tickets directly to Jira. You review in Jira. Done.

This is the difference between AI as a drafting assistant and AI as a workflow tool.

---

## Setting Up the Jira MCP Connector

### Prerequisites
- A Jira Cloud account (or access to your company's Jira)
- An Atlassian API token (not your password)
- Claude Code with MCP support
- `uv` (Python package manager) — install once with: `curl -LsSf https://astral.sh/uv/install.sh | sh`

### Step 1: Generate an Atlassian API Token

1. Go to: https://id.atlassian.com/manage-profile/security/api-tokens
2. Click "Create API token"
3. Name it: `claude-code-pm-os`
4. Copy the token — you won't see it again

### Step 2: Add the Jira MCP Server to Claude Code

`mcp-atlassian` is a Python-based MCP server (from the community project at github.com/sooperset/mcp-atlassian). It runs via `uvx` — no separate install step needed.

Register it with Claude Code in one command:

```bash
claude mcp add \
  -e JIRA_URL=https://your-company.atlassian.net \
  -e JIRA_USERNAME=your@email.com \
  -e JIRA_API_TOKEN=your-api-token-here \
  jira -- uvx mcp-atlassian
```

This saves the server to your Claude Code config automatically. To verify it was added:

```bash
claude mcp list
```

You should see `jira` in the list.

### Step 3: Test the Connection

```
Use the jira MCP tool to:
1. List all projects I have access to
2. Show me the 5 most recent tickets in project MERID (or whatever your project key is)
```

If Claude returns a project list — the connection works.

---

## Creating Tickets from PRDs

Now the pipeline:

```
Read CLAUDE-OUTPUTS/prds/approval-routing-tickets-v1.md.

For each ticket in this file, use the jira MCP tool to:

1. Create a Jira issue in project MERID with:
   - Summary: the ticket title
   - Issue type: Story (for user stories) or Bug (for bug fixes)
   - Description: the full ticket content in Jira markdown format
   - Labels: ["approval-routing", "q2-roadmap"]
   - Story Points: map XS=1, S=2, M=3, L=5, XL=8

2. After creating each ticket, return the Jira ticket ID (e.g., MERID-123)

3. After all tickets are created, return a summary table:
   | Ticket Title | Jira ID | Story Points |
   
Save the Jira ID mapping to: CLAUDE-OUTPUTS/prds/approval-routing-jira-ids.md
```

---

## Reading the Backlog for Prioritization

```
Use the jira MCP tool to read my backlog:

1. Pull all tickets in project MERID that are:
   - Status: To Do or In Progress
   - Sprint: Current active sprint
   
2. For each ticket, extract:
   - Title, Assignee, Story Points, Status, Days since created

3. Identify:
   - Any ticket that's been "In Progress" for > 5 days (stale signal)
   - Any ticket with no assignee (ownership gap)
   - Total story points in flight vs. team velocity (if team velocity is known)

4. Return as a sprint health summary for Tara Novak (CTO).
Save to: CLAUDE-OUTPUTS/strategy-docs/sprint-health-[date].md
```

---

## The Ticket Lifecycle Audit

```
Use the jira MCP tool to audit the last completed sprint (Sprint 15):

Pull all tickets that were:
- Completed in Sprint 15
- OR carried over from Sprint 15 into Sprint 16

For completed tickets: what was the average cycle time (created → done)?
For carried-over tickets: what was the most common reason? (look for patterns in ticket comments/labels)

Generate a sprint velocity report:
- Points committed vs. points completed
- Carryover rate (% of committed work that didn't ship)
- Top 3 ticket types by volume

Audience: Tara Novak (CTO)
Save to: CLAUDE-OUTPUTS/strategy-docs/sprint-15-velocity.md
```

---

## Working Without Jira (Fallback Mode)

If your company uses Linear, Asana, or Notion for tickets instead, the same workflow applies with a different MCP connector:

| Tool | MCP Package |
|------|-------------|
| Linear | `@linear/mcp-server` |
| Asana | `asana-mcp-server` |
| Notion | `@notionhq/notion-mcp-server` |
| GitHub Issues | `@modelcontextprotocol/server-github` |

The prompt structure is identical — only the tool name in "Use the [tool] MCP tool to..." changes.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Jira MCP connector configured and connection tested
- [ ] At least 3 tickets created directly in Jira from the approval-routing ticket file
- [ ] Backlog read and sprint health summary generated
- [ ] You can recite what happens if the Jira MCP token expires (re-generate → update config)

---

## Next: Module 7.3
Connecting Slack — getting Claude to post updates, alerts, and summaries directly to your channels.

```
/start-m7-3
```
