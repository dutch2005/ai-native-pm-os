# Why a `.speq` file

← [Home](Home.md)

## The 30-second version

The course teaches Product Managers that **a great context file beats 50 prompts**. The course was shipping with a fuzzy natural-language briefing of its own. That's a credibility gap. The `.speq` file closes it: the course's *own* context now meets the standard the course teaches.

It also future-proofs the course against vendor lock-in. The `.speq` is a plain UTF-8 file with a published grammar — any AI agent (today's, tomorrow's) can be taught to read and respect it, in seconds.

## The longer version

### What problem does it solve?

Natural-language briefings (CLAUDE.md, AGENTS.md, GEMINI.md, system prompts) work because LLMs are fluent enough to interpret them. They have a known failure mode: **drift**.

- **Cross-model drift.** The same paragraph means slightly different things to Claude Sonnet 4.6, GPT-5, and Gemini 2.5 Pro. They infer different defaults from the same words.
- **Cross-session drift.** Without a hard-locked vocabulary, two sessions of the same model might call the same concept "lesson" in one and "chapter" in another. By session 50, you have ambiguity rot.
- **Agent-to-agent drift.** A student switching from Claude Code to Codex mid-course hits subtly different interpretations of the same instructions. Outputs drift.
- **Author-to-future-self drift.** Course authors revise lessons months later, forget the implicit rules they set in CLAUDE.md, and contradict themselves.

The `.speq` file is **machine-checkable**. There's a parser (`speq check`). There's a closed-world assumption ("anything not declared does not exist"). There's a vocabulary block that makes synonyms a contract violation, not a stylistic preference. Two agents reading the same spec produce architecturally equivalent output.

### What does the spec actually pin down?

For this course specifically:

| Block | What it locks | Drift it prevents |
|---|---|---|
| `VOCABULARY` | `Lesson`, `Module`, `Meridian`, `ProgressLedger`, `ClaudeOutputs`, `Capstone`, `McpConnector`, `CourseGuide`, `PmVault`, `AgentContextFile`, `CourseMode` | Module 1 says "node", Module 5 says "step", Module 9 says "block" — for the same concept. The spec makes this a rejected output. |
| `ENTITY` | The closed set of nouns the course knows about | Stops an agent from inventing concepts ("let me create a `study_plan` for you") that no lesson references. |
| `LAYERS` | `COURSE_CONTENT`, `AGENT_RUNTIME` (the only `BOUNDARY external`), `PROGRESS_LEDGER`, `CLAUDE_OUTPUTS`, `PROGRESS_DASHBOARD` with explicit `OWNS`, `CALLS`, `NEVER` | Makes "the dashboard is read-only" and "lesson files are content, not state" architectural facts, not code-comment hopes. |
| `CONTRACTS` | `lesson.completion REQUIRES user-confirmation`, `progress_ledger.write ALWAYS atomic`, `course_mode.outputs ALWAYS matches-active-mode` | Stops auto-completing lessons, partial-state writes to `progress.json`, and writing artifacts to the wrong outputs folder. |
| `FLOWS` | `lesson_completion`, `course_setup`, `capstone_graduation` with explicit step ordering and rollback | Two agents executing "complete the lesson and move on" produce identical observable behavior. |
| `SECRETS` | API keys (Anthropic, MCP tokens) scoped to `AGENT_RUNTIME` | Declarative reminder that secrets are env-only — never committed, never logged, never accessible from the dashboard. |

### Concrete examples of bugs the spec prevents

These are real classes of mistake that have happened in similar courses without a spec:

1. **Naming drift in lessons.** Module 1 introduces "Workflow node"; an artifact generated in Module 3 says "step" or "block". Without the spec, this is a stylistic inconsistency. With the spec, it's a contract violation.
2. **Outputs going to the wrong folder.** The course supports `student` and `test` modes via `.course-mode`. A different agent reading the lesson files might miss the toggle and write test-mode artifacts into `CLAUDE-OUTPUTS/`, polluting the student's work. `course_mode.outputs ALWAYS matches-active-mode` blocks this at the contract level.
3. **Auto-completing lessons.** A well-meaning agent finishes a lesson, sees the checkpoint list satisfied, and marks it complete in `progress.json` without asking. `lesson.completion REQUIRES user-confirmation` blocks that.
4. **Editing lesson files to "fix" student mistakes.** An agent might decide to update the lesson markdown when the student's interpretation didn't match the expected outcome. `COURSE_CONTENT OWNS lesson_definitions` and `AGENT_RUNTIME NEVER modify_lesson_files_silently` block that.
5. **Dashboard writing to `progress.json`.** The Python dashboard (`course-server.py`) is supposed to be read-only. The spec makes that an architectural fact: `PROGRESS_DASHBOARD NEVER write_to_progress_ledger`.

### Why this fits *this* course particularly well

Three reasons:

1. **The course is about context engineering.** Module 0–2 teach students that a great `CLAUDE.md` is the most leveraged thing they can build. Shipping the course with a fuzzy briefing is a credibility gap. By Module 1, students learn about CLAUDE.md hierarchy; by reading the repo's own `.speq`, they see the next level of rigor.
2. **The course has 63 lessons across 11 modules.** Drift compounds with content volume. A small project with 5 prompts can survive natural-language only. A 63-lesson course can't.
3. **The course has a multi-stage workflow with progress state.** `lesson_completion` is a real ordered flow. `course_mode.outputs` is a real invariant. These deserve to be machine-enforceable, not just well-intentioned.

### Why this is good independent of pedagogy

Even setting aside the course-specific fit, three properties make `.speq` valuable for any project where more than one AI agent reads instructions:

- **Closed-world enforcement.** "Anything not declared does not exist" is the single most powerful constraint you can give an LLM. It collapses the hallucination surface to zero for anything covered by the spec.
- **Reproducibility.** Two agents with the same spec produce architecturally equivalent output. Same vocabulary, same layer rules, same flows.
- **Reviewable diff.** Spec changes show up in `git diff` as semantic changes ("we added an entity", "we tightened a contract"), not as paragraph-edits whose meaning depends on tone.

### What it doesn't do

- It does **not** define the semantics of domain terms. "Lesson" means "lesson" because the LLM was trained to know that — the spec just locks the *spelling*.
- It does **not** replace lesson content. The lesson files (`module-X/X-Y-*.md`) are still the curriculum.
- It does **not** replace the per-tool config files. `CLAUDE.md` still owns Claude-Code-specific behavior (slash commands, model recommendations); `AGENTS.md` still owns agent-neutral behavior.
- It does **not** validate runtime behavior. It validates the **contract**. Whether a given session honors the contract is up to the agent reading it.

← [Home](Home.md)
