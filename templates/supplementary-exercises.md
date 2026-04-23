# Supplementary Exercises — From Reference Materials

These exercises are drawn from the AI Agents and Projects reference PDFs included in the course files. They are organized by skill level and mapped to the relevant course module.

---

## How to Use This File

Each exercise below can be run as a standalone drill inside Claude Code. They are complementary to the main module lessons — use them when you want more practice or real-world variations on a concept.

Reference PDFs are in: `/Users/vishal/Documents/Linkedin/Product Managers/files/`

---

## BEGINNER LEVEL EXERCISES

### Exercise B-1: Weekly Status Report Agent
**Maps to:** Module 2.3 (Sub-Agents)  
**Tool:** Claude Code or Cowork  
**Source:** agents_beginner_final.pdf

**Setup:** Create a folder `PROJECTS/meridian-os/weekly-notes/` with 3–4 markdown files containing meeting notes from the past week.

**Prompt:**
```
Read all files in PROJECTS/meridian-os/weekly-notes/ 
and produce a weekly status report with these sections:

1. Executive Summary (3 bullet points — what matters most)
2. Completed This Week (with owner names)
3. In Progress (with % complete estimates)
4. Risks & Blockers (flagged with ⚠️)
5. Next Week's Priorities

Audience: Dev Kapoor (CEO). Apply his communication preferences from CLAUDE.md.
Save to: CLAUDE-OUTPUTS/reports/status-report-[date].md
```

**What you learn:** Multi-file synthesis → executive narrative → stakeholder-calibrated output

---

### Exercise B-2: Interview Screener Agent
**Maps to:** Module 5.1 (Research Synthesis)  
**Tool:** Cowork or Claude Code  
**Source:** agents_beginner_final.pdf

**Setup:** Create a `PROJECTS/meridian-os/hiring/` folder with 3 fake CV summaries (markdown format) and one `job-spec.md` for a PM role.

**Prompt:**
```
Read job-spec.md and all CV files in PROJECTS/meridian-os/hiring/.

For each candidate, score them 1–10 on:
- Product sense (based on evidence in their background)
- Technical depth (for a B2B SaaS PM role)
- Communication clarity (from how their CV is written)

Return a ranked table with scores and one-line rationale per dimension.
Flag any candidate with a score below 6 in any dimension with ⚠️.
Save to: CLAUDE-OUTPUTS/hiring/cv-screening-[date].md
```

**What you learn:** Structured evaluation against criteria → ranked output → automated screening workflow

---

### Exercise B-3: Inbox Triage Agent
**Maps to:** Module 5.2 (Support Ticket Mining)  
**Tool:** Claude Code  
**Source:** agents_beginner_final.pdf

