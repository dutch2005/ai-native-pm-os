# Module 9.5 — Deploy on Vercel: From Local File to Shareable URL

**Time:** ~25 minutes (first time: allow 30–40 min for account setup)  
**Outcome:** Your prototype is live on a public URL you can share with stakeholders immediately

---

## Why Deployment Changes Everything

A prototype on your laptop is a conversation starter.  
A prototype on a URL is a deliverable.

When you share a URL with a stakeholder, the cognitive barrier drops to zero. They click, they see, they respond. No "can you share your screen?" No "send me the file." No version confusion.

Vercel makes this straightforward — first time takes ~30 min (account setup + CLI install), subsequent deploys take under 2 minutes.

---

## What Vercel Is

Vercel is a hosting platform purpose-built for front-end deployment. It's free for personal projects, takes seconds to deploy, and generates a shareable URL automatically.

For PM prototypes (HTML, CSS, JS files), it's perfect.

---

## The Deployment Flow

```
Your CLAUDE-OUTPUTS/prototypes/ folder
              ↓
    Initialize a local Git repo
              ↓
    Connect to Vercel (one-time setup)
              ↓
    Deploy with: vercel --prod
              ↓
    Get URL: https://your-project.vercel.app
              ↓
    Share with stakeholders
```

---

## Prerequisites Check

Before starting, verify you have:
```bash
node --version   # Should be v20 or higher (v24 is current default)
git --version    # Any recent version
npm --version    # Comes with Node.js
```

If Node.js isn't installed or is below v20: download from [nodejs.org](https://nodejs.org) (LTS version).

**Vercel account:** If you don't have one, go to [vercel.com](https://vercel.com) and sign up (free tier is fine for prototypes) — do this before running the CLI steps below.

---

## Step-by-Step: Deploy Your Metrics Dashboard

### Step 1: Prepare your prototype folder

Make sure your prototype has an `index.html`:
```bash
# If your main file is named differently:
cp CLAUDE-OUTPUTS/prototypes/metrics-dashboard-v3.html CLAUDE-OUTPUTS/prototypes/index.html
```

### Step 2: Install Vercel CLI
```bash
npm install -g vercel@latest
```
> Always install `vercel@latest` — the CLI is at v52+ and older versions had breaking changes that cause confusing errors.

### Step 3: Initialize a Git repo in your prototypes folder
```bash
cd CLAUDE-OUTPUTS/prototypes
git init
git add index.html
git commit -m "feat: Meridian metrics dashboard v1"
```

### Step 4: Deploy
```bash
vercel
```

You'll be prompted to:
- Log in with your Vercel account (opens a browser window for authentication)
- Set project name: `meridian-metrics-dashboard`
- Confirm settings (accept defaults)

> **Windows users:** If the `vercel` command isn't found after install, restart your terminal. If `open` commands in examples don't work, use `start` instead (e.g., `start index.html`).

Vercel will give you a URL like: `https://meridian-metrics-dashboard.vercel.app`

### Step 5: For production (clean URL)
```bash
vercel --prod
```

---

## What Claude Builds That Deploys Well

| Prototype Type | Deploy as | Module |
|---------------|----------|--------|
| Metrics dashboard | `index.html` | 9.1–9.2 |
| Research portal | Multi-page HTML | 9.3 |
| Stakeholder update | Single-page HTML | 9.4 |
| Decision log viewer | HTML + inline JSON | 8.3 |

---

## Optional: Configuration for Non-Standard Deployments

For simple `index.html` prototypes, no config file is needed — Vercel's defaults work.

If you need more control (serving from a subfolder, adding redirects, setting headers), Vercel uses `vercel.ts` as its config standard:

```bash
npm install -D @vercel/config
```

```typescript
// vercel.ts
import { type VercelConfig } from '@vercel/config/v1';

export const config: VercelConfig = {
  // Example: serve from a subfolder
  // rewrites: [{ source: '/(.*)', destination: '/dist/$1' }],
};
```

For pure HTML prototypes, you won't need this. It's here for when your prototype grows into something more complex.

---

## Sharing with Stakeholders

Once deployed, you can share the URL directly or embed it:

**For Slack:**
```
Hey Priya — here's the first prototype of the metrics dashboard for Olivia's team.
Would love 5 minutes of feedback on the layout before I refine it further.
https://meridian-metrics-dashboard.vercel.app
```

**For Notion:** Paste the URL on a page — Notion will auto-embed it if the page allows iframes.

**For email:** The URL works anywhere. No attachments, no compatibility issues.

---

## Updating After Feedback

The real power: you get feedback, make changes in Claude Code, re-deploy in seconds.

```bash
# After iterating in Claude Code:
cd CLAUDE-OUTPUTS/prototypes
git add index.html
git commit -m "fix: increase WoW metric font size per Priya feedback"
vercel --prod
```

Same URL. New version. Stakeholders refresh and see the update.

This is the PM build loop at speed.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Vercel CLI installed
- [ ] `index.html` deployed and accessible at a Vercel URL
- [ ] You've shared the URL with at least one person (or saved it for a future stakeholder)
- [ ] You know how to re-deploy after making changes

---

## Next: Module 9.6
When to build vs. when to spec — the PM's decision framework.

```
/start-m9-6
```
