# Module 4.1 — Connecting to Live Data: CSV, SQL, and Analytics Exports

**Time:** ~40 minutes  
**Outcome:** Claude reading and analyzing a real data file and producing a narrative memo

---

## The Analytics Gap Most PMs Have

PMs who use AI for writing are everywhere. PMs who use AI for data analysis are rare.

Most PMs export data from Amplitude, Mixpanel, or their BI tool — then spend hours in spreadsheets making sense of it. Or they rely on a data analyst who has a queue.

This module gives you the pattern to do your own analysis — fast, in plain language, with Claude as your analyst.

---

## What "Live Data" Means in This Context

You won't connect Claude directly to a database in this lesson (that's Module 7). What you will do is work with exported data files — CSVs, markdown tables, and structured text — that you pull from your analytics tools.

This works with:
- Amplitude CSV exports
- Mixpanel event data
- BigQuery or Redshift query results (pasted or exported)
- Looker or Tableau data exports
- Excel or Google Sheets data (save as CSV)

---

## The Data Analysis Pattern

```
Step 1: Export data from your analytics tool (CSV)
Step 2: Place it in PROJECTS/[project]/analytics/
Step 3: Ask Claude to read and analyze it
Step 4: Claude produces a narrative memo
Step 5: Save memo to CLAUDE-OUTPUTS/data-analysis/
```

---

## Hands-On: Analyze a Funnel CSV

**Step 1:** Create a mock funnel data file:

```bash
mkdir -p PROJECTS/meridian-os/analytics

cat > PROJECTS/meridian-os/analytics/q1-activation-funnel.csv << 'EOF'
Stage,Week 1,Week 2,Week 3,Week 4,Week 5,Week 6
Signed Up,342,318,401,376,429,398
Completed Onboarding,241,224,287,259,312,281
Created First Workflow,156,141,178,159,198,174
Ran First Orchestration,98,87,112,103,134,118
Reached 10 Runs (Activated),61,54,69,65,84,73
EOF
```

**Step 2:** In Claude Code, run:

```
Read PROJECTS/meridian-os/analytics/q1-activation-funnel.csv

Analyze this activation funnel data and produce a narrative analytics memo.

Your analysis must include:

1. FUNNEL OVERVIEW
   - Overall conversion rate from sign-up to activation across all 6 weeks
   - Week-over-week trend (is it improving, declining, or flat?)

2. BIGGEST DROP-OFF
   - Which single stage loses the most users? 
   - What percentage is lost at that stage?
   - Why might this be happening? (hypothesize based on what you know about Meridian)

3. BRIGHT SPOTS
   - Is there any stage that shows improving conversion over the 6 weeks?

4. RECOMMENDED FOCUS
   - If we could fix one thing in this funnel, what would have the highest impact?
   - Frame as a hypothesis: "If we improve X by Y%, we expect Z more activated users per week"

Format: Write as a narrative memo (not a table dump). 
Opening line should state the single most important finding.
Close with one recommended next action.

Save to: CLAUDE-OUTPUTS/data-analysis/q1-activation-memo.md
```

---

## Reading the Output

A good analytics memo from Claude will:
- Lead with the key finding (not a preamble)
- Quantify the drop-off in absolute and percentage terms
- Hypothesize causes without over-claiming certainty
- End with a single clear recommendation

If it instead produces a wall of tables or restates the data without insight — your prompt wasn't specific enough about format and narrative requirements.

---

## The Narrative Analytics Formula

Use this prompt structure for any dataset:

```
Read [file path].

Analyze this data and produce a narrative memo that:
1. States the single most important finding in the opening sentence
2. Quantifies [specific metric] across [time period]
3. Identifies [the key question] with supporting numbers
4. Hypothesizes [cause or explanation]
5. Closes with one recommended action

Write in narrative form, not as a table dump.
The audience is [persona — e.g. "a CEO who reads fast and wants the point first"].

Save to: CLAUDE-OUTPUTS/data-analysis/[filename].md
```

---

## Common PM Analytics Use Cases

| Scenario | Data Source | Claude Task |
|----------|------------|-------------|
| Weekly funnel review | Amplitude CSV | Narrative drop-off memo |
| Retention cohort analysis | Mixpanel export | Cohort comparison + key insight |
| Feature adoption | Product event export | Which users activated, which didn't |
| A/B test results | Experiment CSV | Statistical summary + decision |
| Support ticket trends | Zendesk export | Pattern extraction + volume trend |
| Revenue attribution | CRM export | ARR by segment + growth rate |

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Mock funnel CSV created in the right folder
- [ ] Claude produced a narrative memo (not a table dump)
- [ ] The memo leads with a key finding, not setup or preamble
- [ ] Output saved to CLAUDE-OUTPUTS/data-analysis/
- [ ] You understand the narrative analytics formula for future use

---

## Next: Module 4.2
Narrative analytics — turning raw numbers into insight memos at scale.

```
/start-m4-2
```
