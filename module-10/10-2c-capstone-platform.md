# Module 10.2C — Capstone: The "Technical Infrastructure" Track

**Time:** ~60 minutes  
**Outcome:** A rigorous technical PRD, edge case map, and Jira pipeline for Meridian's API platform

---

## Scenario Context: The API Crisis

Meridian's public API is being abused. 

A single enterprise customer ("Datastream Co") wrote a poorly optimized script that polls the `/workflows/status` endpoint 400 times per second, causing database latency for all other users.

**The Solution:** You need to implement strict rate limiting across the entire API platform.
**The Complication:** If you block Datastream Co outright, they will churn ($90K ARR). You need a tiered rate limiting system that degrades gracefully and returns clear error headers so developers can implement exponential backoff.

---

## Step 1: The Technical PRD

This is not a UI feature. This requires a rigorous technical spec.

```
Task: Write a Full PRD for the API Rate Limiting initiative.

Use the structure from Module 3.1, adapted for a technical platform feature.

Crucial elements to include:
1. Tiered Limits: Define the specific request/minute limits for Free, Pro, and Enterprise tiers.
2. The Response: Define exactly what the API returns when a limit is hit (HTTP 429, `Retry-After` headers, specific JSON error body).
3. The Edge Cases: What happens if a user upgrades their plan mid-billing cycle? How quickly does the rate limit adjust?

Save to: CLAUDE-OUTPUTS/capstone/api-rate-limiting-prd.md
```

---

## Step 2: The Stakeholder Handoff Memo

You have to tell Customer Success that their biggest client is about to start getting API errors.

```
Task: Write a Stakeholder Handoff Memo for the CS team.

Use the executive writing principles from Module 6.3.

Crucial elements to include:
1. The "Why": Explain the platform stability risk without blaming the customer.
2. The Action: Provide the exact script/email template CS should send to Datastream Co to explain how to update their code to handle the new 429 responses.
3. The Timeline: When will this be enforced in staging vs. production?

Save to: CLAUDE-OUTPUTS/capstone/cs-api-handoff-memo.md
```

---

## Step 3: The Jira Ticket Pipeline

Technical PRDs need to be broken down into highly specific engineering tasks.

```
Task: Generate the Engineering Tickets for the Rate Limiting PRD.

Use the pipeline from Module 3.3.

Requirements:
- Extract the work into distinct backend, infrastructure, and documentation tickets.
- Ensure every ticket has strict acceptance criteria (e.g., "Given an enterprise user exceeds 1000 req/min, Then return HTTP 429 with Retry-After header").
- If you have the Jira MCP connected (Module 7.2), have Claude create the tickets directly in your backlog. If not, generate them as markdown.

Save to: CLAUDE-OUTPUTS/capstone/api-rate-limiting-tickets.md
```

---

## Step 4: Competitive Context

Rate limiting is a solved infrastructure problem. Explain why your approach over the standard alternatives.

```
Task: Write a Competitive Context section for the API Rate Limiting PRD.

For each alternative below, write one sentence explaining why it doesn't fully solve 
the specific problem Meridian faces:

1. Using AWS API Gateway's built-in rate limiting instead of building custom
2. Using Kong API Gateway (open-source, self-hosted) as the rate limiting layer
3. Adopting Stripe's exact approach (same HTTP 429 spec + exponential backoff docs)

Frame each as: "[Alternative] doesn't fully address our constraint because [reason]."
(Hint: cost, control, existing architecture, and the Datastream Co grace period are all relevant.)

Add this section to: CLAUDE-OUTPUTS/capstone/api-rate-limiting-prd.md
```

---

## Step 5: How We'd Know It's Working

```
Task: Write the Measurement Plan for the API Rate Limiting initiative.

Structure it as:

LEADING INDICATORS (30 days — signals the system is working correctly):
- [Metric]: target [value]  (Hint: P99 API latency is the right leading indicator here)
- [Metric]: target [value]

LAGGING INDICATORS (60 days — signals developer adoption of correct usage):
- [Metric]: from [baseline] to [target]  (Hint: % of API consumers hitting rate limits)

LAGGING INDICATORS (90 days — signals business impact):
- [Metric]: from [baseline] to [target]  (Hint: Datastream Co ARR retention + DB cost)

KILL METRIC: "If [metric] is above [threshold] at day 30, the implementation has a bug 
and we roll back. If [metric] is above [threshold] at day 60, the tiering model is wrong."

Add this section to: CLAUDE-OUTPUTS/capstone/api-rate-limiting-prd.md
```

---

## Final Review

Once you have completed all steps, run this self-audit:

```
Read:
- CLAUDE-OUTPUTS/capstone/api-rate-limiting-prd.md
- CLAUDE-OUTPUTS/capstone/api-rate-limiting-tickets.md

Does the ticket pipeline cover every requirement in the PRD? Are the acceptance criteria testable by QA without needing to ask you questions?
```

If the audit passes, you have completed the Technical Infrastructure track.

---

## Next Steps
Proceed to Module 10.3 to lock in the mental models:
```
/start-m10-3
```
