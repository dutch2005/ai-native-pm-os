# Meridian Company Context

## Company Overview

**Meridian** is a B2B SaaS workflow orchestration platform serving operations teams at mid-market companies (50–500 employees).

Founded in 2021 and based remotely, Meridian raised a $28M Series B in early 2025. Its core product — **Meridian OS** — lets operations teams build no-code workflow automations across their existing SaaS tools, replacing manual approval chains, escalations, and reporting with automated orchestration.

---

## Company Metrics (Current)

| Metric | Value |
|--------|-------|
| ARR | $4.2M |
| YoY Growth | 80% |
| Customers | 142 companies |
| NRR | 118% |
| Employees | 47 |
| Stage | Series B |
| Avg Contract | ~$29,500/year |

---

## Product: Meridian OS

### What It Does
Meridian OS is a no-code workflow builder that lets operations teams:
- Build conditional approval workflows (if/then routing logic)
- Connect existing SaaS tools via pre-built connectors
- Monitor workflow health and execution status in real time
- Generate automated operational reports

### Key Terminology
All PMs must use these exact terms in all documentation:

| Use This | Never Say |
|----------|-----------|
| Workflow node | Block, step, action, element |
| Connector | Plugin, integration, extension |
| Orchestration run | Execution, run, instance |
| Routing sequence | Approval chain, approval flow |
| ORR (Orchestration Run Rate) | Usage rate, execution count |
| Trigger | Webhook (in non-technical contexts) |

### Core Metric
**ORR (Orchestration Run Rate)** — the number of successful workflow executions per week across all customers.

- Current ORR: 84,000 runs/week (up 67% YoY)
- Target ORR: 150,000 runs/week by Q4

---

## Customer Segments

### Segment A: Operations-Led (60% of revenue)
- Profile: 100–300 employee companies, strong ops function
- Primary user: Operations Manager
- Use case: Procurement approvals, headcount requests, expense workflows
- Contract value: $18,000–$35,000/year

### Segment B: Finance-Led (25% of revenue)
- Profile: 200–500 employees, finance-driven approval needs
- Primary user: Finance Manager / Controller
- Use case: Budget approvals, vendor onboarding, invoice routing
- Contract value: $30,000–$60,000/year

### Segment C: Enterprise Pilots (15% of revenue)
- Profile: 500+ employees, complex multi-department workflows
- Primary user: VP of Operations
- Use case: Cross-departmental orchestration, compliance workflows
- Contract value: $80,000+/year

---

## User Personas

### Olivia Chen — VP of Operations
**Company type:** 250-person SaaS company  
**Age:** 38 | **Experience:** 12 years in ops roles

**Day-to-day reality:**
- Manages a team of 6 operations specialists
- Spends 4 hours/week manually compiling status reports across departments
- Fields 15+ Slack messages per day asking for workflow status updates
- Runs 3 weekly sync meetings that exist only to share status information

**Pain points:**
- No single source of truth for operational workflow status
- Approvals bottleneck consistently delays headcount and procurement
- Can't delegate workflow monitoring — it requires too much context

**Goals:**
- Real-time operational visibility without chasing people
- Reduce time in status meetings by 80%
- Scale ops function without adding headcount

**Hiring trigger:** "Our team has doubled and I'm spending more time on coordination than strategy."

**Key quote:** *"I need to know what's stuck before it becomes a fire."*

---

### Marcus Rodriguez — Operations Manager
**Company type:** 180-person e-commerce brand  
**Age:** 31 | **Experience:** 5 years in ops

**Day-to-day reality:**
- Manages 15+ active operational workflows in a mix of Notion, spreadsheets, and Zapier
- Spends 2–3 hours/week fixing broken automations
- Rebuilds workflows from scratch every time a tool changes
- Is the only person who understands how the workflows are structured

**Pain points:**
- Too much time maintaining workflows, not enough time improving them
- Every tool change breaks something downstream
- Can't hand off workflow management — it's all in his head

**Goals:**
- One place to build, monitor, and maintain all workflows
- Mean time to workflow creation: from 2 days to 2 hours
- Workflow logic that's readable by non-technical teammates

**Key quote:** *"I'm the only one who knows how this works, and that terrifies me."*

---

### Asha Patel — Finance Analyst
**Company type:** 400-person B2B software company  
**Age:** 29 | **Experience:** 4 years in finance

**Day-to-day reality:**
- Manages invoice approvals and budget request routing
- Spends 30% of her time in approval month chasing down signatures
- Three approval bottlenecks in Q1 delayed a vendor payment by 3 weeks

