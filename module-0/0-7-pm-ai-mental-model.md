# Module 0.7 — The PM AI Mental Model

**Time:** ~25 minutes  
**Outcome:** A clear mental model of agents, sub-agents, parallel tasks, and memory hierarchy

---

## The Shift You Must Make

Most people use Claude like a smart search engine: question → answer → next question.

That's not wrong. It's just the floor, not the ceiling.

The PM AI mental model treats Claude Code as a **system** — one that holds memory, delegates work, runs processes in parallel, and accumulates outputs over time. Once you see it this way, your productivity ceiling moves up dramatically.

---

## The Four Layers

### Layer 1: Memory
What Claude knows that persists across sessions. Built from your files.

```
Global (always active)
  ~/.claude/CLAUDE.md → your PM identity
  
Project (active when you open this folder)
  ABOUT-ME/CLAUDE.md → current role and focus
  PROJECTS/meridian-os/CLAUDE.md → product context
  
Feature (active when you reference it)
  PROJECTS/approval-routing/CLAUDE.md → feature context
```

The memory layer means you never repeat yourself. Claude walks into every session already briefed.

### Layer 2: Context
Files you reference mid-session. Claude can read, compare, and reason across multiple files simultaneously.

```
Reference → analytics/q1-metrics.csv
          → research/interviews/march-batch.md
          → PROJECTS/meridian-os/roadmap.md

Claude synthesizes all three → narrative analysis memo
```

The context layer means you can hand Claude raw information and get structured insight back.

### Layer 3: Tasks
What you ask Claude to do. Tasks can be:
- **Sequential:** Each step builds on the last
- **Parallel:** Multiple tasks run simultaneously
- **Critique loops:** The same output reviewed from multiple angles

### Layer 4: Agents & Sub-Agents
Claude Code can orchestrate multiple Claude instances working simultaneously — each on a separate task — then combine their outputs.

```
Main session
├── Sub-agent A: Analyze Q1 support tickets (running)
├── Sub-agent B: Draft three PRD sections (running)
└── Sub-agent C: Competitive research on Zapier (running)
                    ↓ All finish simultaneously
Main session synthesizes results into one artifact
```

This is the "parallel task" capability. You'll use it in Modules 4 and 5.

---

## The PM Command Center Mental Model

```
              YOU (PM)
                 │
    ┌────────────┼─────────────┐
    │            │             │
MEMORY       CONTEXT       TASKS
(CLAUDE.md  (files you   (what you
 files)      reference)   ask for)
    │            │             │
    └────────────┼─────────────┘
                 │
           AGENT NETWORK
        (Claude + sub-agents
         executing your tasks)
                 │
           CLAUDE-OUTPUTS/
         (all results land here)
```

You sit at the top. The system does the work. Outputs accumulate in one organized place.

---

## The Autonomous Agents You'll Build

By the end of this course, you will have built a suite of specialized, autonomous PM agents that run from your command line:

- 🕵️ **The Competitive Intelligence Agent (Module 5):** Automatically sweeps competitor documentation, isolates feature differences, and generates threat-analysis memos.
- 📊 **The "Peep-Free" Analytics Agent (Module 4):** Enforces disciplined A/B test analysis, holding back metrics until statistical significance is reached to prevent human bias.
- 📝 **The PRD-to-Jira Pipeline Agent (Module 3 & 7):** Scans a PRD, argues with itself to find missing edge cases, and automatically pushes epic and story tickets directly to your Jira backlog via MCP.
- 🗣️ **The Customer Voice Synthesizer (Module 5 & 7):** Connects to your Gmail or Zendesk, pulls 500 support tickets, clusters the raw complaints by Jobs-to-be-Done, and spits out a prioritized roadmap brief.
- 🎨 **The "Vibe Coder" Prototyper (Module 9):** Takes a half-baked PRD flow and instantly spins up a clickable HTML logic prototype for stakeholder review, deploying it live to Vercel.

You are not learning to use a chat interface. You are building these exact agents.

---

## Hands-On Exercise

**Task:** Experience parallel thinking in one prompt.

```
Do the following three things simultaneously and return all results in one response:

1. Write a one-sentence value proposition for Meridian OS targeting Operations Managers
2. Write a one-sentence value proposition targeting Finance Analysts who manage approvals
3. Write a one-sentence value proposition targeting VPs of Operations

Format as a table: | Persona | Value Proposition | Key Word Count |
```

Notice: Claude returns all three together, tailored to each persona. This is the beginning of parallel task thinking.

---

## Module Checkpoint

- [ ] You can describe the four layers of the PM AI system from memory
- [ ] You understand what a sub-agent is and when to use parallel tasks
- [ ] You've run a parallel task prompt and seen simultaneous outputs

---

## Next: Module 0.8
Token economics — the right model for every type of PM task.

```
/start-m0-8
```
