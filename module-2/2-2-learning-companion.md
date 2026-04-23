# Module 2.2 — Building Your Learning Companion & Progress Tracker

**Time:** ~25 minutes  
**Outcome:** A living `learning.md` that tracks your progress, logs gaps, and becomes smarter as you go

---

## Why a Progress Tracker Inside Claude Code?

Most online courses track progress for you — a progress bar, a completion badge. In this course, you're working inside a terminal. There's no UI.

But here's the flip: your tracker lives inside your PM OS, which means Claude can read it, update it, and reason from it.

`learning.md` is not just a checklist. It's a **feedback loop document** — it captures what you've learned, what needs improvement, and what you'll apply to real work.

---

## The Structure

```markdown
# PM OS Learning Log

## Course Progress

| Module | Title | Status | Completed |
|--------|-------|--------|-----------|
| 0.1 | Install & Tiers | ✅ Complete | 2025-04-14 |
| 0.2 | Claude Surfaces | ✅ Complete | 2025-04-14 |
| 0.3 | Four Folders | ✅ Complete | 2025-04-15 |
| ... | ... | ... | ... |

## Active Work: Module [X.X]
[What I'm currently working on in this module]

## CLAUDE.md Gap Log

### How to Use
When Claude gets something wrong, log it here. 
Review weekly. Fix it. Delete the entry.

### [Date] — [Type] — [Short description]
**What happened:** [What Claude did wrong]
**Fix:** [What to add to CLAUDE.md]
**Status:** [ ] Pending | [x] Done

## Key Insights
[Things I've learned that I want to remember]

## Real-Work Applications
[How I've applied a lesson to actual PM work]

## Community Challenge Submissions
[Links or notes from challenges I've completed]
```

---

## Set It Up Now

**Step 1:** Create the file:
```bash
touch learning.md
```

**Step 2:** Paste the template above and fill in:
- Your name and start date at the top
- Check off any modules you've completed so far in Module 0
- Add one entry to the Gap Log from something you noticed in your CLAUDE.md testing

**Step 3:** Create a slash command to update it:

```bash
touch .claude/commands/progress.md
```

Content for `progress.md`:
```markdown
Read my learning.md file and return:

1. **Progress summary:** How many modules are marked complete vs. total
2. **Current module:** What I'm actively working on
3. **Pending CLAUDE.md gaps:** Any entries in the Gap Log marked [ ] Pending
4. **Top insight this week:** The most recent entry under Key Insights

Format cleanly with headers. Be concise.
```

Now run `/progress` any time to get your status in 5 seconds.

---

## The Power Move: Claude Updates Your Tracker

At the end of any module, you can ask Claude to update your tracker automatically:

```
I just completed Module 2.2 — Building Your Learning Companion.

Update my learning.md:
1. Mark Module 2.2 as complete with today's date
2. Add this to Key Insights: "learning.md + /progress command = real-time 
   status without any manual tracking effort"
3. Move the Active Work section to Module 2.3

Save the updated file.
```

Claude reads learning.md, makes the changes, and saves it. You never touch the file manually.

---

## The Gap Log in Practice

Here's what a real gap log entry looks like after a day of working in Claude Code:

```markdown
### 2025-04-15 — Terminology — "routing sequence" used incorrectly
**What happened:** Claude wrote "approval chain" in a stakeholder brief.
Our team standardized on "routing sequence" in Sprint 12.
**Fix:** Add to CLAUDE.md terminology: 
"routing sequence" (NOT "approval chain") = ordered list of approvers
**Status:** [x] Done — added 2025-04-15
```

```markdown
### 2025-04-16 — Stakeholder framing — Dev Kapoor brief was too long
**What happened:** Claude wrote a 5-bullet summary for Dev. He only reads 3 max.
**Fix:** Add to stakeholder map: "Dev Kapoor — max 3 bullets, always lead with a number"
**Status:** [ ] Pending
```

---

## Hands-On Exercise

**Task:** Set up learning.md and test the /progress command.

1. Create `learning.md` with the full template
2. Mark all Module 0 lessons you've completed
3. Create `.claude/commands/progress.md` with the command above
4. Run `/progress` and verify Claude returns an accurate status report
5. Add one real insight from something you've learned so far

---

## Module Checkpoint

- [ ] `learning.md` exists with full template populated
- [ ] At least 4 Module 0 lessons marked complete
- [ ] `/progress` slash command works and returns accurate status
- [ ] At least one entry in the CLAUDE.md Gap Log

---

## Next: Module 2.3
Sub-agents — delegating parallel research tasks simultaneously.

```
/start-m2-3
```
