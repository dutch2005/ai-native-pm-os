# Module 7.8 — Additional Connectors: GitHub, Databases, Search, and More

**Time:** ~30 minutes (pick the connectors relevant to your stack)  
**Outcome:** A broader MCP toolkit — connect GitHub for PR context, a database for live data, web search for research, and browser automation for scraping

> **Prerequisite:** Complete 7-1 before this lesson. You need to understand the `claude mcp add` pattern before configuring these.

---

## Why More Connectors?

Modules 7.2–7.7 covered the core PM stack (Jira, Slack, Amplitude, Notion, Google Workspace). This lesson adds power-user connectors that unlock specific high-value workflows:

| Connector | Best For |
|-----------|---------|
| **GitHub** | Reading PRs and specs without asking Engineering |
| **PostgreSQL** | Querying your product's own database directly |
| **Context7** | Getting live, version-accurate library docs into prompts |
| **Brave Search** | Web research inside Claude Code (no copy-paste) |
| **Playwright** | Scraping competitor pages, automating web tasks |
| **Memory Bank** | Persistent memory that survives across sessions |

Install only what's relevant to your work. Each is independent.

---

## GitHub

**Use case:** Read PRs and issue discussions to understand what Engineering is building and why — without scheduling a sync.

### Setup

```bash
npm install -g @modelcontextprotocol/server-github

# Create a personal access token at: github.com/settings/tokens
# Required scopes: repo (read), pull_requests (read)
claude mcp add \
  -e GITHUB_PERSONAL_ACCESS_TOKEN=ghp_your_token_here \
  github -- github-mcp-server
```

### PM workflows

```
Use the github MCP tool to list all open PRs in the meridian-os repo 
that haven't been reviewed in more than 3 days.

For each, extract the title, author, and description.
Flag any that touch the approval-routing module.
```

```
Use the github MCP tool to read the merged PRs from the last 2 weeks.
Map each PR to our roadmap items in PROJECTS/meridian-os/roadmap.md.
Identify any engineering work that was shipped but has no corresponding roadmap item.
```

---

## PostgreSQL

**Use case:** Query your product's own database for cohort analysis, feature usage counts, or activation funnel data — without needing a BI tool.

> **Access note:** You need a read-only database URL from your data/engineering team. Never use a write-access production connection from Claude Code.

### Setup

```bash
# No global install needed — runs via npx
claude mcp add \
  -e POSTGRES_URL=postgresql://readonly_user:password@host:5432/yourdb \
  postgres -- npx @modelcontextprotocol/server-postgres
```

### PM workflows

```
Use the postgres MCP tool to run this query:

SELECT 
  date_trunc('week', created_at) as week,
  COUNT(*) as new_signups,
  COUNT(CASE WHEN first_workflow_at IS NOT NULL THEN 1 END) as activated
FROM users
WHERE created_at > NOW() - INTERVAL '90 days'
GROUP BY 1
ORDER BY 1;

Show me the weekly activation rate trend and flag any week where activation 
dropped more than 5 percentage points week-over-week.
```

---

## Context7 — Live Documentation Lookup

**Use case:** When writing prompts that involve specific APIs, libraries, or frameworks, Context7 fetches the live docs so Claude doesn't hallucinate outdated method names or parameters.

### Setup

```bash
# No install needed — runs via npx
claude mcp add context7 -- npx @upstash/context7-mcp
```

### How to use

Add `use context7` to any prompt that involves a specific library:

```
I'm building a custom MCP server in Node.js that uses the Anthropic SDK.
use context7

Show me how to implement tool_use with streaming responses.
```

Context7 fetches the current SDK docs before answering. No more hallucinated method names from stale training data.

---

## Brave Search — Web Research Inside Claude Code

**Use case:** Research competitors, find industry benchmarks, check pricing pages — without leaving Claude Code or copy-pasting from a browser.

### Setup

1. Get a free API key at: https://brave.com/search/api/
2. Register the connector:

