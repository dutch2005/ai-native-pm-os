# Architecture overview

← [Home](Home.md)

The course is a **layered system** with five layers and three named flows. The full contract is in [`ai-native-pm-os.speq`](../ai-native-pm-os.speq); this page is the human-readable map.

## Layers

```
┌─────────────────────────────────────────────────────────────────┐
│  AGENT_RUNTIME            (BOUNDARY external)                   │
│  Owns: lesson_guidance, slash_command_handling,                 │
│        model_routing, tone                                      │
│  Calls: COURSE_CONTENT, PROGRESS_LEDGER, CLAUDE_OUTPUTS         │
│  Never: hardcode_secret_value,                                  │
│         write_outside_outputs_folder,                           │
│         modify_lesson_files_silently,                           │
│         skip_user_confirmation_on_destructive_action            │
└─────────────────────────────────────────────────────────────────┘
   │                            │                       │
   ▼                            ▼                       ▼
┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│ COURSE_CONTENT   │  │ PROGRESS_LEDGER  │  │ CLAUDE_OUTPUTS   │
│                  │  │                  │  │                  │
│ Owns: lesson_    │  │ Owns: progress_  │  │ Owns: student_   │
│   definitions,   │  │   json_state     │  │   artifacts      │
│   module_        │  │                  │  │                  │
│   organization,  │  │ Never: advance_  │  │ Never: write_to_ │
│   meridian_      │  │   without_user_  │  │   student_folder │
│   context        │  │   consent,       │  │   _in_test_mode, │
│                  │  │   write_partial_ │  │   write_to_test_ │
│ Never: mutate_   │  │   state          │  │   folder_in_     │
│   progress_      │  │                  │  │   student_mode,  │
│   state_directly │  │                  │  │   overwrite_     │
│                  │  │                  │  │   lesson_files   │
└──────────────────┘  └──────────────────┘  └──────────────────┘
                                  ▲
                                  │ read-only
                       ┌──────────┴──────────┐
                       │ PROGRESS_DASHBOARD  │
                       │ (course-server.py)  │
                       │                     │
                       │ Owns: read_only_    │
                       │   progress_         │
                       │   visualization     │
                       │                     │
                       │ Never: write_to_    │
                       │   progress_ledger,  │
                       │   expose_secrets_   │
                       │   to_browser        │
                       └─────────────────────┘
```

### Why this layering matters

