# Module 9.4 — Build an Interactive Feature Prototype

**Time:** ~45 minutes  
**Outcome:** A clickable, interactive prototype of the "OOO Approval Routing" feature to use in design reviews or stakeholder presentations.

---

## Why Interactive Prototypes Beat Mocks

Static mocks (Figma) are great for visual alignment. But they fail at interaction logic. When a user clicks a button, does a modal appear? Does the state change immediately? What happens if they click "Cancel"?

Explaining these flows in a PRD takes pages of text. Showing them in an interactive HTML prototype takes 3 seconds.

This module teaches you to build "Logic Prototypes" — interfaces that look decent but primarily exist to prove the interaction flow works before engineering builds it.

---

## The Seed Prompt: OOO Routing Prototype

We will build a prototype for the OOO Routing feature we spec'd in Module 3.4.

```
Build an interactive prototype for Meridian's "Out of Office Approval Routing" feature.
It must be a single HTML file with inline CSS and Vanilla JS. No frameworks.

VISUAL AESTHETIC:
- Clean B2B SaaS look (white background, subtle borders, system fonts)
- Professional blue accent color (#2563EB) for primary actions
- Use standard UI patterns (cards, toggles, simple modals)

THE SCENARIO:
The user is viewing their "Approval Settings" page. They want to turn on OOO routing.

REQUIRED UI ELEMENTS:
1. A main "Approval Settings" card.
2. A toggle switch: "Out of Office Routing (Currently: OFF)"
3. When the toggle is clicked ON, a setup panel should expand smoothly below it.

SETUP PANEL REQUIREMENTS:
- Date picker (simple text inputs for Start Date and End Date are fine for the prototype).
- A dropdown to select a "Backup Approver" (Mock options: Sarah Lin, David Chen, Tara Novak).
- A checkbox: "Apply to all workflows where I am the primary approver."
- "Save" and "Cancel" buttons.

INTERACTION LOGIC (Must work):
- If the user clicks "Cancel", the panel collapses and the toggle flips back to OFF.
- If the user clicks "Save" without selecting a Backup Approver, show a red error message: "Please select a backup approver."
- If the user clicks "Save" with valid inputs, collapse the panel, change the toggle text to "Out of Office Routing (Currently: ON)", and show a green success toast notification for 3 seconds.

Build the complete functional prototype. Save to: CLAUDE-OUTPUTS/prototypes/ooo-routing-prototype.html
```

---

## The Iteration Loop

Open the prototype in your browser. Try to break it.

**Feedback 1 (Handling Edge Cases):**
```
The prototype is good, but we missed an edge case from the PRD.
What if the selected Backup Approver is ALSO out of office?

Add this logic:
1. Hardcode "David Chen" to be currently out of office.
2. If the user selects "David Chen" from the dropdown, immediately show a warning message below the dropdown: "⚠️ David Chen is currently Out of Office until [Date]."
3. Do not block the user from saving (they might know David is coming back), but make the warning clear.
```

**Feedback 2 (State Persistence Simulation):**
```
Let's make it feel more real. When the OOO Routing is ON, the setup panel is hidden. 
But the user needs to know *who* they selected as the backup.

Change the logic:
When OOO is ON, display a small summary below the toggle: 
"Routing to [Selected Name] from [Start Date] to [End Date]. [Edit button]"

Clicking the [Edit button] should reopen the setup panel with their previous selections populated.
```

---

## Using Prototypes in Meetings

When you bring this to a design review:
1. **Don't talk about the colors.** Preface the meeting with: "This is a logic prototype. We are reviewing the interaction flow and state changes, not the visual design."
2. **Let them drive.** Send the HTML file (or a Vercel link, see Module 9.5) and say, "Try to set up OOO routing." Watch where they get stuck.
3. **Capture gaps instantly.** When they ask, "What if I only want to delegate specific workflows, not all of them?" you realize a gap in your spec. You can then prompt Claude: `Add a radio button selection: "Apply to all workflows" vs "Select specific workflows (shows a mock list)".`

---

## When NOT to use this workflow

- **Complex visual animations:** If the success of the feature depends on a highly specific, complex animation sequence, stick to Figma/Protopie.
- **Full application builds:** Don't try to build the entire Meridian app in one file. Build isolated, single-feature flows.
- **Production code:** Never hand this HTML to an engineer and say "use this." It is throwaway code designed for fast learning.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Interactive OOO prototype generated and previewed
- [ ] At least one edge case (like the unavailable backup) added via prompt
- [ ] State persistence (viewing settings when ON) added
- [ ] You can articulate the difference between a visual mock and a logic prototype

---

## Next: Module 9.5
Deploy to Vercel — putting your prototypes on the public internet so anyone can test them.

```
/start-m9-5
```
