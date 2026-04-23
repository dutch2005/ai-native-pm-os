# Module 2.3 — Sub-Agents: Delegating Parallel Tasks

**Time:** ~35 minutes  
**Outcome:** You can run multiple research or analysis tasks simultaneously and synthesize them into one output

---

## The Problem with Sequential Work

Most PM work is done sequentially — one task, then the next. That's how humans think. It's also slow.

When a human PM synthesizes 8 user interviews, they read one, take notes, read the next, compare, and so on. Takes hours.

With sub-agents, Claude reads all 8 simultaneously, extracts themes in parallel, and returns a synthesis that would have taken you an afternoon — in minutes.

---

## What a Sub-Agent Is

A sub-agent is a separate Claude instance spawned by your main session to work on a specific task independently. It:

- Runs concurrently with other sub-agents
- Has its own task scope
- Reports results back to the main session
- Can work on completely different files or topics simultaneously

Think of it as spinning up a temporary analyst for each workstream.

---

## How to Trigger Sub-Agent Work

You don't need special syntax. You frame the prompt as parallel delegation:

```
I need you to work on three separate tasks simultaneously. 
Treat each as an independent sub-task and complete all three before 
returning results.

Task 1: Read PROJECTS/meridian-os/research/interview-1.md through 
interview-4.md and extract the top 3 recurring pain points with evidence quotes.

Task 2: Read PROJECTS/meridian-os/analytics/q1-funnel.md and calculate 
the drop-off rate at each stage, then identify the single biggest bottleneck.

Task 3: Read PROJECTS/meridian-os/competitive/zapier-analysis.md and 
summarize the 3 features where Zapier beats us and 3 where we beat them.

When all three are complete, return results under clear headers.
Save the combined output to CLAUDE-OUTPUTS/research/parallel-analysis-[date].md
```

---

## Real PM Use Cases for Sub-Agents

### Use Case 1: Multi-Transcript Interview Synthesis
```
Process these 6 interview transcripts simultaneously and extract:
- Recurring pain points (must appear in 3+ interviews to qualify)
- Jobs-to-be-done statements
- Specific quotes for each theme

Files: research/interviews/interview-01.md through interview-06.md
Save to: CLAUDE-OUTPUTS/research/interview-synthesis-q2.md
```

### Use Case 2: Competitor Snapshot
```
Simultaneously review:
- research/competitors/zapier-g2-reviews.md
- research/competitors/make-pricing-page.md  
- research/competitors/servicenow-case-studies.md

For each: extract top 3 strengths, top 3 weaknesses, and pricing model.
Return as a comparison table.
```

### Use Case 3: PRD Multi-Perspective Review
```
Review this PRD draft (CLAUDE-OUTPUTS/prds/approval-routing-v1.md) 
from three perspectives simultaneously:

Perspective 1: Senior Engineer — flag technical ambiguities and scope risks
Perspective 2: Head of Design — flag UX gaps and user flow assumptions
Perspective 3: CFO — flag ROI gaps and missing success metrics

Return critique from each perspective under separate headers.
```

---

## Synthesizing Sub-Agent Output

After running parallel tasks, you'll often want a synthesis layer:

```
You've returned three analyses. Now synthesize them into a single 
executive summary (max 5 bullets) that:
1. Identifies the single most important finding across all three
2. Highlights any contradictions between findings
3. States the clearest recommended next action

This summary is for Dev Kapoor (CEO). Apply his communication preferences.
Save to: CLAUDE-OUTPUTS/research/exec-synthesis-[date].md
```

---

## Hands-On Exercise

**Task:** Run your first parallel research task.

**Setup:** Create three short mock interview files:
```bash
mkdir -p PROJECTS/meridian-os/research/interviews

cat > PROJECTS/meridian-os/research/interviews/interview-01.md << 'EOF'
# Interview: Olivia Chen, VP Operations, TechStart Inc.
Date: 2025-04-01

Key pain: "Our approval process for headcount takes 3 weeks. By the time
it's approved, we've lost the candidate."

Secondary pain: "I have no idea where a request is in the chain unless
I manually Slack each person."

Would pay for: Real-time approval status visibility + automated escalation.
EOF

cat > PROJECTS/meridian-os/research/interviews/interview-02.md << 'EOF'
# Interview: Marcus Rodriguez, Ops Manager, Bloom Retail
Date: 2025-04-03

Key pain: "I rebuilt our procurement workflow four times last year.
Every time we change a tool, I start from scratch."

Secondary pain: "Nobody else on the team can maintain the workflows.
It's all in my head."

Would pay for: Tool-agnostic workflow builder with readable logic.
EOF

cat > PROJECTS/meridian-os/research/interviews/interview-03.md << 'EOF'
# Interview: Asha Patel, Finance Analyst, CloudServe
Date: 2025-04-05

Key pain: "Approval month. Every month. I spend 40% of that week
chasing signatures on invoices."

Secondary pain: "There's no logic for what happens when an approver
is out. It just... stops."

Would pay for: Conditional routing + OOO escalation handling.
EOF
```

**Run the parallel analysis:**
```
Read interviews 01, 02, and 03 simultaneously.
For each: extract (1) primary pain, (2) secondary pain, (3) willingness to pay signal.
Then synthesize: what is the single theme that appears across all three interviews?
Save full output to CLAUDE-OUTPUTS/research/interview-synthesis-exercise.md
```

Review the output. This is the pattern you'll use on real research at 10x the volume.

---

## Module Checkpoint

- [ ] You understand what a sub-agent is and how to trigger parallel tasks
- [ ] You've created the 3 mock interview files
- [ ] You've run a parallel synthesis prompt and verified the output
- [ ] You can name 3 real PM use cases where parallel sub-agents would save you time

---

## Next: Module 2.4
Project memory — how Claude retains context across sessions.

```
/start-m2-4
```
