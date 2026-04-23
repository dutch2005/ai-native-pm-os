# Module 8.3 — Shared Context: PM × Design Collaboration

**Time:** ~30 minutes  
**Outcome:** A shared context document that ends the "I thought you wanted X" cycle between product and design

---

## The PM/Design Handoff Problem

Most PM-to-Design handoffs look like this:
1. PM writes a PRD
2. PM schedules a 30-minute sync to "walk through" the PRD
3. Designer asks 15 questions the PRD didn't answer (mostly about edge cases)
4. Designer builds mocks
5. PM reviews mocks and says "Wait, that's not what I meant"

The problem is the PRD is a PM-centric document. It focuses on business logic and state. Designers need user context, constraints, and visual hierarchy. 

The Shared Context Document bridges this gap.

---

## The Shared Context Document

This is not a replacement for a PRD. It is a translation layer between the PRD and the design file.

Create this template:

```bash
cat > TEMPLATES/design-context-template.md << 'EOF'
# Design Context: [Feature Name]

**PM:** [Name] | **Designer:** [Name]
**PRD Link:** [Link or local path]
**Target Design Review:** [Date]

---

## The User's Emotional State
*When the user interacts with this feature, what is their emotional state?*
*(e.g., Frustrated because something broke? Anxious because they are spending money? Rushed because it's a Friday afternoon?)*

## Visual Hierarchy
*What is the #1 most important thing the user must see or do on this screen?*
*What are the secondary actions?*
*What should be deprioritized or hidden?*

## Key Constraints
*Technical or business constraints that limit design freedom.*
*(e.g., "We must use the existing date picker component," or "This must load in under 2 seconds, so avoid heavy animations")*

## The "Unhappy Path" Inventory
*What happens when things go wrong?*
1. [Error state 1: e.g., Network timeout]
2. [Error state 2: e.g., Validation failure]
3. [Empty state: e.g., No data to show yet]

## Competitive References
*Links/screenshots of how others solve this (both direct competitors and out-of-industry).*
1. [Link/Image] — What we like: [Reason]
2. [Link/Image] — What we hate: [Reason]
EOF
echo "Design context template created"
```

---

## Generating the Context Document from a PRD

Let Claude do the translation work:

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md.

Generate a Design Context Document based on this PRD, using the template format 
from TEMPLATES/design-context-template.md.

For "The User's Emotional State": Infer this from the problem statement and JTBD.
For "Visual Hierarchy": Determine this based on the core user story.
For "The Unhappy Path Inventory": Extract every edge case or error state mentioned in the PRD.

Flag any sections where the PRD lacks enough detail to inform the design (e.g., if we didn't specify what the empty state should look like).

Save to: CLAUDE-OUTPUTS/design-context/approval-routing-design-brief.md
```

---

## The Pre-Review Critique

Before you sit down for a design review with your designer, have Claude simulate the review. This prepares you to give structural, not just visual, feedback.

```
I am reviewing early design mocks for the Approval Routing feature tomorrow.

Read:
- CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md
- CLAUDE-OUTPUTS/design-context/approval-routing-design-brief.md

Generate a "Design Review Checklist" for me. What 5 specific questions 
must I ask during the review to ensure the design meets the product requirements?

Focus on interaction models, edge case coverage, and constraints, 
NOT color or typography.

Example of a good question: "If the user selects a backup approver who is ALSO out of office, how does the UI communicate that loop?"
```

---

## Syncing Figma with Claude (Advanced Workflow)

If your team uses Figma, you can create a bridge between your PM OS and the design files.

**Option 1: The Figma Comments MCP (If available in your org)**
Use a custom or community Figma MCP server to pull comments directly from the design file into your PM OS for tracking.

**Option 2: The Markdown Sync (No MCP required)**
Have your designer paste the URL of the finalized Figma frames into the Design Context document.

```
Update CLAUDE-OUTPUTS/design-context/approval-routing-design-brief.md.

Add a new section at the top: "Finalized Mocks"
Add this URL: https://figma.com/file/example-link-to-approval-routing
Change the status from "Draft" to "Ready for Engineering"
```

This ensures the engineering tickets (which reference this context document) always point to the single source of truth for the design.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Design Context Template created in TEMPLATES/
- [ ] Design Context Document generated from an existing PRD
- [ ] Pre-Review Critique checklist generated
- [ ] You understand the difference between PRD content and Design Context content

---

## Next: Module 8.4
The "Who Knows What" Map — mapping your organization's informal knowledge graph.

```
/start-m8-4
```