- **`AGENT_RUNTIME` is the only `BOUNDARY external`.** That means it is the only layer that accepts untrusted input (the student's typing). Every other layer trusts it. This is enforced by the contract `agent_context_file.* NEVER inject_unscoped_secret`.
- **`COURSE_CONTENT` is read-only from the agent's perspective.** Lessons are content. The agent guides through them, doesn't rewrite them. This is what `AGENT_RUNTIME NEVER modify_lesson_files_silently` enforces.
- **`PROGRESS_LEDGER` is single-writer.** Only `AGENT_RUNTIME` may ask it to mark a lesson complete, and only with user consent. The dashboard reads but never writes. This is what `lesson.completion REQUIRES user-confirmation` and `progress_ledger.write ALWAYS atomic` enforce.
- **`CLAUDE_OUTPUTS` is mode-locked.** `student` mode writes to `CLAUDE-OUTPUTS/`; `test` mode writes to `CLAUDE-OUTPUTS-test/`. They never cross. This is what `course_mode.outputs ALWAYS matches-active-mode` enforces.
- **`PROGRESS_DASHBOARD` is a separate process** (Python web server on port 4242). It only reads `progress.json`. Even if compromised, it cannot mutate the student's progress state.

## Flows

### `lesson_completion`

The most common flow. Triggered when the student completes a lesson.

```
1. [AGENT_RUNTIME]   lesson.deliver
2. [AGENT_RUNTIME]   lesson.verify_understanding
3. [PROGRESS_LEDGER] progress_ledger.mark_complete
4. [AGENT_RUNTIME]   lesson.advance

ROLLBACK: progress_ledger.unmark
ATOMIC:   true
TIMEOUT:  3600s (one hour — long enough for any single lesson)
```

The atomicity matters: if step 3 succeeds but the student then says "wait, I wasn't actually done", the rollback puts the ledger back into the prior state.

### `course_setup`

Run once per environment by `setup.sh`.

```
1. [AGENT_RUNTIME]    course_guide.verify_prerequisites
2. [AGENT_RUNTIME]    course_mode.initialize
3. [PROGRESS_LEDGER]  progress_ledger.create
4. [CLAUDE_OUTPUTS]   project_artifact.bootstrap_folders

ATOMIC:  false
TIMEOUT: 60s
```

`ATOMIC: false` because each step is idempotent on retry — re-running `setup.sh` after a partial failure cleanly resumes from where it stopped, so explicit rollback would be more harmful than helpful (it would delete a half-set-up workspace the student could otherwise just re-run setup against).

### `capstone_graduation`

The Module 10 final project flow. Loose by design (`ATOMIC: false`) because the capstone takes hours to days and individual stages can be revisited.

```
1. [PROGRESS_LEDGER] module.verify_prereqs
2. [AGENT_RUNTIME]   capstone.deliver
3. [CLAUDE_OUTPUTS]  capstone.persist
4. [PROGRESS_LEDGER] progress_ledger.mark_complete

ATOMIC:  false
TIMEOUT: 28800s (eight hours)
```

The contract `capstone.deliverable REQUIRES module-10-prereqs-complete` ensures the student can't skip directly to the capstone without finishing the prior modules.

## File system layout

| Path | Layer | Purpose |
|---|---|---|
| `ai-native-pm-os.speq` | (meta) | Architectural contract — read by every agent |
| `state_ai-native-pm-os.speq` | (meta, gitignored) | Per-environment build/check status |
| `CLAUDE.md` | `AGENT_RUNTIME` | Claude Code's entry point |
| `AGENTS.md` | `AGENT_RUNTIME` | Universal agent entry point |
| `GEMINI.md` | `AGENT_RUNTIME` | Gemini CLI entry point |
| `.cursor/rules/*.mdc` | `AGENT_RUNTIME` | Cursor entry point |
| `module-X/` | `COURSE_CONTENT` | Lesson markdown |
| `meridian-company/` | `COURSE_CONTENT` | Practice company facts: `company-context.md` and supplementary exercises (committed, read-only content) |
| `templates/` | `COURSE_CONTENT` | Supplementary exercise templates (committed, read-only) |
| `PROJECTS/meridian-os/` | `CLAUDE_OUTPUTS` | Student artifacts about Meridian. The seed `CLAUDE.md` is committed; everything the student adds inside (research notes, analytics outputs) is gitignored. |
| `PROJECTS/meridian-os/research/` | `CLAUDE_OUTPUTS` | Student-collected research notes (created by `setup.sh`) |
| `PROJECTS/meridian-os/analytics/` | `CLAUDE_OUTPUTS` | Student-generated analytics outputs (created by `setup.sh`) |
| `ABOUT-ME/` | `CLAUDE_OUTPUTS` | Student's personal `CLAUDE.md` + `anti-style.md` (gitignored) |
| `TEMPLATES/` | `CLAUDE_OUTPUTS` | Student's own template library (created by `setup.sh`) |
| `CLAUDE-OUTPUTS/` | `CLAUDE_OUTPUTS` (student mode) | All other student artifacts (gitignored) |
| `CLAUDE-OUTPUTS-test/` | `CLAUDE_OUTPUTS` (test mode) | Test/creator artifacts (gitignored) |
| `progress.json` | `PROGRESS_LEDGER` | Source of truth for completion state (gitignored) |
| `course-server.py` | `PROGRESS_DASHBOARD` | Read-only Python web server on :4242 |
| `course-ui/` | `PROGRESS_DASHBOARD` | Static HTML for the dashboard |
| `setup.sh`, `install.sh`, `start-lesson.sh`, `test-mode.sh` | (bootstrap) | One-time setup and helpers |
| `scripts/check-lesson-parity.sh` | (CI) | Verifies lesson IDs across disk, `progress.json`, `setup.sh` template, `CLAUDE.md`, `AGENTS.md` agree |
| `scripts/check-vocabulary-drift.sh` | (CI) | Audits lesson markdown for forbidden synonyms |
| `.github/workflows/validate.yml` | (CI) | Runs spec check + shell syntax + lesson parity + markdown link check on every PR |
| `.github/workflows/vocabulary-drift.yml` | (CI) | Weekly + manual vocabulary audit |
| `.course-mode` | (config) | `student` or `test` (gitignored) |
| `wiki/` | (docs) | This wiki |
| `docs/SPEQ-RATIONALE.md` | (docs) | Why the spec was added |

## Secrets

Declared in the spec under `SECRETS`, scoped to `AGENT_RUNTIME`:

- `ANTHROPIC_API_KEY`
- `OPENAI_API_KEY`
- `GEMINI_API_KEY`
- `MCP_SLACK_TOKEN`
- `MCP_JIRA_TOKEN`
- `MCP_AMPLITUDE_TOKEN`
- `MCP_NOTION_TOKEN`

These are environment variables. They are never written into the spec, lesson files, `progress.json`, `CLAUDE-OUTPUTS/`, or any committed artifact. The dashboard layer (`PROGRESS_DASHBOARD`) explicitly cannot expose them to the browser.

← [Home](Home.md)
