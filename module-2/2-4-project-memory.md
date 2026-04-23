# Module 2.4 — Project Memory: How Claude Retains Context Across Sessions

**Time:** ~25 minutes  
**Outcome:** A working understanding of Claude's memory layers and a session-start habit that never loses context

---

## The Memory Problem

Every Claude Chat session starts cold. You explain your product. You explain your stakeholders. You explain what you need. Then you close the tab and do it again tomorrow.

Claude Code + Cowork is different — but only if you architect the memory correctly.

This lesson maps all the memory layers available to you and shows you how to use each one.

---

## The Five Memory Layers (2026)

### Layer 1: CLAUDE.md Files (Your Primary Memory)
**What it stores:** Permanent context — your identity, product, stakeholders, terminology  
**Persists:** Indefinitely — until you edit the file  
**Scope:** Session-scoped to the directory where Claude Code runs  
**Cost:** Zero tokens until Claude reads it  

This is your most important memory layer. Built in Modules 0 and 1.

### Layer 2: Claude's Built-In Memory (claude.ai + Desktop)
**What it stores:** Key facts Claude extracts from your conversations and saves automatically  
**Persists:** Across sessions on the same account  
**Scope:** Account-wide (not directory-scoped)  
**Available on:** Pro, Max, Team, Enterprise plans (free users from March 2026)  

You can view and edit your memories at claude.ai → Settings → Memory.  
You can also import/export your memory as a JSON file.

**For PMs:** This is useful for Claude Chat sessions. For Claude Code work, CLAUDE.md gives you more control.

### Layer 3: Project Files (Context-on-Demand)
**What it stores:** Research, analytics, roadmaps, PRDs — anything in your workspace  
**Persists:** As long as the files exist  
**Scope:** You reference them explicitly per session  

This is your "file system memory." Claude doesn't read these automatically — you point it to them.

### Layer 4: learning.md (Your Running Log)
**What it stores:** Gaps, insights, progress, decisions made during the course  
**Persists:** As long as the file exists  
**Scope:** Manual — you update it, Claude reads it on request  

Built in Module 2.2. Run `/progress` to retrieve it.

### Layer 5: Session Context (Within a Single Session)
**What it stores:** Everything said in the current conversation window  
**Persists:** Until you close the session  
**Limit:** Context window size (Claude Sonnet 4.6 has 1M token context in beta)  

> **Tip:** Long sessions accumulate token cost. For new, unrelated topics — start a fresh session. Your CLAUDE.md will reload the context you need.

---

## The Session Start Protocol

The most valuable habit in this entire course:

```bash
# Every PM work session:
claude
/meridian    # or run the load-context skill
```

That's it. Two steps. Claude is fully briefed with:
- Your PM identity and preferences
- The Meridian product context
- Your current sprint priorities
- Your terminology rules
- Your anti-style rules

You skip 10 minutes of setup and start doing real work immediately.

---

## Cowork Persistent Memory

Claude Cowork (via Claude Desktop) maintains a **persistent agent thread** — you can assign tasks, leave, come back on another device (or phone), and pick up exactly where you left off.

**Setting it up:**
1. Open Claude Desktop → Cowork
2. Assign any task in the persistent thread
3. Close the desktop app
4. Re-open later — the thread is exactly where you left it

**PM use case:** "Analyze this week's support tickets overnight. I'll review the report in the morning." You don't need to stay active. Cowork works while you're away.

---

## Memory Anti-Patterns to Avoid

| Anti-pattern | Problem | Fix |
|-------------|---------|-----|
| Re-explaining context every session | Wastes 10–15 min daily | Use CLAUDE.md + /meridian |
| Letting CLAUDE.md go stale for months | Claude gives outdated advice | Weekly Friday review (Module 1.4) |
| Relying only on Claude's built-in memory | No control over what's stored | CLAUDE.md is explicit and auditable |
| Long sessions for unrelated tasks | Token costs balloon | Start fresh sessions for new topics |
| Pasting entire docs every session | Expensive context loading | Reference files by path instead |

---

## Hands-On Exercise

**Task:** Test all memory layers working together.

1. Close Claude Code completely.
2. Reopen it: `claude`
3. Without running `/meridian` first, ask: `What product am I working on?`
   → Claude should answer from CLAUDE.md alone (automatic load)
4. Now run `/meridian` and ask: `What is my current sprint focus?`
   → Should pull from your project CLAUDE.md
5. Ask: `What did I log in my last CLAUDE.md gap entry?`
   → Claude should read learning.md and return your most recent gap log

If all three work — your memory architecture is solid.

---

## Module Checkpoint

- [ ] You can name all 5 memory layers and their scope
- [ ] You have a two-step session-start habit (`claude` + `/meridian`)
- [ ] You've tested all three memory layers working correctly in sequence
- [ ] You understand when to use Cowork's persistent thread vs. a Claude Code session

---

## Next: Module 2.5
Organizing your PM vault — folder architecture for outputs, drafts, and context.

```
/start-m2-5
```