**Setup:** Create `PROJECTS/meridian-os/support/tickets-this-week.md` with 10–15 short support ticket descriptions (you can invent them based on Meridian's product).

**Prompt:**
```
Read PROJECTS/meridian-os/support/tickets-this-week.md.

Categorize each ticket into one of these buckets:
- Bug (something broken)
- Feature Request (user wants something new)
- Question / Documentation Gap (user needs help finding something)
- Billing / Account (non-product)

Then:
1. Count tickets per category
2. Flag the 3 highest-priority items based on urgency signals in the text
3. Identify any recurring theme across 3+ tickets (product insight)

Return as a table + one insight paragraph.
Save to: CLAUDE-OUTPUTS/research/ticket-triage-[date].md
```

**What you learn:** Ticket categorization → pattern recognition → product signal extraction

---

## INTERMEDIATE LEVEL EXERCISES

### Exercise I-1: Sprint Retrospective Agent
**Maps to:** Module 6 (Strategy & Stakeholder Work)  
**Tool:** Cowork or Claude Code  
**Source:** agents_intermediate_final.pdf

**Setup:** Create `PROJECTS/meridian-os/sprints/sprint-15-jira-export.md` with a list of 10–12 fictional Jira tickets (title, assignee, status, story points, completion date).

**Prompt:**
```
Read PROJECTS/meridian-os/sprints/sprint-15-jira-export.md.

Produce a sprint retrospective analysis:

1. VELOCITY: Points completed vs. planned (estimate planned as 20% above completed)
2. BOTTLENECKS: Which tickets were delayed or carried over? Why? (infer from status)
3. TOP CONTRIBUTOR: Who closed the most points?
4. PROCESS PATTERNS: Any recurring issue type (e.g., "3 tickets blocked by external dependency")?
5. RETRO PROMPTS: Generate 3 discussion questions for the team retro meeting

Format for Tara Novak (CTO). Apply her framing preferences from CLAUDE.md.
Save to: CLAUDE-OUTPUTS/strategy-docs/sprint-15-retro.md
```

---

### Exercise I-2: Stakeholder Briefing Agent
**Maps to:** Module 6.3 (Exec Narrative)  
**Tool:** Claude Code  
**Source:** agents_intermediate_final.pdf

**Setup:** Use any existing research synthesis from your CLAUDE-OUTPUTS/research/ folder.

**Prompt:**
```
Read CLAUDE-OUTPUTS/research/[your-synthesis-file].md.

Generate three separate briefing summaries of this research — one for each audience:

BRIEFING A — Dev Kapoor (CEO):
- 3 bullets only
- Lead with revenue or growth implication
- Close with recommended decision

BRIEFING B — Priya Singh (Head of Design):
- User insight focused
- Include 2 direct user quotes
- Close with design implication

BRIEFING C — Rohan Mehta (Head of Sales):
- Competitive angle
- How does this affect deal velocity or objection handling?
- Close with one sales enablement action

Save all three to: CLAUDE-OUTPUTS/stakeholder-comms/stakeholder-briefings-[date].md
```

---

### Exercise I-3: OKR Progress Tracker
**Maps to:** Module 4.2 (Narrative Analytics)  
**Tool:** Claude Code  
**Source:** agents_intermediate_final.pdf

**Setup:** Use the OKRs in `PROJECTS/meridian-os/CLAUDE.md` and the weekly metrics CSV from Module 4.

**Prompt:**
```
Read:
- PROJECTS/meridian-os/CLAUDE.md (for Q2 OKRs and targets)
- PROJECTS/meridian-os/analytics/weekly-export.csv (for current metrics)

For each Key Result:
1. State the target
2. State the current value (from the data)
3. Calculate % progress toward target
4. Status: On Track ✅ / At Risk ⚠️ / Behind ❌
5. One-sentence action recommendation if At Risk or Behind

Return as a table.
Save to: CLAUDE-OUTPUTS/strategy-docs/okr-tracker-[date].md
```

---

## ADVANCED LEVEL EXERCISES

### Exercise A-1: Multi-Source Discovery Agent
**Maps to:** Module 5 (Research & Discovery)  
**Tool:** Claude Code  
**Source:** agents_advanced_final.pdf

**Prompt:**
```
I want you to do a cross-source contradiction analysis.

Read simultaneously:
- PROJECTS/meridian-os/roadmap.md (what we plan to build)
- CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md (what the PRD says)
- PROJECTS/meridian-os/research/interview-synthesis-q2.md (what users actually want)

Find contradictions: places where the PRD or roadmap conflicts with user research.
Find gaps: things users clearly want that appear in neither the PRD nor the roadmap.
Find alignment: where all three sources agree (these are your safest bets).

Return as three sections with specific evidence for each finding.
Save to: CLAUDE-OUTPUTS/research/contradiction-analysis-[date].md
```

---

### Exercise A-2: Launch Readiness Audit
**Maps to:** Module 3.4 (Lightweight Specs)  
**Tool:** Cowork  
**Source:** agents_advanced_final.pdf

**Setup:** Create `PROJECTS/meridian-os/launches/approval-routing-v1/` with a few markdown files (release notes draft, QA summary, legal notes).

**Prompt:**
```
Audit the launch folder at PROJECTS/meridian-os/launches/approval-routing-v1/.

Check against this launch checklist:
✅ PRD approved (look for approval-routing-prd-v2.md in outputs)
✅ QA sign-off (look for QA summary with no Critical bugs open)
✅ Legal review (check legal-notes.md for any unresolved flags)
✅ Release notes drafted (check for release-notes.md)
✅ Success metrics instrumented (check if metrics are defined in PRD)
✅ Sales brief sent (check for stakeholder-comms mentioning Rohan)

Return: 
- ✅ Passed | ⚠️ Needs attention | ❌ Missing — for each item
- Overall launch readiness: READY / NOT READY
- Top 2 blockers to address before launch

Save to: CLAUDE-OUTPUTS/strategy-docs/launch-audit-[date].md
```

---

### Exercise A-3: Multi-Persona PRD Review
**Maps to:** Module 3.2 (Multi-Perspective Review)  
**Tool:** Claude Code  
**Source:** projects_advanced_final.pdf

**Prompt:**
```
Review CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.md from three expert perspectives simultaneously:

SECURITY ENGINEER: 
- What data access patterns could create security risks?
- Are there audit/compliance gaps for enterprise customers?
- What authentication or authorization requirements are underspecified?

UX RESEARCHER:
- What user flows create friction for Marcus (workflow builder)?
- What error states and empty states are not addressed?
- Where does the feature assume too much user sophistication?

LEGAL / COMPLIANCE:
- What regulations might apply to approval workflow data?
- Is there anything that requires disclosure or consent?
- What's the liability exposure if an OOO escalation fails?

Return each perspective as a numbered list under its header.
Conclude with: Top 3 issues to fix before engineering review.
Save to: CLAUDE-OUTPUTS/prds/approval-routing-expert-review.md
```

---

### Exercise A-4: A/B Test Analyst
**Maps to:** Module 4.4 (A/B Test Interpretation)  
**Tool:** Claude Code  
**Source:** projects_advanced_final.pdf

**Setup:** Create `PROJECTS/meridian-os/analytics/ab-test-onboarding.md` with fictional experiment data: control vs. variant, sample sizes, conversion rates by region.

**Prompt:**
```
Read PROJECTS/meridian-os/analytics/ab-test-onboarding.md.

Analyze this A/B test result:
1. STATISTICAL SIGNIFICANCE: Is the result significant at 95% confidence? Show the math.
2. EFFECT SIZE: What is the lift? Is it meaningful for our business? 
3. REGIONAL BREAKDOWN: Do results differ by region? Flag any where the variant underperforms.
4. GUARDRAIL METRICS: Did any secondary metrics degrade? (flag if included in data)
5. DECISION: Ship / Kill / Run longer — with clear rationale

Write as a decision memo, not a stats report.
Audience: Dev Kapoor — he'll make the call in 5 minutes.
Save to: CLAUDE-OUTPUTS/data-analysis/ab-test-onboarding-decision.md
```

---

### Exercise A-5: Churn Root Cause Agent
**Maps to:** Module 4 and Module 5  
**Tool:** Cowork  
**Source:** projects_advanced_final.pdf

**Setup:** Create three files:
- `analytics/churned-accounts-q1.md` — 5 accounts that churned (name, segment, ARR, churn date)
- `support/tickets-churned-accounts.md` — support tickets filed by those accounts before churning
- `research/nps-churned-cohort.md` — NPS verbatim comments from those accounts

**Prompt:**
```
Read these three files simultaneously:
- analytics/churned-accounts-q1.md
- support/tickets-churned-accounts.md
- research/nps-churned-cohort.md

For each churned account, build a churn story:
- What did they complain about in support?
- What did they say in their NPS comment?
- Is there a pattern across accounts?

Then synthesize:
1. TOP CHURN REASON (the one thing that appears in 3+ accounts)
2. EARLY WARNING SIGNALS (what could we have seen coming?)
3. PREVENTABLE vs. UNPREVENTABLE (categorize each account)
4. RECOMMENDED RETENTION PLAY (one product or CS action we could take earlier)

Save to: CLAUDE-OUTPUTS/research/churn-analysis-q1.md
```

---

## Skill Level Reference

| Your current level | Start with | Then do |
|-------------------|-----------|---------|
| New to Claude Code | B-1, B-2, B-3 | I-1, I-2, I-3 |
| Comfortable with Claude Code | I-1, I-2, I-3 | A-1, A-2, A-3 |
| Advanced practitioner | A-1 through A-5 | Module 10 Capstone |
