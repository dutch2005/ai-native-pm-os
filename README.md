# AI-Native PM OS
### Your Complete Product Management Operating System — Built with Claude Code

---

> **Not a tutorial. A real, deployable work infrastructure.**
> By the time you finish, you won't just know Claude Code — you'll have a working PM command center you use every day.

---

## What This Course Is

Most AI courses teach you to prompt. This course teaches you to **operate**.

The **AI-Native PM OS** is a structured, hands-on program that transforms Claude Code into your personal product management infrastructure — a living system that handles research synthesis, PRD generation, stakeholder prep, data analysis, and team handoffs, all within a single command-line environment.

**Format:** Interactive modules inside Claude Code + reference guides + weekly community challenges  
**Time:** ~40–50 hours total | 30-min lessons | 100% self-paced  
**Stack:** Claude Code (required) | Meridian (your practice B2B SaaS company)

---

## The Agents & Workflows You Will Build

By Module 10, your Claude Code environment won't just be a chatbot. You will have built a suite of **specialized, autonomous PM agents and workflows**, including:

- 🕵️ **The Competitive Intelligence Agent:** Runs daily sweeps of competitor pricing pages and documentation, dropping a formatted threat-analysis memo into your Slack.
- 📊 **The "Peep-Free" Analytics Agent:** Enforces disciplined A/B test analysis, refusing to output metrics until your pre-registered sample size is reached.
- 📝 **The PRD-to-Jira Pipeline Agent:** Reads your 6-page PRD, identifies edge cases you missed, and automatically generates Jira epics and stories directly into your backlog via MCP.
- 🗣️ **The Customer Voice Synthesizer:** Reads 500 Zendesk tickets via Google Workspace/Notion MCP, clusters the complaints by Jobs-to-be-Done, and generates a prioritized discovery brief.
- 🎨 **The "Vibe Coder" Prototyper:** Takes a half-baked PRD flow and instantly spins up a clickable HTML prototype you can send to your CTO on Vercel.
- 🛡️ **The Board-Level Executive Agent:** Audits your OKR updates against the "Anti-Slop" guidelines, aggressively cutting PM jargon to produce a crisp narrative the CEO will actually read.

You aren't just learning to prompt. You are building these agents.

---

## The Meridian Company

Throughout this course, you'll work with **Meridian** — a fictional but richly detailed B2B SaaS company. Meridian sells a workflow orchestration platform to mid-market operations teams. It has:

- A defined product strategy, OKRs, and roadmap
- Realistic user research data, support tickets, and analytics
- Stakeholder personas: skeptical CTO, growth-obsessed CEO, cautious CFO
- A sales motion, competitive landscape, and pricing model

Everything you build in this course will be grounded in Meridian's context. By Module 10, your deliverables will look like they came from a senior PM at a real company.

---

## Course Map

| Module | Title | Hours | Core Skill |
|--------|-------|-------|-----------|
| 0 | Setup & Orientation | 3–4h | Environment, mental model |
| 1 | CLAUDE.md Mastery | 3–4h | Context engineering |
| 2 | File & Memory Operations | 3–4h | Workspace architecture |
| 3 | PRDs & Specs | 4–5h | Document generation |
| 4 | Data & Analytics | 4–5h | Metrics workflows |
| 5 | Research & Discovery | 4–5h | Synthesis at scale |
| 6 | Stakeholder & Strategy | 4–5h | Executive artifacts |
| 7 | MCP & Tool Integrations | 5–6h | Real-stack connections |
| 8 | Team Workflows | 3–4h | Collaboration systems |
| 9 | Vibe Coding for PMs | 5–6h | Prototype + deploy |
| 10 | Capstone Project | 6–8h | Portfolio artifact |

---

## Prerequisites

| Tool | Required | Install |
|------|----------|---------|
| Claude Code | ✅ Yes | https://claude.ai/code |
| Claude Pro or Team plan | ✅ Yes | https://claude.ai |
| Python 3.8+ | ✅ Yes | https://python.org/downloads |
| Git | ✅ Yes | https://git-scm.com |

---

## How to Install

### Option A — One-liner (recommended)

Paste this into your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/vishalmdi/ai-native-pm-os/main/install.sh | bash
```

This checks prerequisites, clones the repo into `~/ai-native-pm-os`, and runs first-time setup automatically.

---

### Option B — Manual install

```bash
git clone https://github.com/vishalmdi/ai-native-pm-os.git
cd ai-native-pm-os
bash setup.sh
```

---

### Start your first lesson

```bash
cd ~/ai-native-pm-os   # or wherever you installed it
claude                  # opens Claude Code in the course directory
```

Then in Claude Code:

```
/lesson 0-1
```

---

### Optional: progress dashboard

In a separate terminal window:

```bash
python3 course-server.py
```

Then open **http://localhost:4242** in your browser.

---

## Slash Command Reference

| Command | What it does |
|---------|-------------|
| `/lesson 0-1` | Load a specific lesson (replace `0-1` with any lesson ID) |
| `/next` | Continue from where you left off |
| `/complete` | Mark the current lesson done and update your progress |
| `/progress` | View a completion table across all 11 modules |
| `/context-check` | Audit your CLAUDE.md health |
| `/meridian` | Load the Meridian company context |

---

## Principles of This Course

1. **You build, not watch.** Every lesson has a hands-on deliverable.
2. **Real context, not toy examples.** Meridian is designed to reflect real B2B PM work.
3. **Cumulative.** Each module's output feeds the next.
4. **Yours to keep.** Every file you create is production-ready for real use.
5. **Cost-conscious.** We teach you to use the right model at the right time.

---

## Community Challenges

Each module ends with an optional community challenge:
- Share your output in the course community thread
- Review two peers' CLAUDE.md setups
- Vote on the best research synthesis of the week

---

*AI-Native PM OS — Original curriculum. All company names, data, and scenarios are fictional and created for educational purposes.*
