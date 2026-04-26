# Troubleshooting

← [Home](Home.md)

90% of agent-specific issues come from one of three causes:

1. **Wrong `.course-mode`** — artifacts going to the wrong folder, or being silently dropped
2. **Missing API key** — agent says "I can't access the model"
3. **Agent ignoring `AGENTS.md`** — it acts like a generic chatbot instead of a CourseGuide

This page is the diagnostic flowchart.

## Symptoms → likely causes

### "The agent doesn't know what `/lesson` means."

**Cause:** You're not in Claude Code, and slash commands aren't natively supported.

**Fix:** Use natural language. `load lesson 0-1` works in any agent that's read `AGENTS.md`.

### "The agent doesn't know about the course at all."

**Cause:** It hasn't read `AGENTS.md` (or `CLAUDE.md`/`GEMINI.md`/`.cursor/rules/...`).

**Fix:**
- Codex CLI: should auto-load. If not, prompt it: "Read AGENTS.md and ai-native-pm-os.speq before responding."
- Aider: launch with `aider --read AGENTS.md --read ai-native-pm-os.speq` (preferred — `setup.sh` prints this exact command if Aider is detected). Or `/read AGENTS.md` and `/read ai-native-pm-os.speq` once at session start if you've already launched plain `aider`.
- Cursor: check that `.cursor/rules/ai-native-pm-os.mdc` is enabled in settings.
- Generic agent: paste `AGENTS.md` contents into the system prompt manually.

### "My artifacts are showing up in `CLAUDE-OUTPUTS-test/` instead of `CLAUDE-OUTPUTS/`."

**Cause:** `.course-mode` is set to `test`.

**Fix:**
```bash
echo "student" > .course-mode
```
Then start a new session. The agent reads `.course-mode` at session start.

### "The agent marked a lesson complete without asking me."

**Cause:** A contract violation — `lesson.completion REQUIRES user-confirmation` from the spec.

**Fix:** Manually edit `progress.json` to set the lesson back to `false`. Then file an issue — this is a legitimate bug in whatever agent did this.

### "The agent edited a lesson file."

**Cause:** Another contract violation — `AGENT_RUNTIME NEVER modify_lesson_files_silently`.

**Fix:** `git checkout module-X/X-Y-*.md` to restore. File an issue.

### "The dashboard isn't showing my progress."

**Cause:** Either (a) `course-server.py` isn't running, (b) you're at the wrong URL, (c) `progress.json` is missing.

**Fix:**
1. Run `python3 course-server.py` in a separate terminal.
2. Visit http://localhost:4242
3. If `progress.json` is missing: `bash setup.sh` recreates it.

### "I get `Cannot find module 'better-sqlite3'` (or similar) when running an MCP-related lesson."

**Cause:** The MCP connector for that lesson isn't installed in your environment.

**Fix:** Each MCP lesson includes its own install steps. Re-read the lesson's prerequisites section.

### "The agent says my API key is invalid."

**Cause:** The env var is missing, malformed, or scoped to the wrong shell session.

**Fix:**
- Check the variable is exported: `echo $ANTHROPIC_API_KEY` (or whichever your agent uses).
- Re-source your shell config or open a fresh terminal.
- Confirm the key is active in your provider's dashboard.

### "`speq check` says `command not found`."

**Cause:** SpeQ CLI isn't installed.

**Fix:**
```bash
npm install -g @speq-ai/speq
```

You don't actually need the CLI to run the course — it's only required if you're editing `ai-native-pm-os.speq`. The course runs fine without it.

### "I switched from Claude Code to Codex and now the agent acts confused."

**Cause:** Codex didn't auto-read `AGENTS.md` (some Codex versions need an explicit pointer), or Codex picked up stale conversation context from a prior session.

**Fix:**
1. In a fresh Codex session: "Read AGENTS.md and ai-native-pm-os.speq before responding. I'm at lesson X-Y."
2. From that point Codex should behave identically to Claude Code (modulo slash commands).

### "The spec validation fails after I edited the spec."

**Cause:** Most likely a flow step references an entity not in `ENTITY`, or a vocabulary entry is the wrong case.

**Fix:** See [How to update the spec](How-To-Update-Spec.md) → "Common validation errors and fixes".

## Anything else?

If your symptom isn't here, check in this order:

1. `git status` — did something get into a half-modified state?
2. `cat .course-mode` — is it what you expect?
3. `cat progress.json | head -3` — is it valid JSON?
4. `speq check ai-native-pm-os.speq` — is the spec valid?
5. Open a fresh terminal and try again — stale env vars are a real cause.

If none of those help, file an issue with: which agent you're using, which lesson, the exact prompt, and the agent's exact response.

← [Home](Home.md)
