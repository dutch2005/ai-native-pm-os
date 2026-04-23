Run the weekly PM metrics digest.

Steps:
1. Read PROJECTS/meridian-os/analytics/weekly-export.csv
2. Find the most recent file in CLAUDE-OUTPUTS/data-analysis/ with a name starting "digest-" 
   for week-over-week comparison. If none found, note "no prior week baseline available."

3. Write a narrative weekly digest:
   - FIRST LINE: The single most important metric movement this week (lead with the insight)
   - ORR: current value, WoW change (absolute + %), trend direction (↑↓→)
   - Activation Rate: current %, WoW change in percentage points
   - NRR: current %, vs. prior baseline if available
   - ⚠️ FLAG any metric that moved ±15%+ week-over-week
   - CLOSE: one recommended focus for the team this week

4. Format: 200–300 words. Slack-ready — short paragraphs, no tables, no jargon.

5. Save to: CLAUDE-OUTPUTS/data-analysis/digest-[YYYY-MM-DD].md

6. Return the full digest text after saving.

If the CSV file doesn't exist, tell me to complete Module 4.1 first to create the mock data.