**Pain points:**
- Approval routing is manual — she emails each approver one by one
- No visibility into where in the chain a request is stuck
- No escalation logic when approvers are out of office

**Goals:**
- Automated approval routing for all finance workflows
- Real-time visibility into approval status
- OOO escalation handling that doesn't require manual intervention

**Key quote:** *"Approval month kills my week, every month. There has to be a better way."*

---

## Internal Stakeholders

### Dev Kapoor — CEO
**Personality:** High-energy, data-first, fast decision-maker  
**Focus:** ARR growth, market position, competitive differentiation  
**Communication style:** Short, punchy. Three bullets max. Leads with numbers.  

**How to frame for Dev:**
- Lead with ARR impact or customer count
- Use growth rate comparisons (80% YoY, up from X)
- Frame decisions as "win deals" or "lose deals"
- Never: long justifications, process-heavy proposals, technical detail

---

### Tara Novak — CTO
**Personality:** Methodical, technical depth required, allergic to scope creep  
**Focus:** Engineering velocity, technical debt, system reliability  
**Communication style:** Precise. Wants specifics. Doesn't trust vague requirements.  

**How to frame for Tara:**
- Frame in engineering effort (story points or sprint weeks)
- Identify and name the technical risk
- Show what you've already constrained and de-scoped
- Never: "small lift", "just needs a few changes", vague timelines

---

### James Whitfield — CFO
**Personality:** Conservative, ROI-first, payback period focused  
**Focus:** Unit economics, burn rate, customer LTV  
**Communication style:** Financial framing. Wants to see the math.  

**How to frame for James:**
- Lead with payback period and ROI calculation
- Quantify the cost of inaction
- Show your assumptions explicitly
- Never: "strategic value", "brand benefit", anything without a number

---

### Priya Singh — Head of Design
**Personality:** Strong user advocate, evidence-based decision maker  
**Focus:** User experience quality, research grounding  
**Communication style:** Collaborative. Pushes back if research isn't cited.  

**How to frame for Priya:**
- Always lead with user evidence before proposing solutions
- Reference specific quotes or data points
- Acknowledge the user experience trade-offs of your proposal
- Never: "users want X" without source, solution-first framing

---

### Rohan Mehta — Head of Sales
**Personality:** Deal-velocity focused, short feedback loops  
**Focus:** New logos, objection removal, competitive win rate  
**Communication style:** "Does this close deals or doesn't it?"  

**How to frame for Rohan:**
- Frame in "closes deals" or "removes the X objection"
- Use competitive context when relevant (vs. Zapier, Make.com)
- Quantify deal impact where possible
- Never: product roadmap theory, long-term vision without near-term proof

---

## Competitive Landscape

| Competitor | Strengths | Weaknesses | Meridian Advantage |
|------------|-----------|------------|-------------------|
| Zapier | Brand, SMB adoption, 6000+ apps | Not built for approvals, brittle at scale | Approval-native, enterprise reliability |
| Make.com | Visual builder, power users | Complex UI, steep learning curve | Simpler for non-technical ops teams |
| ServiceNow Workflow | Enterprise features, trust | Expensive, slow implementation, IT-owned | Faster time-to-value, ops team-owned |
| Monday Automations | Existing customer base | Limited conditional logic | Deeper routing logic, multi-tool |

---

## Q2 OKRs

**Objective: Accelerate time-to-value for new enterprise customers**

| Key Result | Target | Current |
|-----------|--------|---------|
| KR1: Reduce median activation time | 14 days → 7 days | 11 days |
| KR2: Increase 30-day workflow creation rate | 60% → 85% | 67% |
| KR3: Enterprise connector templates shipped | 3 templates | 1 shipped |

**Objective: Grow ARR to $5M by June 30**

| Key Result | Target | Current |
|-----------|--------|---------|
| KR4: Net new ARR from enterprise segment | $400K | $180K |
| KR5: NRR maintained above 115% | 115% | 118% |

---

## Current Roadmap (Q2 Active)

| Feature | Status | PM Owner | Engineering ETA |
|---------|--------|---------|----------------|
| Conditional Approval Routing v1 | Active Development | [You] | Sprint 16 |
| Dashboard v2 — Operational Overview | Scoping | [You] | Sprint 18 |
| Connector Hub (marketplace) | Design | Priya | Sprint 19 |
| Enterprise Onboarding Templates | In Progress | [You] | Sprint 15 |
| SOC 2 Type II Prep | Engineering-led | Tara | Q3 |

---

*All data is fictional. Meridian is a practice company created for the AI-Native PM OS course.*
