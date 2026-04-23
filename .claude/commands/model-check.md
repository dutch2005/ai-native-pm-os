# /model-check

Show the recommended model for the current (or specified) lesson and how to switch to it.

## Model Recommendation Map

| Modules | Recommended | Why |
|---------|-------------|-----|
| 0, 1, 2 | **Haiku** | Concept reading, setup steps, file operations — no complex generation |
| 3, 4, 5 | **Sonnet** | PRD drafting, data narrative, research synthesis — needs nuanced judgment |
| 6 | **Sonnet** | Strategy docs, executive narrative — Haiku too shallow, Opus overkill |
| 7 | **Sonnet** | MCP technical setup, code understanding — needs reliability |
| 8 | **Haiku** | Team templates and context design — mostly structural, low reasoning load |
| 9 | **Sonnet** | Code generation for dashboards and prototypes |
| 10 | **Sonnet** | Capstone — complex synthesis but not requiring Opus |

Haiku is ~20x cheaper than Sonnet. Use it for Modules 0–2 and 8 to save significantly.

## Steps

1. Read `progress.json` for `current_lesson`
2. If an argument was passed (e.g. `/model-check 3-1`), use that lesson instead
3. Determine the module number from the lesson path
4. Look up the recommended model from the map above
5. Run `claude config get model` (Bash tool) to check what model is currently active
6. Respond:

   "**Current lesson:** [lesson id]
   **Recommended model:** [Haiku / Sonnet]
   **Currently active:** [result from config]

   [If mismatch]: To switch, type: `/model claude-haiku-4-5` or `/model claude-sonnet-4-5`
   [If match]: You're on the right model for this module."

## Notes
- The `/model` command is built into Claude Code — no extra setup needed
- Model preference resets when you start a new `claude` session, so check at the start of each module
- Opus is never needed for this course unless you're extending it with your own complex workflows
