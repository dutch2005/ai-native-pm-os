# Module 3.5 — PRD Versioning: Track Changes, Own the History

**Time:** ~25 minutes  
**Outcome:** A versioning system that makes every change to a PRD traceable, reversible, and audit-ready

---

## Why PRD Version Control Matters

Three months after a feature ships, you get asked:
- "Why did we cut the parallel approval mode?"
- "When did the scope change from enterprise to all plans?"
- "Who approved this version and when?"

Without version control, those questions take hours to answer. With it, you answer in 30 seconds.

---

## The Versioning Convention

Adopt this naming system across all output documents:

```
[feature-name]-[doc-type]-v[major].[minor]-[status].md

Examples:
approval-routing-prd-v1.0-draft.md
approval-routing-prd-v1.1-review.md
approval-routing-prd-v2.0-approved.md
approval-routing-prd-v2.1-post-review.md
```

**Version logic:**
- `v1.0` → First full draft, never seen by stakeholders
- `v1.1` → Minor edit (clarification, wording change)
- `v2.0` → Major change (scope reduction, new section added, persona changed)
- Status: `draft` → `review` → `approved` → `archived`

---

## Auto-Generating a Changelog

After every major PRD revision, run this:

```
Compare these two files and generate a changelog:
- Old version: CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.1-review.md
- New version: CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md

Changelog format:

## [v2.0] — Approved — [today's date]

### Added
- [New sections or requirements added]

### Changed  
- [Sections that were modified — describe what changed, not just where]

### Removed
- [Scope, features, or requirements that were cut]

### Fixed
- [Errors or inconsistencies corrected]

### Decision Context
- [Why the major version bump? What triggered the change?]

Append the changelog to the end of CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md 
under a "## Changelog" heading.
```

---

## The Review Handoff Protocol

When sending a PRD for review, generate a cover note automatically:

```
Read CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md.

Write a review handoff note for Tara Novak (CTO):

Subject: PRD Review Request — Approval Routing v2.0

The note should include:
1. What's changed since the last version she saw (v1.1)
2. The specific sections she should focus on (not the whole doc)
3. The 2 decisions I most need her input on
4. Deadline for feedback
5. How to give feedback (comment format, or return marked up)

Length: 100 words max. Tara doesn't read long emails.
Format as a Slack-ready message (no subject line in the body).
Save to: CLAUDE-OUTPUTS/stakeholder-comms/prd-review-request-tara.md
```

---

## Version Archive Protocol

When a PRD is superseded, archive it cleanly:

```bash
# Create archive structure
mkdir -p CLAUDE-OUTPUTS/prds/_archive

# Move old versions to archive (keep only the current approved version in main folder)
mv CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.0-draft.md CLAUDE-OUTPUTS/prds/_archive/
mv CLAUDE-OUTPUTS/prds/approval-routing-prd-v1.1-review.md CLAUDE-OUTPUTS/prds/_archive/

echo "Archive complete. Active version: approval-routing-prd-v2.0-approved.md"
```

**Rule:** Only the current approved version stays in the main `prds/` folder. All prior versions go to `_archive/`. Claude can still reference archived versions if asked, but they won't appear in normal queries.

---

## Git for PRD Versioning (Optional but Recommended)

If your team uses Git already, this is the gold standard:

```bash
# Initialize Git in your PM OS folder (if not already done)
cd "/Users/vishal/Documents/Linkedin/Product Managers/AI-Native-PM-OS"
git init

# Track PRDs with meaningful commit messages
git add CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md
git commit -m "feat: approval routing PRD v2.0 approved

- Removed parallel approval mode from V1 scope (defer to V2)
- Added OOO routing handling per Tara's review feedback  
- Updated success metrics to align with Q2 OKR KR1
Approved by: Dev Kapoor"
```

Now `git log CLAUDE-OUTPUTS/prds/approval-routing-prd-v2.0-approved.md` shows you every change and who approved it.

---

## Hands-On Exercise

**Task:** Apply this module's workflow to your own product.
1. Copy the primary prompt or workflow from this lesson.
2. Replace the "Meridian" context with your actual company, product, or feature context.
3. Run the prompt in Claude Code and evaluate the output.
4. Save the generated artifact to your `CLAUDE-OUTPUTS` folder.

---

## Module Checkpoint

- [ ] Naming convention applied to all PRDs in CLAUDE-OUTPUTS/prds/
- [ ] Changelog generated for at least one version transition
- [ ] Review handoff note generated for the CTO
- [ ] Archive folder created and old versions moved

---

## Module 3 Complete ✅

You now have the full PRD pipeline:
- 3-1: 5-stage PRD workflow (seed → draft → critique → polish)
- 3-2: Multi-perspective review (engineer / designer / exec)
- 3-3: PRD → ticket pipeline (acceptance criteria + edge cases)
- 3-4: Lightweight specs (right-sizing to decision risk)
- 3-5: Versioning and change tracking

**Start Module 4:**
```
/start-m4-1
```

*Module 4: Data & Analytics — connecting to live data and building insight pipelines.*
