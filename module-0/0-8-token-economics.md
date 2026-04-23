# Module 0.8 — Token Economics

**Time:** ~20 minutes  
**Outcome:** A personal decision framework for choosing the right Claude model for every PM task

---

## Why This Matters More Than You Think

Wrong model choice = either burning money on simple tasks or getting weak output on important ones.

This lesson gives you a decision framework you'll use every day.

---

## The Three Models

### Haiku — Fast & Cheap
| | |
|--|--|
| **Best for** | Structured, repetitive, classification tasks |
| **Speed** | ~2x faster than Sonnet |
| **Cost** | ~6x cheaper than Sonnet |
| **Weakness** | Limited reasoning, weaker writing |

**Use Haiku when:**
- Formatting tables or bullet points from existing content
- Classifying items (severity, category, priority)
- Simple field extraction from structured data
- Quick yes/no or pick-one decisions

### Sonnet — The Workhorse (default)
| | |
|--|--|
| **Best for** | 90% of real PM work |
| **Speed** | Balanced |
| **Cost** | Mid-range |
| **Strength** | Strong reasoning, excellent writing, long context |

**Use Sonnet when:**
- Writing or refining PRDs
- Synthesizing user research
- Analyzing data and writing narrative memos
- Drafting stakeholder communications
- Most of Modules 2–8 in this course

### Opus — The Strategist
| | |
|--|--|
| **Best for** | High-stakes reasoning and complex multi-variable analysis |
| **Speed** | Slower |
| **Cost** | ~5x more than Sonnet |
| **Strength** | Best reasoning, nuance, and judgment |

**Use Opus when:**
- Final review of a board deck narrative
- Stress-testing strategy with a skeptical executive persona
- Analyzing 20+ documents simultaneously
- Building your PM OS architecture (Module 10)
- Anything where you'd normally spend 3+ hours thinking

---

## The Decision Tree

```
Does the task require creative thinking, strategy, or multi-variable reasoning?
  YES → Opus (if it's worth the cost) or Sonnet
  NO  ↓

Does the task involve writing with nuance, tone, or stakeholder sensitivity?
  YES → Sonnet
  NO  ↓

Is the task structured, repetitive, or classification-based?
  YES → Haiku
```

---

## Real PM Week Budget

| Day | Main Tasks | Model | API Est. |
|-----|-----------|-------|----------|
| Monday | Sprint planning, ticket refinement | Sonnet | ~$1.50 |
| Tuesday | PRD draft + revision | Sonnet | ~$2.00 |
| Wednesday | Research synthesis (10 interviews) | Opus | ~$4.00 |
| Thursday | Stakeholder prep + objection sim | Sonnet | ~$1.50 |
| Friday | Metrics digest + weekly wrap | Haiku + Sonnet | ~$1.00 |
| **Total** | | | **~$10–12/week** |

Within a Pro subscription or a modest API budget.

---

## 5 Rules to Cut Token Spend Without Losing Quality

1. **Load only what you need.** Don't reference your entire vault for a formatting task.
2. **Be specific.** "Write a PRD for Approval Routing" uses fewer tokens than a 3-paragraph setup.
3. **First draft in Haiku, polish in Sonnet.** Get structure fast, then refine.
4. **Compress before loading.** Summarize a 10-page doc to a 1-page brief before referencing it.
5. **Start fresh for new topics.** Long sessions accumulate context costs. Clear state between unrelated tasks.

---

## Hands-On Exercise

**Task:** Model comparison — feel the difference.

1. Ask Claude a Haiku-appropriate question:
   ```
   Format this as a markdown table with 3 columns (Feature, Owner, Status):
   Approval Routing, Priya, In Progress
   Dashboard v2, Marcus, Scoping
   Connector Hub, Rohan, Backlog
   ```
   This didn't need strategic reasoning. Haiku would have been fine.

2. Ask a Sonnet-appropriate question:
   ```
   Meridian is at $4.2M ARR growing 80% YoY. Given typical Series B SaaS 
   benchmarks, what are the 3 most likely growth blockers we'll hit in the 
   next 18 months, and how should a PM prioritize against each?
   ```
   This needs reasoning and context. Sonnet earns its cost here.

3. Think: where in your actual work do you use the wrong model most often?

---

## Module Checkpoint

- [ ] You can match the 3 Claude models to the right PM task types
- [ ] You have a rough weekly token budget estimate for your usage
- [ ] You've internalized the 5 cost-reduction rules

---

## Module 0 Complete

You've built the full foundation:
- ✅ Claude Code installed and running
- ✅ You know all 4 Claude modes and which one to use
- ✅ 4-folder workspace scaffolded
- ✅ CLAUDE.md + anti-style.md written and tested
- ✅ Slash commands and skills built and working
- ✅ First MCP connector active
- ✅ PM AI mental model internalized
- ✅ Token economics understood

**This is your operating system. Everything from Module 1 onward builds on top of it.**

---

**Start Module 1 — CLAUDE.md Mastery:**
```
/start-m1-1
```

*Module 1 goes deep on CLAUDE.md — deeper than any other course. This is where the architecture you built in Module 0 becomes truly powerful.*