```bash
claude mcp add \
  -e BRAVE_API_KEY=your_api_key_here \
  brave-search -- npx @modelcontextprotocol/server-brave-search
```

### PM workflows

```
Use the brave-search MCP tool to search for "Zapier enterprise pricing 2025".
Find any public pricing page or press release that mentions their enterprise tier cost.
Report the source URL and any numbers you find.
Do not infer or estimate — only report what the search results contain.
```

```
Use the brave-search MCP tool to find G2 reviews of Make (formerly Integromat) 
posted in the last 6 months. Look for recurring complaints about the product.
Report direct quotes where available.
Save to: PROJECTS/meridian-os/research/competitive/make-recent-reviews.md
```

---

## Playwright — Browser Automation

**Use case:** Automate repetitive browser tasks — scraping a competitor's changelog, taking screenshots for a review, checking a feature is live on staging.

### Setup

```bash
npm install -g @playwright/mcp
claude mcp add playwright -- playwright-mcp
```

### PM workflows

```
Use the playwright MCP tool to:
1. Navigate to https://zapier.com/blog/changelog
2. Extract the titles and dates of all posts from the last 60 days
3. Return them as a list

Save to: PROJECTS/meridian-os/research/competitive/zapier-changelog-[date].md
```

> **Important:** Only scrape public pages. Never automate login flows or bypass paywalls. Playwright respects robots.txt — verify a site allows scraping before building workflows around it.

---

## Memory Bank — Persistent Memory Across Sessions

**Use case:** Claude's context resets every session. Memory Bank gives Claude a persistent store it can write to and read from — so it remembers your preferences, recurring decisions, and project context without re-reading CLAUDE.md every time.

### Setup

```bash
npx skills add anthropic/memory-bank
```

This installs as a Claude Code skill, not a standard MCP server. Restart Claude Code after install.

### How it works

Memory Bank adds two capabilities:
- Claude can **save** key facts to a persistent store mid-conversation
- Claude will **recall** relevant facts automatically at the start of new sessions

### PM workflows

After setup, tell Claude what to remember:

```
Remember: I'm the PM for Meridian OS. My top priority this quarter is reducing 
activation time from 11 days to 7 days. When I start a new session without 
specifying a topic, assume I'm working on activation.
```

```
Remember: Dev Kapoor is our CEO — revenue-focused, skeptical of features without 
clear ARR impact. When I say "prepare for Dev," assume he needs numbers first, 
narrative second.
```

---

## Hands-On Exercise

**Task:** Install one connector from this lesson based on your role and stack.

Recommended by role:
- **If you work closely with Engineering** → GitHub (read PR context without sync meetings)
- **If you have data access** → PostgreSQL (query activation/retention directly)
- **If you do competitive research** → Brave Search (web research without copy-paste)
- **If you do frequent discovery sessions** → Memory Bank (retain stakeholder context)

1. Install your chosen connector
2. Run one real query using it
3. Save the output to `CLAUDE-OUTPUTS/research/` or `CLAUDE-OUTPUTS/data-analysis/`

---

## Module Checkpoint

- [ ] At least one additional connector installed from this lesson
- [ ] One real query run and output saved
- [ ] You understand which connector to reach for based on the task type

---

## Module 7 Complete ✅

You now have a full MCP toolkit:
- 7-1: What MCP is and the connector architecture
- 7-2: Jira (project management + sprint tracking)
- 7-3: Slack (team updates + signal extraction)
- 7-4: Amplitude (analytics + metric context)
- 7-5: Notion (knowledge base + PRD storage)
- 7-6: Google Workspace (Gmail, Calendar, Drive)
- 7-7: Custom MCP servers (build what doesn't exist)
- 7-8: Additional connectors (GitHub, DB, Search, Browser, Memory)

**Start Module 8:**
```
/start-m8-1
```

*Module 8: Team OS — scaling your PM system to work across a team.*
