# Multi-agent support

← [Home](Home.md)

The course was originally written for Claude Code. As of this revision, the same course runs in any modern AI coding CLI without rewriting a single lesson.

## How the routing works

Different agents look for different files at session start. The course ships one file per convention, all of which point at the same source of truth.

```
                 ┌─────────────────────────────────┐
                 │   ai-native-pm-os.speq          │
                 │   (architectural source of truth)│
                 └────────────┬────────────────────┘
                              │ referenced by
        ┌──────────┬──────────┼──────────┬─────────────────┐
        │          │          │          │                 │
   ┌────▼────┐ ┌──▼──────┐ ┌─▼──────┐ ┌─▼──────────┐ ┌────▼─────┐
   │CLAUDE.md│ │AGENTS.md│ │GEMINI  │ │.cursor/    │ │ Aider    │
   │         │ │         │ │.md     │ │ rules/     │ │ (no auto-│
   │Claude   │ │Codex,   │ │Gemini  │ │Cursor      │ │ discovery│
   │Code     │ │Cursor,  │ │CLI     │ │            │ │ — must   │
   │         │ │OpenAI   │ │        │ │            │ │ --read   │
   │         │ │Agents   │ │        │ │            │ │ AGENTS.md│
   │         │ │SDK,     │ │        │ │            │ │ + spec)  │
   │         │ │generic  │ │        │ │            │ │          │
   └─────────┘ └─────────┘ └────────┘ └────────────┘ └──────────┘
```

- `CLAUDE.md` — canonical for Claude Code. Contains the full lesson-ID map and Claude-specific model recommendations. Slash commands (`/lesson`, `/next`, `/complete`, `/progress`, `/meridian`) work natively.
- `AGENTS.md` — universal. Read automatically by Codex CLI, Cursor, OpenAI Agents SDK, Continue, Cline, and most other coding agents per the [agentsmd.net](https://agentsmd.net) convention. Slash commands map to natural-language phrasings.
- `GEMINI.md` — Gemini CLI native. Thin pointer to `AGENTS.md` plus Gemini-specific notes (model picker).
- `.cursor/rules/ai-native-pm-os.mdc` — Cursor native. Loads automatically; points at `AGENTS.md`.
- **Aider** — no native dot-file. Aider does **not** auto-discover `AGENTS.md`. Preferred launch: `aider --read AGENTS.md --read ai-native-pm-os.speq` (the `install.sh` / `setup.sh` scripts auto-detect Aider and print this exact command). Alternative: launch plain `aider` and run `/read AGENTS.md` and `/read ai-native-pm-os.speq` once at session start. See [How to use a different agent](How-To-Use-Different-Agent.md#aider).

## What's actually different per agent?

The **substance** is identical. What varies:

| Behavior | Claude Code | Other agents |
|---|---|---|
| Trigger lessons | `/lesson 0-1` | "load lesson 0-1", "start 0-1" |
| Mark complete | `/complete` | "I'm done", "completed" |
| Continue | `/next` | "what's next", "continue" |
| Show progress | `/progress` | "show progress", "where am I" |
| Model switching | `/model claude-haiku-4-5-...` | Use the agent's own model picker |
| File reads/writes | Native tools | Native tools |
| Shell execution | Bash tool | Each agent's shell tool |

The recognized phrasings are documented in `AGENTS.md` so any agent that reads it (which is most of them) handles the same student requests the same way.

## Verifying an agent works

Drop into the course directory with your chosen agent and try:

```
load lesson 0-1
```

If it reads `module-0/0-1-install-and-setup.md`, summarizes it in 3 bullets, and asks "ready to start?", the agent is correctly wired up.

If it doesn't, the most likely cause is that the agent didn't auto-read `AGENTS.md` at session start. Solutions:

- **Codex CLI**: it should read `AGENTS.md` automatically. If not, add an explicit reference in your shell init or pin it via a CLI flag.
- **Gemini CLI**: it should read `GEMINI.md` automatically. If not, run `gemini --help` to check the config flag for context files.
- **Aider**: launch with `aider --read AGENTS.md --read ai-native-pm-os.speq` (the `install.sh` / `setup.sh` scripts auto-detect Aider and print this exact command for you). Plain `aider` followed by `/read AGENTS.md` and `/read ai-native-pm-os.speq` also works if you forget the flags.
- **Cursor**: the rule file at `.cursor/rules/ai-native-pm-os.mdc` should auto-load. If not, check that "Always Apply" is on for that rule in Cursor settings.
- **Generic LLM agent / API client**: pass `AGENTS.md` and `ai-native-pm-os.speq` as part of the system prompt.

## Why we didn't symlink

We considered making `GEMINI.md` and `.cursor/rules/index.mdc` symlinks to `AGENTS.md`, but symlinks behave inconsistently across Windows / WSL / macOS / Linux file systems and across git checkouts. Thin pointer files (with their own tool-specific notes prepended) are more portable and let each agent get a sentence or two of vendor-specific advice.

## What if a new agent comes along?

Two steps:

1. Find out which file the agent reads first. Common patterns: `AGENTS.md` (most), `<TOOL>.md` (tool-namespaced), `.<tool>/rules/` (Cursor-style).
2. Either add a thin pointer file, or — if it reads `AGENTS.md` — do nothing; it already works.

The architectural source of truth is `ai-native-pm-os.speq`. As long as a new agent can read that file (any agent can — it's plain UTF-8), it can be onboarded to the course.

← [Home](Home.md)
