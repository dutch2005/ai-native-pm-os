# Module 9.1 — The Build Loop: Prompt → Preview → Iterate → Ship

**Time:** ~40 minutes  
**Outcome:** A functioning internal tool prototype built entirely in Claude Code, no engineering required

---

## The PM Who Could Build

The traditional PM role: you write the spec, engineers build it, you review it six sprints later.

The AI-native PM role: you build a working prototype in an afternoon, engineers review it, they build the real version with a 90% reduction in back-and-forth.

This module teaches you the **build loop** — the four-step cycle that takes you from idea to deployed prototype.

---

## What "Vibe Coding" Actually Means

Vibe coding is not about being sloppy or imprecise. It's about:
1. **Describing what you want at a high level** — not writing code, writing intent
2. **Iterating visually** — seeing the output and directing changes like a design review
3. **Staying in your PM frame** — you're shaping the product experience, not the implementation

You are the product thinker. Claude is the builder.

---

## The Build Loop

```
PROMPT → PREVIEW → ITERATE → SHIP

Prompt:   Tell Claude what to build (in plain English)
Preview:  Open the output in a browser, see what exists
Iterate:  Tell Claude what to change (like a design review)
Ship:     Deploy when it's good enough (Module 9.5)
```

One loop takes 5–15 minutes. You run 4–6 loops to get to a shippable prototype.

---

## The PM Build Mindset

Before writing a single prompt, answer these three questions:

**1. Who is this for?**  
Name the user. Not "the team" — a specific person. Marcus the Operations Manager? Olivia the VP of Ops?

**2. What is the one thing it must do?**  
Not "be a dashboard." Not "track everything." One thing. "Show which approval requests are stuck and for how long."

**3. What does success look like in 30 seconds?**  
A user opens it. In 30 seconds, what do they know or do that they couldn't before?

Write these three answers before prompting.

---

## Build Loop: Example

**You want to build:** A metrics dashboard for Meridian's weekly ORR and activation data.

**Your 3 answers:**
1. **Who:** Olivia (VP Ops) who checks metrics every Monday morning
2. **One thing:** See ORR trend + activation rate side by side, at a glance
3. **30-second success:** She opens it and immediately knows if this week is better or worse than last week

---

### Round 1: The First Prompt

```
Build a single-page HTML dashboard for a B2B SaaS PM called "Meridian OS — Weekly Metrics."

Design requirements:
- Dark mode, modern, professional. Not playful — serious PM tool.
- Google Fonts: Inter for headings, system-ui for body
- Color palette: dark background (#0F1117), accent (#6366F1), white text

Content to display:
1. ORR (Orchestration Run Rate): 91,200 this week, 84,000 last week (+8.6%)
2. Activation Rate: 71% this week, 67% last week (+4pp)
3. NRR: 119% trailing 12 months
4. A simple line chart showing 6-week ORR trend: 84000, 87200, 89400, 88100, 91500, 91200

Layout:
- Header with "Meridian OS — Weekly Metrics" + current date
- 3 metric cards in a row (ORR, Activation, NRR)
- Line chart below
- Footer: "Updated: Monday morning digest"

Save to: CLAUDE-OUTPUTS/prototypes/metrics-dashboard.html
```

---

### Round 2: Review and Redirect

Open `CLAUDE-OUTPUTS/prototypes/metrics-dashboard.html` in your browser.

Look at it as Olivia would. Ask yourself:
- Can I see the week-over-week change immediately?
- Does the upward/downward trend read at a glance?
- Is anything confusing or cluttered?

Then give Claude specific direction (not "make it better"):

```
Looking at the dashboard:
1. The WoW change numbers are too small. Make them 24px and color them:
   green (#22C55E) for positive changes, red (#EF4444) for negative
2. Add a ⚠️ banner at the top if any metric is down week-over-week
3. Make the line chart taller — it's too compressed to read the trend
4. Add a "Last 6 weeks" label above the chart

Save the updated version as metrics-dashboard-v2.html
```

---

### Round 3: Polish Pass

```
Final polish on metrics-dashboard-v2.html:

1. Add a subtle gradient to each metric card (darker at top, slightly lighter at bottom)
2. Add hover states to the metric cards — slight elevation effect
3. Make the layout responsive — should stack vertically on screens under 768px
4. Add a "Download as PNG" button (can be non-functional for prototype — just styled)

Save as metrics-dashboard-v3.html — this is the version to share with Olivia for feedback.
```

---

## When to Build vs. When to Spec

The build loop is not for every feature. Use it strategically:

| Build a Prototype | Write a Spec |
|-------------------|-------------|
| Ambiguous UX — stakeholders disagree on what it should look like | Clear technical implementation, no UX ambiguity |
| New surface or workflow no one has seen before | Extension of an existing pattern |
| Needs user testing before engineering commitment | Engineering-driven constraints define the experience |
| Internal tool that a PM can maintain | Customer-facing feature that needs production quality |
| Quick validation needed before spec investment | Spec is faster than building |

**Rule of thumb:** If the conversation keeps going in circles because no one can visualize it — build the prototype. That ends the meeting.

---

## Hands-On Exercise

**Task:** Run 3 build loop iterations on the metrics dashboard.

1. Run Round 1 — generate `metrics-dashboard.html`
2. Open it in your browser. Write down 3 specific things to change.
3. Run Round 2 with your feedback.
4. Run Round 3 as a polish pass.
5. Open `metrics-dashboard-v3.html` — is this something you'd feel comfortable showing Olivia?

---

## Module Checkpoint

- [ ] `metrics-dashboard.html` exists in CLAUDE-OUTPUTS/prototypes/
- [ ] You've run at least 3 build loop iterations
- [ ] `metrics-dashboard-v3.html` is ready to share
- [ ] You can articulate the difference between "build" and "spec" decisions

---

## Next: Module 9.2
Build your first internal tool — a metrics dashboard with real interactivity.

```
/start-m9-2
```
