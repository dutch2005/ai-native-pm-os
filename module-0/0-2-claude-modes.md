# Module 0.2 — The Claude Ecosystem: Every Surface Explained

**Time:** ~25 minutes  
**Outcome:** You know exactly which Claude surface to use for which PM task — and why Claude Code + Cowork are your primary tools

---

## The Mistake Most People Make

Most people who use Claude treat it like a single product. They open claude.ai, type a question, get an answer, close the tab.

That's like using a full office suite to only write sticky notes.

As of 2026, Claude ships as **five distinct surfaces** — each with a different set of capabilities, persistence levels, and ideal use cases. This lesson maps all five so you always pick the right tool.

---

## The Five Claude Surfaces

### 1. Claude Chat (claude.ai)
**What it is:** The web interface. The most familiar surface.  
**Persistence:** Zero — closes when you close the tab  
**Best for:** Quick questions, one-off brainstorming, exploring ideas  
**Latest feature:** Native memory (auto-summarizes past conversations across sessions), interactive charts and visualizations inline, incognito chats  

**PM use case:** "Draft me a quick email to delay this sprint by a week."

> **Limitation:** No file system. No automation. No slash commands. No tools unless you manually add connectors. Every session starts cold unless memory is on.

---

### 2. Claude Projects (claude.ai/projects)
**What it is:** A persistent workspace within claude.ai. Upload documents once; they stay for every conversation in that project.  
**Persistence:** Document-level — your uploads persist, but sessions are still web-based  
**Best for:** Team collaboration on shared documents, recurring deliverables with stable reference files  
**Latest feature:** Project sharing across Team/Enterprise orgs  

**PM use case:** Your design team uploads the latest user research. You run synthesis from the same project every sprint without re-uploading.

> **Limitation:** Still web-based. No automation. No script execution.

---

### 3. Claude Code (terminal) ← **Your primary tool in this course**
**What it is:** Claude running inside your terminal with full access to your local file system, shell commands, MCP connectors, and sub-agent orchestration.  
**Persistence:** Full — CLAUDE.md files persist context indefinitely  
**Best for:** Building a real PM workflow infrastructure  
**Latest features:**
- `/security-review` command for code audits
- Claude Code on the web (browser-based Claude Code access)
- Team plan now includes Claude Code on standard seats
- Power user features: sub-agents, parallel tasks, GitHub integration

**PM use case:** Everything in Modules 1–10 of this course.

> **Why it wins:** Claude Code is the only surface where you build cumulative infrastructure. Your CLAUDE.md, your slash commands, your skills, your outputs — they all persist and compound over time.

---

### 4. Claude Cowork (Claude Desktop app) ← **Your second key tool**
**What it is:** Claude Code's agentic capabilities brought into the Claude Desktop app — for knowledge workers, not just developers. Runs in an isolated VM on your computer.  
**Persistence:** Full — connected to your local environment  
**Best for:** Background tasks, scheduled workflows, computer use, knowledge work automation  
**Features include (verify current availability at [anthropic.com/product/claude-cowork](https://www.anthropic.com/product/claude-cowork)):**
- **Dispatch / Scheduled tasks** — recurring tasks that run automatically on a schedule (your weekly digest, your Monday sprint brief)
- **Computer use** — Claude can open apps, click, navigate your screen, and act on your behalf (Pro and Max plans)
- **Plugins** — browse a marketplace of plugins (Marketing, Data, Legal, etc.) via the Customize section
- **Skills** — org-wide skill deployment, partner skills from the directory at claude.com/connectors
- **Persistent agent thread** — manage tasks from your phone and pick them back up on desktop
- **OpenTelemetry support** for enterprise monitoring
- **Analytics API** for tracking usage across your organization

> Feature availability varies by plan and may change as the product evolves. Check the product page before building automated workflows around a specific feature.

**PM use case:** "Every Monday at 8am, read last week's Amplitude export, write a narrative digest, and post it to the #product-data Slack channel."

> **Key distinction from Claude Code:** Cowork is for *ongoing, scheduled, autonomous work*. Claude Code is for *active, interactive sessions*. Use both together.

---

### 5. Claude in Chrome (browser extension)
**What it is:** Claude embedded directly in your browser, able to read pages, click, fill forms, and run workflows across tabs.  
**Persistence:** Session-level — slash commands save your best prompts  
**Best for:** Browser-based research, competitor analysis, form automation, multi-tab workflows  
**Latest features:**
- Slash commands to save your best browser prompts
- Multi-tab navigation (drag tabs into Claude's group)
- Smart navigation on Slack, Gmail, Google Calendar, Google Docs, GitHub
- Scheduled browser tasks
- Computer use research preview

**PM use case:** "Scan the last 7 days of G2 reviews for our top 3 competitors and extract recurring themes."

---

## The PM Surface Decision Map

```
Task type → Right surface

Quick one-off question or draft         → Claude Chat
Shared team reference with uploads      → Claude Projects  
Active PM work session (your OS)        → Claude Code  ← default
Recurring automated background task     → Claude Cowork (Dispatch)
Browser-based research or web action    → Claude in Chrome
```

---

## Where Routines Fit In

**Claude Routines** is the unofficial name for scheduled, repeating workflows. In Anthropic's product, this is implemented through:

1. **Cowork → Scheduled tasks** (Dispatch) — runs locally on your computer
2. **Claude in Chrome → Scheduled tasks** — runs in the browser
3. **Claude Code → cron-style scripts** — you schedule via your OS

You'll build your first routine in Module 4 (weekly metrics digest). By Module 8, you'll have multiple routines running autonomously.

---

## The Current Model Lineup (April 2026)

| Model | Released | Best For |
|-------|----------|---------|
| Claude Opus 4.7 | April 2026 | Complex reasoning, vision tasks, long-running coding |
| Claude Sonnet 4.6 | Feb 2026 | 90% of PM work — 1M token context window (beta) |
| Claude Haiku 4.5 | Oct 2025 | Fast, cheap, structured tasks |

> **Course default:** Sonnet 4.6 for most work. Opus 4.7 when reasoning depth matters. Haiku 4.5 for formatting and classification.

---

## Hands-On Exercise

**Task:** Experience the difference between a stateless and stateful session.

1. **Claude Chat:** Go to claude.ai → ask `What product am I working on?` → It says "I don't know." → Close the tab.

2. **Claude Code:** Open your terminal → `claude` → Ask the same question. With your CLAUDE.md set up (Module 0.4), it will answer correctly — without you saying a word.

3. **Reflection:** The second session had context before you typed anything. That's the compound advantage of building on a persistent surface.

---

## Module Checkpoint

- [ ] You can name all five Claude surfaces and their key differences
- [ ] You understand that Claude Code is your primary active session tool
- [ ] You understand that Cowork is for scheduled/autonomous background work
- [ ] You know the current model lineup and which one this course defaults to

---

## Next: Module 0.3
Build your 4 core folders — the workspace scaffold that organizes everything.

```
/start-m0-3
```
