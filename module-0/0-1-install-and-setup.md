# Module 0.1 — Install Claude Code & Understand Subscription Tiers

**Time:** ~25 minutes  
**Outcome:** Claude Code running locally, subscription chosen, token costs understood

---

## What You'll Do

By the end of this lesson, you will have:
- Claude Code installed and verified
- A subscription tier selected based on your actual usage patterns
- A working understanding of what tokens cost in real PM workflows

---

## Part 1: Installation

Claude Code runs in your terminal. It requires Node.js 18+ and an Anthropic account.

### Check your Node.js version
```bash
node --version
# Should return v18.0.0 or higher
```

If your Node is older or missing:
- **macOS:** `brew install node`
- **Windows:** Download from nodejs.org
- **Linux:** `sudo apt install nodejs npm`

### Install Claude Code
```bash
npm install -g @anthropic-ai/claude-code
```

### Verify the installation
```bash
claude --version
```

### First launch
```bash
claude
```

You'll be prompted to log in with your Anthropic account. Follow the browser flow.

---

## Part 2: Understanding Subscription Tiers

Claude Code connects to Anthropic's API. You pay for what you use — or subscribe to a Pro plan.

### Option A: API Key (Pay-as-you-go)
Best for: Learners who want control over spend

- Set your key: `claude config set api_key YOUR_KEY_HERE`
- You're billed per token. A typical PM workflow day costs $2–$8.
- **Recommended for:** Careful learners, part-time PMs, budget-conscious users

### Option B: Claude Pro Subscription ($20/month)
Best for: Daily Claude users who also want the web UI

- Includes Claude.ai web access
- API access has rate limits (5x vs. free)
- **Recommended for:** PMs who already use Claude regularly

### Option C: Claude Max Subscription ($100–$200/month)
Best for: Heavy power users building real PM infrastructure

- Highest rate limits, priority access
- Best for Modules 7–10 (MCP integrations, vibe coding)
- **Recommended for:** Senior PMs, team leads, founders

---

## Part 3: Token Economics for PMs

Tokens are units of text. Input tokens (what you send) + output tokens (what Claude returns) = your cost.

### Rough token budget for common PM tasks

| Task | Approx. Tokens | Model | Cost (API) |
|------|----------------|-------|-----------|
| One-line clarification | 200–500 | Haiku | ~$0.001 |
| Research question | 1,000–3,000 | Sonnet | ~$0.01 |
| Full PRD draft | 10,000–20,000 | Sonnet | ~$0.08 |
| Multi-file analysis | 30,000–80,000 | Sonnet | ~$0.30 |
| Strategy review with context | 50,000+ | Opus | ~$0.75+ |

### The golden rule of token economics
> **Long context = expensive. Short, precise prompts = efficient.**

We'll use this principle throughout the course. Module 0.5 covers this in depth.

---

## Hands-On Exercise

**Task:** Run your first command.

1. Open your terminal and type `claude`
2. When the prompt appears, type:
   ```
   Tell me in one sentence what a PM does.
   ```
3. Note the response token count (shown in the status bar)
4. Now try:
   ```
   Write a one-paragraph bio for a fictional PM named Priya who works at a B2B SaaS company called Meridian.
   ```
5. Compare the response length and quality.

**Reflection:** How did the second response differ? What did the extra context buy you?

---

## Module Checkpoint

Before moving to 0.2, confirm:
- [ ] `claude --version` returns a version number
- [ ] You've chosen your subscription tier
- [ ] You've run at least two commands and noted the difference in output quality

---

## Next: Module 0.2
Meet Meridian — the practice B2B SaaS company you'll work with throughout this entire course.

```
/start-m0-2
```
