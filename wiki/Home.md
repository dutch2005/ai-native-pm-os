# AI-Native PM OS — Wiki

This wiki explains how the AI-Native PM OS course is wired together, why we made the architectural choices we did, and how to operate it across different AI coding CLIs.

If you just want to take the course, you don't need this wiki — open `claude` (or your preferred agent), type `/lesson 0-1`, and go. The wiki is for people who want to **understand** the system, **maintain** it, **port it** to another agent, or **adapt** it to a different course/company.

## Pages

1. **[Why a `.speq` file](Why-Speq.md)** — the rationale for adding a closed-world architectural contract to a context-engineering course.
2. **[Multi-agent support](Multi-Agent-Support.md)** — how the same course runs in Claude Code, Codex, Gemini, Aider, Cursor, and any future agent.
3. **[Architecture overview](Architecture-Overview.md)** — the layers, flows, and files that make up the course system.
4. **[How to update the spec](How-To-Update-Spec.md)** — when and how to change `ai-native-pm-os.speq` without breaking the course.
5. **[How to use a different agent](How-To-Use-Different-Agent.md)** — step-by-step for Codex, Gemini, Aider, Cursor.
6. **[Troubleshooting](Troubleshooting.md)** — common issues across agents.
7. **[Glossary](Glossary.md)** — every binding term in the course's vocabulary.

## TL;DR for each page

- **Why a `.speq` file** → because a context-engineering course should walk the talk. Natural-language briefings drift across agents/sessions; the spec doesn't.
- **Multi-agent support** → 4 native entry-point files (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, `.cursor/rules/`) plus an explicit-load path for Aider (`aider --read AGENTS.md --read ai-native-pm-os.speq`). One source of truth (`ai-native-pm-os.speq`).
- **Architecture overview** → 5 layers with strict ownership: `COURSE_CONTENT` (lessons), `AGENT_RUNTIME` (boundary), `PROGRESS_LEDGER` (`progress.json`), `CLAUDE_OUTPUTS` (mode-locked artifacts), `PROGRESS_DASHBOARD` (read-only).
- **How to update the spec** → if you change an architectural fact, bump the spec; if you change content, you don't need to. Always run `speq check` before committing.
- **How to use a different agent** → install the CLI, run `bash setup.sh`, say "load lesson 0-1" instead of typing `/lesson 0-1`.
- **Troubleshooting** → 90% of agent-specific issues come from one of three causes: wrong `.course-mode`, missing API key, agent ignoring `AGENTS.md`.
- **Glossary** → 11 binding terms. Use these exactly. No synonyms.
