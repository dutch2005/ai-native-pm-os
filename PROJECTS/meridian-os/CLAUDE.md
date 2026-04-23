# Meridian OS — CLAUDE.md (Project Level)

## About This Product
Meridian OS is a B2B no-code workflow orchestration platform for operations teams at mid-market companies (50–500 employees). We replace manual approval chains, escalations, and fragmented ops processes with automated workflows that connect existing SaaS tools.

**Stage:** Series B | **ARR:** $4.2M | **Growth:** 80% YoY | **Customers:** 142 | **NRR:** 118%

## Primary Users
- **Marcus Rodriguez** (Operations Manager): Builds and maintains workflows. Pain: rebuilds from scratch when tools change. Goal: one place to build, monitor, and maintain all workflows.
- **Olivia Chen** (VP of Operations): Reviews workflow health. Pain: 4 hours/week on manual status reporting. Goal: real-time visibility without chasing people.
- **Asha Patel** (Finance Analyst): Submits approval requests. Pain: manual approval routing, no OOO logic. Goal: automated conditional routing with visibility.

## Buyers vs. Users
- **Buyer:** VP of Operations (Olivia) — signs the contract
- **Champion:** Operations Manager (Marcus) — drives internal adoption
- **End user:** Finance Analysts, Department heads who submit through workflows

## Terminology (use exactly these words)
- "Workflow node" = individual step in a workflow (NEVER "block", "step", "action")
- "Connector" = external tool integration (NEVER "plugin", "integration", "extension")
- "Orchestration run" = one complete workflow execution (NEVER "execution", "run instance")
- "Routing sequence" = ordered list of approvers in a conditional workflow (NEVER "approval chain")
- "ORR" = Orchestration Run Rate — weekly workflow executions across all customers
- "Trigger" = event that starts a workflow (use "webhook" only in technical engineering docs)

## Internal Stakeholders
| Name | Role | Cares About | Frame As |
|------|------|------------|----------|
| Dev Kapoor | CEO | ARR, growth, market share | Lead with a number (ARR impact or customer count) |
| Tara Novak | CTO | Engineering velocity, debt | Frame in effort (sprint weeks) and risk |
| James Whitfield | CFO | ROI, payback period, burn | Lead with payback timeline and math |
| Priya Singh | Head of Design | User evidence, UX quality | Show research before proposing solutions |
| Rohan Mehta | Head of Sales | Deal velocity, objection removal | Frame as "closes deals" or "removes X objection" |

## Q2 OKRs (Current)
**Objective 1: Accelerate enterprise time-to-value**
- KR1: Reduce median activation time 14 days → 7 days (current: 11 days)
- KR2: Increase 30-day workflow creation rate 60% → 85% (current: 67%)
- KR3: Ship 3 enterprise connector templates by June 30 (1 shipped)

**Objective 2: Grow ARR to $5M by June 30**
- KR4: $400K net new ARR from enterprise (current: $180K)
- KR5: Maintain NRR above 115% (current: 118% ✅)

## Core Metric
**ORR (Orchestration Run Rate):** 91,200 runs/week (↑8.6% WoW, ↑67% YoY)
Target: 150,000 runs/week by Q4

## Active Roadmap (Q2)
| Feature | Status | Sprint |
|---------|--------|--------|
| Conditional Approval Routing v1 | Active Dev | 16 |
| Enterprise Onboarding Templates | In Progress | 15 |
| Dashboard v2 — Operational Overview | Scoping | 18 |
| Connector Hub | Design | 19 |

## Competitors
- **Zapier:** SMB-focused, no conditional approval logic, brand advantage
- **Make.com:** Power users, complex UI, steep learning curve
- **ServiceNow:** Enterprise trust, expensive, IT-owned (not ops-team-owned)
- **Monday Automations:** Existing customer base, limited conditional logic

## File Structure
- Raw research → PROJECTS/meridian-os/research/
- Analytics exports → PROJECTS/meridian-os/analytics/
- All Claude outputs → CLAUDE-OUTPUTS/
- Templates → TEMPLATES/

## Current Sprint Focus (update weekly)
Sprint 15–16 focus:
1. Finalize Approval Routing v1 PRD for Tara's engineering review
2. Synthesize March enterprise interview batch (8 transcripts pending)
3. Draft Q2 board narrative for Dev
