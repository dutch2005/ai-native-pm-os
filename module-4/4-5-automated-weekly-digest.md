# Module 4.5 — Automated Weekly Metrics Digest (Cowork Routine)

**Time:** ~45 minutes  
**Outcome:** A scheduled routine in Claude Cowork that runs every Monday morning and delivers your metrics digest automatically

---

## This Is Where the PM OS Becomes Truly Autonomous

Up to this point, everything in the course has been interactive — you run Claude Code, you issue a command, you get a result.

This module is different. You're going to build a **routine** — a workflow that runs on a schedule, without you initiating it. You'll wake up on Monday morning and your weekly metrics digest will already be in your CLAUDE-OUTPUTS folder and posted to Slack.

This is Claude Cowork's **Dispatch** feature in action.

---

## What You're Building

**The Monday Morning Digest Routine:**

```
Every Monday at 7:00 AM →
  1. Read last week's metrics export from analytics/weekly-export.csv
  2. Compare to the previous week's baseline
  3. Write a narrative digest highlighting key movements
  4. Flag any metric that moved more than ±15% week-over-week
  5. Save digest to CLAUDE-OUTPUTS/data-analysis/digest-[date].md
  6. (Optional) Post summary to Slack #product-data channel
```

---

## Option A: Claude Cowork (Dispatch) — Recommended

Claude Cowork's Scheduled Tasks (Dispatch) runs this automatically through the Claude Desktop app.

> **First, verify Cowork Dispatch is available:** Open Claude Desktop → look for **Cowork** in the left sidebar → **Customize** → **Scheduled Tasks**. If you don't see this, skip to Option B (cron job) — it's equally effective and covered below.

### Step 1: Open Claude Desktop
Download from claude.ai/download if you haven't already. Install on macOS or Windows.

### Step 2: Navigate to Cowork
In Claude Desktop: Click **Cowork** in the left sidebar → **Customize** → **Scheduled Tasks**

### Step 3: Create the Digest Routine

In the scheduled task setup, configure:

**Name:** Weekly PM Metrics Digest  
**Schedule:** Every Monday at 7:00 AM (your timezone)  
**Task prompt:**
```
Run my weekly PM metrics digest routine:

1. Read the file at [your workspace path]/PROJECTS/meridian-os/analytics/weekly-export.csv
2. Read the previous week's digest at [your workspace path]/CLAUDE-OUTPUTS/data-analysis/ 
   (find the most recent file starting with "digest-")

3. Produce a narrative weekly digest that:
   - Opens with the single most important metric movement this week
   - Reports ORR (Orchestration Run Rate): current value, WoW change, and trend
   - Reports Activation Rate: current %, WoW change
   - Reports NRR: current %, vs. same week last quarter
   - FLAGS (with ⚠️) any metric that moved more than ±15% week-over-week
   - Closes with one recommendation for the team this week

4. Format: 200–300 words. Slack-ready (short paragraphs, no tables).

5. Save the digest to: [your workspace path]/CLAUDE-OUTPUTS/data-analysis/digest-[today's date].md

6. Return the digest text so I can review it.
```

**Permissions:** Enable file read/write access for your workspace directory

---

## Option B: Claude Code + OS Cron Job

If you prefer to run this via Claude Code instead of Cowork:

**Step 1:** Create the digest script:

```bash
cat > .claude/commands/weekly-digest.md << 'EOF'
Run my weekly PM metrics digest.

1. Read PROJECTS/meridian-os/analytics/weekly-export.csv
2. Find the most recent file in CLAUDE-OUTPUTS/data-analysis/ starting with "digest-" 
   for week-over-week comparison
3. Write a narrative digest:
   - Lead with single most important finding
   - ORR: value, WoW change, trend direction
   - Activation Rate: current %, WoW change
   - NRR: current vs. quarter-ago
   - ⚠️ Flag anything that moved ±15%+
   - Close with one team recommendation
4. Format: 200–300 words, Slack-ready
5. Save to CLAUDE-OUTPUTS/data-analysis/digest-[YYYY-MM-DD].md
EOF
```

**Step 2:** Create a shell script that runs it:

```bash
cat > run-digest.sh << 'EOF'
#!/bin/bash
cd /path/to/your/PM-OS
echo "Running weekly digest at $(date)"
claude -p "$(cat .claude/commands/weekly-digest.md)" --print
EOF
chmod +x run-digest.sh
```

**Step 3:** Schedule with macOS cron:
```bash
crontab -e
# Add this line (runs every Monday at 7am):
0 7 * * 1 /path/to/your/PM-OS/run-digest.sh >> /tmp/pm-digest.log 2>&1
```

---

## The Mock Weekly Export

Create a sample weekly metrics file to test against:

```bash
cat > PROJECTS/meridian-os/analytics/weekly-export.csv << 'EOF'
Metric,This Week,Last Week,WoW Change
ORR (Orchestration Run Rate),91200,84000,+8.6%
Activation Rate (30-day),71%,67%,+4pp
NRR (trailing 12-month),119%,118%,+1pp
New Customers,4,3,+33%
Churn,1,0,+100%
Avg Workflows per Customer,6.2,5.9,+5.1%
Support Tickets,47,52,-9.6%
EOF
```

---

## Testing the Routine

Before scheduling, test it manually:

```
/weekly-digest
```

Or in Cowork, click "Run now" on the scheduled task.

Verify:
- The output leads with a key finding (not setup text)
- ⚠️ flags appear for metrics that moved ±15%+ (New Customers +33%, Churn +100%)
- The digest is under 300 words
- The file is saved to CLAUDE-OUTPUTS/data-analysis/

---

## The Power of Autonomous Routines

Once this runs successfully:
- You get Monday context before your first meeting
- Your team gets a consistent weekly pulse without PM effort
- The digest accumulates over time — Claude can reference past digests for trend analysis
- You can add metrics, remove them, or change format by editing one file

This is what "Claude as PM infrastructure" means. Not a prompt you run once — a system that runs for you.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Mock weekly-export.csv created with realistic Meridian metrics
- [ ] `/weekly-digest` slash command works and produces a clean narrative output
- [ ] At least one method (Cowork or cron) is set up to run automatically
- [ ] The digest flags the ±15% movers correctly
- [ ] Output saved to CLAUDE-OUTPUTS/data-analysis/ with date-stamped filename

---

## Module 4 Complete

You now have a full analytics workflow:
- Connected to data files (CSV exports, structured text)
- Narrative analytics memos from raw numbers
- Funnel analysis and retention math
- A/B test interpretation framework
- An autonomous Monday digest routine

**Start Module 5:**
```
/start-m5-1
```

*Module 5: Research & Discovery — interview synthesis, support ticket mining, and competitive intelligence at scale.*
