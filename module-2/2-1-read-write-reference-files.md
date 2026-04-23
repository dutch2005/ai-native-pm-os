# Module 2.1 — Read, Write, and Reference Files

**Time:** ~30 minutes  
**Outcome:** You can read, write, reference, and organize files from within Claude Code like a native operation

---

## Why This Is the Core Skill

Everything else in this course — PRDs, research synthesis, analytics, stakeholder comms — runs on top of file operations. If you're not fluent in how Claude Code interacts with files, everything above it is shaky.

This lesson makes file operations instinctive.

---

## The Mental Model: Claude as Your Filing System

In Claude Code, files are not just things you open in an editor. They are:
- **Context sources** you feed into Claude's reasoning
- **Outputs** that Claude writes on your behalf
- **Persistent memory** that survives session restarts
- **Inputs to other files** in a chain of work

---

## Three Ways Claude Works with Files

### Method 1: You Point, Claude Reads

The most direct method. You tell Claude exactly what to read.

```
Read PROJECTS/meridian-os/roadmap.md and tell me which features are 
currently in active development.
```

Claude reads the file, reasons about it, and answers. It doesn't guess — it reads your actual file.

**When to use:** When you want Claude to work from a specific file's current content.

---

### Method 2: Claude Writes to a File

You ask Claude to produce an output and save it directly.

```
Write a one-pager for the Conditional Approval Routing feature and save it 
to CLAUDE-OUTPUTS/strategy-docs/approval-routing-one-pager.md
```

Claude generates the document and writes it to the path you specified.

**When to use:** When generating any PM artifact — PRDs, briefs, summaries, etc.

**Rule:** Always target `CLAUDE-OUTPUTS/` for generated files. Never write to `PROJECTS/` or `ABOUT-ME/` directly.

---

### Method 3: Claude Synthesizes Across Multiple Files

The most powerful method. Claude reads several files simultaneously and produces a unified output.

```
Read the following three files and produce a single executive summary 
that synthesizes findings from all three:
- PROJECTS/meridian-os/research/interview-batch-march.md
- PROJECTS/meridian-os/analytics/q1-retention-data.md
- PROJECTS/meridian-os/stakeholders.md

Save the summary to CLAUDE-OUTPUTS/research/march-executive-summary.md
```

**When to use:** Research synthesis, data + context correlation, cross-functional briefs.

---

## PM File Reference Patterns

These are the most common file operations you'll use in daily PM work:

### Pattern 1: Context Load at Session Start
```
Read ABOUT-ME/CLAUDE.md and PROJECTS/meridian-os/CLAUDE.md to load context.
Confirm: what is my current top priority?
```

### Pattern 2: Update a Living Document
```
Read PROJECTS/meridian-os/okrs.md. 
Update KR1 status from "11 days" to "9 days" (new data from this week's cohort).
Save the updated version back to the same file.
```

### Pattern 3: Reference + Generate
```
Read TEMPLATES/prd-template.md to understand the structure, then read 
PROJECTS/approval-routing/CLAUDE.md for feature context.
Generate a full PRD draft using that template and context.
Save to CLAUDE-OUTPUTS/prds/approval-routing-v1.md
```

### Pattern 4: Diff Comparison
```
Read CLAUDE-OUTPUTS/prds/approval-routing-v1.md (the original draft)
and CLAUDE-OUTPUTS/prds/approval-routing-v2.md (the revised version).
List every change between them, organized by section.
```

---

## File Naming Conventions for PMs

Consistent naming saves you hours of searching over time.

| File Type | Format | Example |
|-----------|--------|---------|
| PRD draft | `[feature]-prd-v[N].md` | `approval-routing-prd-v1.md` |
| Research synthesis | `[source]-synthesis-[date].md` | `interview-synthesis-2025-04.md` |
| Stakeholder brief | `[audience]-brief-[topic].md` | `exec-brief-q2-roadmap.md` |
| Meeting notes | `[YYYY-MM-DD]-[meeting-type].md` | `2025-04-15-sprint-review.md` |
| Strategy doc | `[topic]-strategy-[date].md` | `pricing-strategy-2025-q2.md` |
| Decision log | `[YYYY-MM-DD]-decision-[topic].md` | `2025-04-12-decision-ooo-routing.md` |

---

## Hands-On Exercise

**Task:** Build your first multi-file PM workflow.

**Step 1:** Create the Meridian roadmap file:
```bash
cat > PROJECTS/meridian-os/roadmap.md << 'EOF'
# Meridian OS — Q2 Roadmap

## Active Development
- Conditional Approval Routing v1 (Sprint 16, PM: You)
- Enterprise Onboarding Templates (Sprint 15, PM: You)

## Scoping
- Dashboard v2 — Operational Overview (Sprint 18)
- Connector Hub Marketplace (Sprint 19)

## Backlog
- Mobile Approval App (H2)
- AI-suggested routing logic (H2)
EOF
```

**Step 2:** In Claude Code, run:
```
Read PROJECTS/meridian-os/roadmap.md and PROJECTS/meridian-os/company-context.md.

Based on the roadmap and the Q2 OKRs in company-context.md, identify which 
active features most directly impact each OKR, and flag any OKRs that have 
no corresponding roadmap item.

Save the analysis to CLAUDE-OUTPUTS/strategy-docs/okr-roadmap-alignment.md
```

**Step 3:** Open the generated file and check:
- Did Claude read both files correctly?
- Did it identify the OKR gaps?
- Is the output in your CLAUDE-OUTPUTS folder?

---

## Module Checkpoint

- [ ] You can ask Claude to read a specific file and reason from it
- [ ] You've asked Claude to write a file to CLAUDE-OUTPUTS/
- [ ] You've run a multi-file synthesis prompt
- [ ] You have a naming convention you'll actually stick to

---

## Next: Module 2.2
Build your learning.md course companion and progress tracker.

```
/start-m2-2
```
