# Glossary

← [Home](Home.md)

These are the binding terms in the course's `VOCABULARY` block (`ai-native-pm-os.speq`). Use these exact words. No synonyms. No abbreviations unless declared.

| Canonical term | Means | Never use these instead |
|---|---|---|
| `Lesson` | A single 25–50 minute hands-on unit (e.g., 0-1, 3-2, 10-2a). Lives at `module-X/X-Y-*.md`. | chapter, tutorial, unit, exercise |
| `Module` | A grouping of lessons (modules 0–10). Lives at `module-X/`. | section, chapter, week, level |
| `CourseGuide` | The agent's role in a session — guides students through lessons interactively, asks before explaining. | tutor, instructor, teacher |
| `ProgressLedger` | The state file that tracks lesson completion. Concrete file: `progress.json`. | tracker, log, state-file |
| `Meridian` | The fictional B2B SaaS company students build artifacts for throughout the course. | company, demo-company, sample-company |
| `ClaudeOutputs` | The folder where student artifacts are written (named for legacy reasons; concept is agent-neutral). Concrete folder: `CLAUDE-OUTPUTS/`. | outputs, results, deliverables |
| `PmVault` | The repo root — the workspace the student operates in. | workspace, project-folder, repo-root |
| `AgentContextFile` | Any of `CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, `.cursor/rules/*.mdc` — the file an agent reads at session start. | rules-file, briefing, prompt-file |
| `CourseMode` | One of `student` or `test`, set in `.course-mode`. Controls which outputs folder is used. | profile, env, environment |
| `Capstone` | The Module 10 final project — choose your own track (zero-to-one, scale, or platform). | final-project, graduation, capstone-project |
| `McpConnector` | An MCP-protocol integration (Slack, Jira, Amplitude, Notion, Google Workspace, etc.). Module 7 covers these. | integration, plugin, addon, extension |

## Why the strict naming?

Without it, lessons drift over time:
- Module 1 introduces "Workflow node"
- An artifact in Module 3 says "step"
- A different agent in Module 5 calls it "block"
- By Module 7 the student is confused about whether these are three things or one

The spec's closed-world rule makes synonym use a contract violation. Any agent that's read the spec will refuse to substitute synonyms.

## Related but not in the vocabulary

These terms appear throughout the course but aren't `VOCABULARY` entries — they're either:
- standard PM terminology (PRD, OKR, JTBD) — interpreted by the LLM's training
- standard tech terminology (MCP, API, SDK) — interpreted by the LLM's training
- product-specific terms from Meridian's `meridian-company/company-context.md` (Workflow node, Connector, Orchestration run, ORR)

Meridian-specific terminology is enforced inside `PROJECTS/meridian-os/CLAUDE.md`, not the course-level spec, because it's part of the practice scenario rather than the course infrastructure.

← [Home](Home.md)
