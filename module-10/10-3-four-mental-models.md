# Module 10.3 — The Four Mental Models of an AI-Native PM

**Time:** ~15 minutes  
**Outcome:** Internalize the four operating principles that separate systematic AI users from PM prompt-monkeys

---

## You've Built the Infrastructure. Now Lock in the Mindset.

Completing your capstone project demonstrates you can *use* the tools. This lesson is about encoding *how you think* about those tools — so the habits stick long after this course ends.

These four mental models apply every time you open Claude Code for product work.

---

## Mental Model 1: Context > Prompting

If Claude's output is bad, your first instinct might be to rewrite the prompt. Usually, that's the wrong fix.

**The AI-Native PM reflex:** Update the *context*, not the prompt.

- Is the output generic? → Your `CLAUDE.md` doesn't describe your product clearly enough.
- Is the tone wrong? → Your `anti-style.md` doesn't encode your preferences yet.
- Is Claude missing important constraints? → Your `PROJECTS/[name]/CLAUDE.md` is incomplete.

The prompt is just the trigger. The context files are the actual instructions that persist across every session. Fix the environment, not the command.

> **Daily check:** Before rewriting a prompt for the third time, ask: "Should I update a context file instead?"

---

## Mental Model 2: Isolate the Work

Never let Claude write directly to your active, in-use documents. Always route output through `CLAUDE-OUTPUTS/` first.

**Why this matters:** Claude makes mistakes. It may misread context, drop a section, or interpret your instructions more literally than intended. If it overwrites your working PRD in place, you lose the original.

The `CLAUDE-OUTPUTS/` folder is your airlock. You review it there. If it's good, you merge it. If it's wrong, you iterate — without having destroyed anything.

> **Rule:** If a prompt writes a file, it writes to `CLAUDE-OUTPUTS/`. Period.

---

## Mental Model 3: The 30-Minute Prototype Rule

If you find yourself spending more than 30 minutes trying to *explain* an interaction in a spec or PRD, stop writing and start building.

An interactive HTML prototype — built in a single Claude Code session — communicates UI state changes, conditional flows, and error states faster than any amount of written description. It also produces better specs, because you discover edge cases in the building that you never would have found in the writing.

**The rule:** 30 minutes on a written explanation → switch to prototyping.

> **This is not about code quality.** The prototype is throwaway. The clarity it produces is not.

---

## Mental Model 4: Push, Don't Pull (Automate the Recurring)

If you write the same prompt more than twice a week, it should be a slash command or a Cowork Dispatch routine.

- Weekly metric digest → Cowork Dispatch (Monday, 7 AM)
- Loading Meridian context → `/meridian` slash command
- Checking PRD health → `/context-check` slash command
- Monthly support ticket scan → Cowork Dispatch (first Monday, 9 AM)

The AI-Native PM does not *pull* information by repeating prompts. They build systems that *push* information to them on a schedule.

> **The test:** If you're doing something manually that you did manually last week, it should be automated.

---

## A Note on the "PM is Dead" Debate

You've read the Reddit threads. *"AI is taking our jobs. PRDs are dead. Engineers can just use AI to write the specs."*

Here is what you now understand that most PMs don't:

**AI commoditizes the artifacts, not the decisions.**

- Claude can write a PRD in 10 seconds. It cannot decide *whether* to ship this feature vs. that one, given the CTO's unstated capacity constraints and an upcoming renewal with your largest customer.
- Claude can generate 10 tickets. It cannot handle the politics when a VP pushes back on scope mid-sprint.
- Claude can analyze the funnel. It cannot persuade the CEO to delay a shiny new feature to fix the activation problem.

The PMs who worry about being replaced defined their value by what they *produce* — the document, the ticket, the update. The AI-Native PM defines their value by the *decisions they force and the velocity they enable for their team*.

You now have the OS. Use it.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] You can state the "Context > Prompting" reflex in one sentence
- [ ] You haven't let Claude overwrite an active document directly in the past week
- [ ] At least one recurring task has been moved to Cowork Dispatch
- [ ] You have a personal position on "PM is Dead" that you can articulate in 60 seconds

---

## Next: Module 10.4
Peer Review — sharing your capstone and giving structured feedback on a peer's PM OS.

```
/start-m10-4
```
