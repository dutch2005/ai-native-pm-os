# Module 9.3 — Build a Research Portal: Making Insights Browsable

**Time:** ~40 minutes  
**Outcome:** A searchable, filterable internal site for all your discovery research and JTBD mapping

---

## The Problem with Docs in Folders

You've done the work in Module 5. You have interview syntheses, support ticket analyses, and JTBD maps. But when Sales asks, "Why did we decide not to build X?", you still have to dig through markdown files to find the answer.

The solution: Turn your markdown files into a browsable Research Portal using Claude.

---

## The Build Prompt: The Research Portal

This prompt asks Claude to build a single-page application (SPA) that reads your existing markdown files and displays them in a clean, filterable UI.

```
Build a "Meridian Research & Discovery Portal".

This should be a single HTML file (with inline CSS/JS) that acts as an internal 
tool for our team to browse product research.

VISUALS:
- Clean, academic/professional aesthetic (think Notion or ReadMe)
- Sidebar navigation on the left, content area on the right
- Typography: Inter (headings), system sans-serif (body)

FEATURES:
1. Sidebar Categories:
   - Interviews (Q1, Q2)
   - Support Signals (Monthly)
   - Competitive Intel
   - JTBD Maps
   
2. Content Area:
   - Default state: A dashboard showing "Recent Insights" (3 summary cards)
   - When a sidebar item is clicked, it should render the content for that item.

3. The Data Source:
   - Create a mock Javascript object inside the file that contains the text from:
     - The JTBD map (from Module 5.4)
     - The OOO vs Bulk Approval discovery memo (from Module 5.5)
     - The March support ticket signals (from Module 5.2)

4. Search:
   - A simple text input at the top of the sidebar that filters the available documents.

Build it. Save to: CLAUDE-OUTPUTS/prototypes/research-portal-v1.html
```

---

## The Iteration Loop (Feedback)

Open the file in your browser. It will likely look functional but basic. Let's make it look like a premium internal tool.

**Prompt 1 (Styling & Layout):**
```
The portal works, but it looks a bit plain. 
1. Add a subtle gray background (#F9FAFB) to the sidebar and a white background to the content area with a soft drop shadow separating them.
2. Make the currently active sidebar item bold with a subtle left border highlight (color: #2563EB).
3. In the content area, ensure markdown-style elements (headings, lists, bold text) have proper spacing and typography. Headings should be dark gray (#111827).
```

**Prompt 2 (Interactivity):**
```
Let's add a "Tagging" system. 
1. Add tags to the mock data objects (e.g., "Enterprise", "Activation", "Churn Risk").
2. Display these tags as small pills at the top of the content area when a document is viewed.
3. Make the tags clickable — clicking a tag should filter the sidebar to only show documents with that tag.
```

---

## Bridging Markdown to the Portal (Advanced)

Right now, the data is hardcoded in the HTML file. In a real workflow, you want the portal to automatically read the markdown files you generate in `CLAUDE-OUTPUTS/research/`.

Because of browser security (CORS), a local HTML file cannot easily read local markdown files without a local server.

Here is how you handle it with Claude:

```
I want this portal to read actual markdown files from a server, not use hardcoded data.

1. Rewrite research-portal-v1.html to fetch a file called "research-index.json" on load.
2. The UI should dynamically build the sidebar based on the contents of that JSON.
3. When an item is clicked, it should fetch the specific .md file referenced in the JSON and render it (you can use the marked.js CDN library for markdown parsing).

Save as: CLAUDE-OUTPUTS/prototypes/research-portal-v2.html
```

Then, use a simple Python server to view it:
```bash
cd CLAUDE-OUTPUTS/prototypes/
python3 -m http.server 8000
# Open localhost:8000/research-portal-v2.html in your browser
```

---

## The "Weekly Publish" Routine

Once the portal is built, updating it becomes a Cowork routine:

```
In Claude Desktop → Cowork:

Create a task: "Update Research Portal Index"
Schedule: Every Friday at 5 PM

Instructions:
1. Scan CLAUDE-OUTPUTS/research/ for any new markdown files created this week.
2. Update the research-index.json file to include the new files, categorizing them appropriately based on their content.
3. Generate a brief summary of the new additions.
```

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Research portal V1 generated and previewed
- [ ] UI refined through at least one feedback loop
- [ ] Search or tagging functionality added
- [ ] You understand how to serve local files using Python to test fetch requests

---

## Next: Module 9.4
Build an interactive feature prototype — creating a click-through demo for your next PRD review.

```
/start-m9-4
```
