# Module 1.3 — CLAUDE.md Templates by PM Archetype

**Time:** ~35 minutes  
**Outcome:** A complete CLAUDE.md template tuned to your specific PM archetype

---

## Why Archetypes Matter

A B2B SaaS PM and a Consumer PM work completely differently. Their stakeholders, metrics, terminology, and decision frameworks diverge significantly.

Using a generic CLAUDE.md ignores this. This module gives you tailored templates for four major PM archetypes.

Choose the one closest to your current role and adapt it.

---

## Archetype 1: B2B SaaS PM

*You sell to businesses. Your users ≠ your buyers. Retention and expansion matter more than acquisition.*

```markdown
# CLAUDE.md — B2B SaaS PM

## Role
Product Manager, [product area] at [company].
Focus: Retention, expansion revenue, and enterprise feature maturity.

## Product Context
[Company] is a [category] SaaS platform serving [ICP: company size + role].
- ARR: $X | Growth: X% YoY | NRR: X% | Customers: X
- Core metric: Net Revenue Retention (NRR)
- Secondary: Feature adoption rate, time-to-value, support ticket volume

## Key Distinctions
- Buyers ≠ Users: Economic buyer is [title], end user is [title]
- Champion = [role who drives internal adoption]
- Enterprise accounts need: SSO, audit logs, admin controls, SLAs

## Prioritization Lens
1. What reduces churn risk for top 20 accounts?
2. What unblocks expansion in existing accounts?
3. What wins new logos in our ICP?

## Stakeholder Framing
- CEO → frame in ARR, NRR, and new logo metrics
- CTO → frame in engineering effort, technical debt reduction
- Sales → frame in how this closes deals or reduces objections
- CS → frame in ticket reduction, customer health score impact

## Language
- "Customer" not "user" in exec comms (buyers are customers)
- "Expansion revenue" not "upsell"
- "Time-to-value" not "onboarding"
- "Customer health" not "engagement"
```

---

## Archetype 2: Consumer PM

*You serve individual users at scale. Acquisition, activation, and retention loops define your world.*

```markdown
# CLAUDE.md — Consumer PM

## Role
Product Manager, [product area] at [company].
Focus: Growth loops, activation rates, and daily/weekly retention.

## Product Context
[Company] is a [category] consumer app with [DAU/MAU].
- Core metric: DAU/MAU ratio (stickiness)
- Secondary: D7/D30 retention, session length, virality coefficient
- Revenue: [subscription / ads / IAP]

## User Thinking
- Assume users have zero patience for friction
- Onboarding drop-off is the #1 priority in any activation problem
- Every added step = lost users
- Notifications and habit loops are strategic levers, not spam

## Prioritization Lens
1. What reduces drop-off in the activation funnel?
2. What improves Day 7 retention?
3. What creates natural sharing or referral moments?

## Stakeholder Framing
- CEO/CPO → frame in DAU, MAU, and revenue metrics
- Growth team → frame in funnel conversion percentages
- Design → frame in user behavior and friction points
- Marketing → frame in acquisition channel quality

## Language
- "Users" not "customers"
- "Activation" = first meaningful value moment
- "Aha moment" = when user first sees core value
- "Churn" = monthly uninstall or subscription cancellation rate
```

---

## Archetype 3: Platform / Infrastructure PM

*You serve internal developers or external API consumers. Developer experience is your product.*

```markdown
# CLAUDE.md — Platform PM

## Role
Product Manager, [platform/API area] at [company].
Focus: Developer adoption, API reliability, and internal team velocity.

## Product Context
[Company]'s [platform name] serves [internal teams / external developers].
- Core metric: API call volume (growth rate)
- Secondary: Time-to-first-successful-call (T2FSC), developer NPS, documentation coverage
- Revenue: [usage-based / seats / internal cost center]

## Developer Experience Lens
- Docs are the product. Bad docs = bad product.
- Default to API-first design; UI is secondary
- Breaking changes are catastrophic — versioning strategy is non-negotiable
- Developer trust is earned slowly and lost instantly

## Prioritization Lens
1. What is blocking developers from their first successful integration?
2. What reliability or performance issue is causing API failures?
3. What documentation gaps are generating support tickets?

## Stakeholder Framing
- Engineering teams → frame in developer hours saved or unblocked
- External developers → frame in T2FSC and SDK quality
- Business leadership → frame in platform revenue and usage growth

## Language
- "Consumer" = developer who calls your API
- "Contract" = API schema — don't break it
- "Deprecation" = planned removal with migration path (never surprise removal)
- "SLA" = uptime commitment (99.9%, 99.99%, etc.)
```

---

## Archetype 4: API-First / Growth PM

*You work at the intersection of product and growth. Funnels, experiments, and data define your week.*

```markdown
# CLAUDE.md — Growth PM

## Role
Product Manager, Growth at [company].
Focus: Acquisition funnel optimization, activation improvement, referral mechanics.

## Product Context
[Company]'s growth function owns: [acquisition channels] and [activation funnel stages].
- Core metric: New activated users per week
- Secondary: CAC, activation rate, payback period
- Experiments: Run X A/B tests per month

## Growth Thinking
- Every decision is a hypothesis. Every hypothesis needs a success metric.
- Statistical significance matters. Don't call winners early.
- Compound bets: layer multiple improvements for step-change results
- Test the riskiest assumption first

## Experiment Framework
When proposing any change:
1. Hypothesis: "We believe [change] will [outcome] because [reason]"
2. Metric: Primary metric + guardrail metrics
3. Sample size: Minimum to reach 95% confidence
4. Duration: At least 2 business cycles
5. Decision rule: When to ship / kill / iterate

## Language
- "Variant" not "version B"
- "Lift" = percentage improvement in metric
- "Guardrail metric" = metric that must not degrade
- "Holdout" = control group that doesn't receive treatment
```

---

## Hands-On Exercise

1. Identify your current archetype (or the one closest to Meridian's context — that's B2B SaaS)
2. Copy the appropriate template into your project CLAUDE.md
3. Fill in every `[bracket]` with real values from Meridian or your own company
4. Ask Claude to verify your context:
   ```
   Based on my CLAUDE.md, what type of PM am I and what should my 
   top three priorities be this quarter?
   ```

---

## Module Checkpoint

- [ ] You've identified your PM archetype
- [ ] Your project CLAUDE.md uses an archetype-specific template
- [ ] Claude can accurately describe your priorities from your CLAUDE.md alone

---

## Next: Module 1.4
Self-improving CLAUDE.md — using feedback loops to evolve your context over time.

```
/start-m1-4
```
