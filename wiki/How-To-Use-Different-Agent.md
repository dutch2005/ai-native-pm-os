# How to use a different agent

← [Home](Home.md)

The course is most polished in **Claude Code** (slash commands work natively). Here's how to run it in everything else.

## Common steps (all agents)

```bash
# 1. Clone or download the course.
git clone https://github.com/vishalmdi/ai-native-pm-os.git
cd ai-native-pm-os

# 2. Run setup. It auto-detects which agent CLI is on your PATH.
bash setup.sh

# 3. Set the API key your agent needs as an env var.
#    (Anthropic / OpenAI / Google / etc. — depends on the agent.)
export ANTHROPIC_API_KEY=...   # or OPENAI_API_KEY, GEMINI_API_KEY, etc.
```

That's the bootstrap. Now per-agent.

## Claude Code

```bash
claude
```

Then:
```
/lesson 0-1
```

Slash commands all work: `/lesson`, `/next`, `/complete`, `/progress`, `/meridian`. Model recommendations from `CLAUDE.md` are used automatically.

## Codex CLI (OpenAI)

```bash
codex
```

Then ask in natural language:
```
load lesson 0-1
```

Codex reads `AGENTS.md` automatically. Slash commands are not native — use phrasings like:
- `load lesson 0-1`, `start 0-1`, `begin module 3 lesson 2`
- `I'm done`, `mark this complete`
- `what's next`, `continue`
- `show progress`, `where am I`

If Codex doesn't seem to know about the course, prompt it once with: "Read AGENTS.md and then guide me through the AI-Native PM OS course."

## Gemini CLI

```bash
gemini
```

Then:
```
load lesson 0-1
```

Gemini reads `GEMINI.md` (which delegates to `AGENTS.md`). Same natural-language phrasings as Codex.

For model selection: `gemini-2.5-flash` works for modules 0, 1, 2, 8 (cheap setup-style content). Switch to `gemini-2.5-pro` for modules 3–7 and 9–10 (deeper reasoning).

## Aider

```bash
aider --read AGENTS.md --read ai-native-pm-os.speq
```

Or interactively:
```bash
aider
> /read AGENTS.md
> /read ai-native-pm-os.speq
> load lesson 0-1
```

Aider doesn't auto-discover `AGENTS.md` the way Codex does, so always `/read` it explicitly at session start.

## Cursor

Open the project folder in Cursor. The rule at `.cursor/rules/ai-native-pm-os.mdc` should auto-load (it's marked `alwaysApply: true`). Then in the AI chat:

```
load lesson 0-1
```

If the rule doesn't auto-load, go to Cursor settings → Rules → enable the `ai-native-pm-os` rule.

## Continue / Cline / generic LLM agent

Most modern coding agents read `AGENTS.md` automatically. If yours doesn't:

1. Either configure it to load `AGENTS.md` and `ai-native-pm-os.speq` as context files at session start.
2. Or paste the contents of `AGENTS.md` into the system prompt manually for one session.

Then ask in natural language: "load lesson 0-1".

## OpenAI Agents SDK / LangChain agent / custom agent

Pass these two files into the agent's system prompt or context:
- `ai-native-pm-os.speq` — the architectural contract
- `AGENTS.md` — the behavioral guide

Example with the Anthropic SDK:

```python
import anthropic

with open("ai-native-pm-os.speq") as f:
    spec = f.read()
with open("AGENTS.md") as f:
    agents_md = f.read()

system = f"""You are a CourseGuide for the AI-Native PM OS course.

ARCHITECTURAL CONTRACT (ai-native-pm-os.speq):
{spec}

BEHAVIORAL GUIDE (AGENTS.md):
{agents_md}

Read both before responding to any user message. Honor every constraint.
"""

client = anthropic.Anthropic()
msg = client.messages.create(
    model="claude-sonnet-4-6",
    system=system,
    max_tokens=4096,
    messages=[{"role": "user", "content": "load lesson 0-1"}],
)
print(msg.content[0].text)
```

## Switching agents mid-course

Switching is safe. Progress lives in `progress.json`, lessons live in `module-X/`, and your artifacts live in `CLAUDE-OUTPUTS/`. None of these are agent-specific.

The only thing you'll lose is the per-agent conversation history (which is supposed to be reset between lessons anyway, for cost discipline — see [`AGENTS.md` § Cost discipline](../AGENTS.md)).

← [Home](Home.md)
