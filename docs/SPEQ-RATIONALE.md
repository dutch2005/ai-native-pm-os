# Why we added a `.speq` file (and AGENTS.md, GEMINI.md)

This document explains why the AI-Native PM OS course now ships with a `.speq` file at the root, alongside `AGENTS.md` and `GEMINI.md`. If you're reading this because you're about to edit `CLAUDE.md` or any lesson file and you're wondering whether to update the spec too — the short answer is **yes, when the architectural facts change**, and the rest of this document explains what counts.

---

## The problem the course was already solving

The whole premise of this course is **context engineering**: a great `CLAUDE.md` is worth more than 50 prompts. The first three modules teach students that one well-written briefing file is the most leveraged thing a PM can build.

That premise has a hidden assumption: the briefing file is in **natural language**. It works because Claude is fluent enough to interpret it. But natural-language briefings have a known failure mode — they drift across sessions, agents, and models. The same paragraph means slightly different things to Claude 3.7, Claude 4.5, GPT-5, and Gemini 2.5. On a small project that's tolerable. On a course with 63 lessons, 11 modules, a fixed practice company (Meridian), and a non-trivial workspace layout, drift compounds.

This is the exact problem [SpeQ](https://github.com/speq-ai) was designed for: replace the natural-language source of truth with a **machine-readable, closed-world architectural contract**.

## What the `.speq` file pins down

The `.speq` file is the architectural source of truth for the course itself (not for the artifacts students build inside it — those still live in their own files). It declares, in formal grammar, the things that must not vary across agents or sessions:

| Declaration | What it pins | Why it matters here |
|---|---|---|
| `VOCABULARY` | The canonical name for every concept (`Lesson`, `Module`, `Meridian`, `ClaudeOutputs`, `ProgressLedger`, `Capstone`, `McpConnector`, etc.) | Lessons reference each other by exact terms. If one agent calls them "chapters" and another calls them "lessons", students get confused fast. |
| `ENTITY` | The closed set of nouns the system knows about | Prevents an agent from inventing new entities (e.g., "let me create a `study_plan` for you") that the course has no opinion about. |
| `LAYERS` | `COURSE_CONTENT`, `AGENT_RUNTIME`, `PROGRESS_LEDGER`, `CLAUDE_OUTPUTS`, `PROGRESS_DASHBOARD` and what each one owns | Makes explicit that the dashboard is read-only against `progress.json`, that the agent runtime is the only `BOUNDARY external`, and that lesson files are content (not state). |
| `CONTRACTS` | `lesson.completion REQUIRES user-confirmation`, `progress_ledger.write ALWAYS atomic`, `course_mode.outputs ALWAYS matches-active-mode`, etc. | Locks in the rules that any agent must respect — no auto-completing lessons, no writing to `CLAUDE-OUTPUTS/` when `.course-mode` is `test`, and so on. |
| `FLOWS` | `lesson_completion`, `course_setup`, `capstone_graduation` with explicit step ordering and rollback | Two different agents executing "complete the lesson and move on" should produce the same observable behavior. The flow makes the steps unambiguous. |
| `SECRETS` | Names of API keys (`ANTHROPIC_API_KEY`, MCP tokens) scoped to `AGENT_RUNTIME` | Declarative reminder that secrets are environment-only, never committed, never logged, and never accessible from the dashboard layer. |

### Concrete examples of drift the `.speq` file prevents

1. **Naming drift in lessons.** Module 1 uses "Workflow node"; a generated artifact in Module 3 might say "step" or "block". `VOCABULARY` makes this a contract violation, not a stylistic preference.
2. **Outputs going to the wrong folder.** The course supports `student` and `test` modes via `.course-mode`. A different agent reading the lesson files might miss the toggle. `course_mode.outputs ALWAYS matches-active-mode` is a hard rule, not a footnote.
3. **Auto-completing lessons.** A well-meaning agent finishes a lesson, sees the checkpoint list satisfied, and marks it complete in `progress.json` without asking. `lesson.completion REQUIRES user-confirmation` blocks that.
4. **Editing lesson files to "fix" student mistakes.** An agent might decide to update the lesson markdown when the student's interpretation didn't match. `COURSE_CONTENT` `OWNS` lesson definitions; `AGENT_RUNTIME` `NEVER modify_lesson_files_silently`.
5. **The dashboard writing to `progress.json`.** The dashboard is supposed to be read-only. The spec makes that an architectural fact, not a code-comment hope.

## Why this fits *this specific course* particularly well

The course is **a context-engineering course**. Telling students "your context file is the source of truth" while shipping the course itself with a fuzzy natural-language briefing is a credibility gap. Adding a `.speq` is **walking the talk** — it shows students what a real, tool-grade context contract looks like, in their own working directory. By Module 1 they're learning about CLAUDE.md hierarchy; by reading the repo's own `.speq`, they see the next level of rigor.

It also **future-proofs the course** for the next year of AI tooling churn. Models change every few months. CLI tools come and go. The `.speq` file is independent of all of that — it's plain UTF-8 with a published grammar that any agent can be taught to parse and respect.

## Why this is a good addition independent of the course content

Even setting aside the pedagogical alignment, three properties make a `.speq` valuable for any project that has more than one AI agent reading it:

- **Closed-world enforcement.** "Anything not declared does not exist" is the single most powerful constraint you can give an LLM. It collapses the hallucination surface to zero for anything covered by the spec.
- **Reproducibility across models and sessions.** Two agents with the same spec produce architecturally equivalent output. Same spec, same vocabulary, same layer rules, same flows.
- **Reviewable diff.** Spec changes show up in `git diff` as semantic changes ("we added a new entity", "we tightened the contract on payment.token"), not as paragraph-edits whose meaning depends on tone.

## Why we also added `AGENTS.md` and `GEMINI.md`

The original course is Claude-Code-only — it relies on `CLAUDE.md` and Claude Code's slash command system. We added two more files so the same course works in any AI coding CLI:

- **`AGENTS.md`** — the [agentsmd.net](https://agentsmd.net) convention. Read automatically by Codex CLI, Cursor, OpenAI Agents SDK, and most other coding agents. Aider users launch with `aider --read AGENTS.md --read ai-native-pm-os.speq` to pre-load both files (the `install.sh` / `setup.sh` scripts auto-detect Aider and print the exact command). Contains the agent-neutral version of the course-guide behavior (slash commands map to natural-language phrasings).
- **`GEMINI.md`** — Gemini CLI's native file. Acts as a thin pointer to `AGENTS.md` plus Gemini-specific notes (model picker, etc.).
- **`CLAUDE.md`** is unchanged in substance — it stays canonical for Claude Code and includes the full lesson-ID map. It now points at `ai-native-pm-os.speq` and `AGENTS.md` so a Claude Code session reads them too.

The behavioral model is identical across agents. Only the file the agent reads first is different.

### Vendor coverage

| Agent | File it reads | Status |
|---|---|---|
| Claude Code | `CLAUDE.md` | Native, canonical |
| Codex CLI | `AGENTS.md` | Supported |
| Gemini CLI | `GEMINI.md` (delegates to `AGENTS.md`) | Supported |
| Aider | `AGENTS.md` (must `/read` it explicitly — Aider does not auto-discover) | Supported via explicit `/read` |
| Cursor | `.cursor/rules` if present, else `AGENTS.md` | Supported via fallback |
| Continue / Cline / generic LLM agents | `AGENTS.md` | Supported |

Because the `.speq` file is plain text with a published grammar, **any** agent — including ones that don't yet exist — can be told to read it and respect its constraints. The tool-specific files (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`) are just where each tool happens to look first; the architectural truth is in one place.

## How to maintain the spec going forward

Rule of thumb: **if you change an architectural fact, update the spec; if you change content, you don't need to.**

| Change | Update the spec? |
|---|---|
| Add a new lesson to module 7 | No — lesson files are content under `COURSE_CONTENT.OWNS`. The structure is the same. |
| Add a new module (e.g., module 11) | Yes — bump the spec, add to CHANGELOG, update lesson order in `AGENTS.md` and `CLAUDE.md`. |
| Rename `CLAUDE-OUTPUTS/` to something else | Yes — `VOCABULARY` `ClaudeOutputs` and the LAYER `OWNS`/`NEVER` rules need to follow. |
| Add a new MCP connector lesson | Maybe — content-only is no, but if it introduces a new secret kind, add it to `SECRETS`. |
| Add a new course mode (e.g., `instructor`) | Yes — extend `course_mode.outputs ALWAYS matches-active-mode`. |
| Tighten or relax a contract (e.g., allow auto-complete in test mode) | Yes — and bump version, mark `BREAKING` in CHANGELOG. |

Always run `speq check ai-native-pm-os.speq` before committing a spec change (install via `npm install -g @speq-ai/speq`). Generated `state_ai-native-pm-os.speq` is **not committed** — it's per-environment.

---

That's the rationale. The course was already great at teaching context engineering. The `.speq` file makes the course's *own* context match the standard the course teaches.
