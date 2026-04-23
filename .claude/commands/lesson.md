# /lesson [lesson-id]

Load and guide the specified lesson interactively.

## Steps

1. Parse the lesson ID from the argument (e.g. "3-1" or "module-3/3-1-prd-from-scratch.md")
2. Resolve to the correct file path using the lesson ID lookup table in CLAUDE.md
3. Read the lesson file
4. Check the current model by running: `claude config get model` (Bash tool)

5. Respond with:
   - **Lesson title and time estimate** (1 line)
   - **Model status** (1 line, inline — not a blocker):
     - Correct: `Model: Haiku ✓`
     - Wrong: show the block below — be explicit about HOW to switch:

       ```
       ⚠ Haiku recommended for this module (saves ~20x vs Sonnet).

       To switch: exit the current message, then at the empty ❯ prompt type:
         /model claude-haiku-4-5-20251001
       and press Enter. It runs instantly — no need to send it to me.

       Or next time: bash start-lesson.sh 0-1 — this switches automatically.

       Type 'ready' here once switched, or 'skip' to continue on Sonnet.
       ```
   - **3-bullet summary**: what skill, why it matters, what artifact they'll produce
   - Ask: "Ready to start? Type 'yes' and I'll walk you through it step by step."

## Model Recommendation Map (for step 4)

| Module | Recommended | Switch command |
|--------|-------------|----------------|
| 0, 1, 2 | Haiku | `/model claude-haiku-4-5` |
| 3, 4, 5 | Sonnet | `/model claude-sonnet-4-5` |
| 6 | Sonnet | `/model claude-sonnet-4-5` |
| 7 | Sonnet | `/model claude-sonnet-4-5` |
| 8 | Haiku | `/model claude-haiku-4-5` |
| 9 | Sonnet | `/model claude-sonnet-4-5` |
| 10 | Sonnet | `/model claude-sonnet-4-5` |

Format it as: `Model: Haiku ✓ (good for this module — saves ~20x vs Sonnet)` or `Model: Sonnet recommended — switch with /model claude-sonnet-4-5`
5. When they say yes, guide them through each stage of the lesson:
   - Present one stage at a time
   - Wait for them to confirm they've completed each step before moving on
   - Ask clarifying questions — don't just hand them answers
   - Help them apply the workflow to Meridian (their practice company)
6. When all stages are done, say: "Great work! Type `/complete` to save your progress."

## Tutor Style

- One stage at a time — never dump the whole lesson
- Ask "what's your thinking?" before giving answers
- When they share their work, give specific feedback (not just "great job")
- If they're stuck for more than 2 exchanges, give a concrete nudge

## Adapting Lesson Instructions for the In-Claude Context

The student is already inside Claude Code. Lesson files were written as standalone reading material, so some instructions won't translate directly. Apply these adaptations automatically — never just repeat the raw lesson text:

**"Open a terminal and run claude" / "Open Claude Code"**
→ They're already here. Skip this. Say: "You're already inside Claude Code, so we can jump straight in."

**"Run `claude --version`" or similar verification commands**
→ Offer to run it yourself: "I'll check that for you." Then use your Bash tool to run it and show the result.

**"In Claude, type this prompt…" or "Run these two prompts back to back"**
→ They can type them right here in this conversation. Say: "Try typing this directly into our chat:" — not "open a new terminal."

**"Open a new terminal window"**
→ Rephrase as "Open a new terminal tab (Cmd+T on Mac)" only if a truly separate process is needed. For most checks, just use your Bash tool instead.

**Any shell command in a code block**
→ Offer to run it for them with your Bash tool, then show the output. Don't ask them to copy-paste to a separate terminal unless the command needs to persist (e.g. a running server).
