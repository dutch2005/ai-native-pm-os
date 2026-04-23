#!/usr/bin/env python3
"""
AI-Native PM OS — Course Server
Serves the course web UI at http://localhost:4242
No pip installs required — uses Python stdlib only.

Usage:
  python3 course-server.py                  # student mode (default)
  python3 course-server.py --profile test   # test/creator mode
"""

import json
import sys
import threading
import webbrowser
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path
from urllib.parse import parse_qs, urlparse

COURSE_ROOT = Path(__file__).parent
PORT = 4242

# Profile determines which progress file and output folder to use.
# Default: "student"  |  Creator testing: "test"
PROFILE = "student"
for i, arg in enumerate(sys.argv[1:]):
    if arg == "--profile" and i + 1 < len(sys.argv[1:]):
        PROFILE = sys.argv[i + 2]

PROGRESS_FILE = COURSE_ROOT / ("progress.json" if PROFILE == "student" else f"progress.{PROFILE}.json")
OUTPUTS_DIR = "CLAUDE-OUTPUTS" if PROFILE == "student" else f"CLAUDE-OUTPUTS-{PROFILE}"
COURSE_MODE_FILE = COURSE_ROOT / ".course-mode"

MODULE_TITLES = {
    "module-0": "Module 0 — Setup & Orientation",
    "module-1": "Module 1 — CLAUDE.md Mastery",
    "module-2": "Module 2 — File & Memory Operations",
    "module-3": "Module 3 — PRDs & Specs",
    "module-4": "Module 4 — Data & Analytics",
    "module-5": "Module 5 — Research & Discovery",
    "module-6": "Module 6 — Stakeholder & Strategy",
    "module-7": "Module 7 — MCP & Tool Integrations",
    "module-8": "Module 8 — Team Workflows",
    "module-9": "Module 9 — Vibe Coding for PMs",
    "module-10": "Module 10 — Capstone Project",
}

LESSON_ORDER = [
    "module-0/0-1-install-and-setup.md",
    "module-0/0-2-claude-modes.md",
    "module-0/0-3-build-four-folders.md",
    "module-0/0-4-two-core-files.md",
    "module-0/0-5-slash-commands-and-skills.md",
    "module-0/0-6-connect-first-tool.md",
    "module-0/0-7-pm-ai-mental-model.md",
    "module-0/0-8-token-economics.md",
    "module-1/1-1-claude-md-hierarchy.md",
    "module-1/1-2-what-goes-in-each-layer.md",
    "module-1/1-3-claude-md-templates.md",
    "module-1/1-4-self-improving-claude-md.md",
    "module-1/1-5-team-claude-md.md",
    "module-2/2-1-read-write-reference-files.md",
    "module-2/2-2-learning-companion.md",
    "module-2/2-3-sub-agents-parallel-tasks.md",
    "module-2/2-4-project-memory.md",
    "module-2/2-5-pm-vault-organization.md",
    "module-3/3-1-prd-from-scratch.md",
    "module-3/3-2-multi-perspective-review.md",
    "module-3/3-3-prd-to-ticket-pipeline.md",
    "module-3/3-4-lightweight-specs.md",
    "module-3/3-5-prd-versioning.md",
    "module-4/4-1-connecting-to-data.md",
    "module-4/4-2-narrative-analytics.md",
    "module-4/4-3-retention-churn-analysis.md",
    "module-4/4-4-ab-test-design.md",
    "module-4/4-5-automated-weekly-digest.md",
    "module-5/5-1-interview-synthesis.md",
    "module-5/5-2-support-ticket-mining.md",
    "module-5/5-3-competitive-intelligence.md",
    "module-5/5-4-jtbd-mapping.md",
    "module-5/5-5-discovery-memo.md",
    "module-6/6-1-opportunity-sizing.md",
    "module-6/6-2-roadmap-reasoning.md",
    "module-6/6-3-executive-narrative.md",
    "module-6/6-4-objection-simulation.md",
    "module-6/6-5-qbr-and-strategy-docs.md",
    "module-7/7-1-what-is-mcp.md",
    "module-7/7-2-connecting-jira.md",
    "module-7/7-3-connecting-slack.md",
    "module-7/7-4-connecting-amplitude.md",
    "module-7/7-5-connecting-notion.md",
    "module-7/7-6-connecting-google-workspace.md",
    "module-7/7-7-custom-mcp-servers.md",
    "module-8/8-1-shared-team-claude-md.md",
    "module-8/8-2-decision-log.md",
    "module-8/8-3-shared-context-design.md",
    "module-8/8-4-knowledge-map.md",
    "module-8/8-5-vault-audit.md",
    "module-9/9-1-build-loop.md",
    "module-9/9-2-metrics-dashboard.md",
    "module-9/9-3-research-portal.md",
    "module-9/9-4-interactive-prototypes.md",
    "module-9/9-5-deploy-on-vercel.md",
    "module-10/10-1-choose-capstone.md",
    "module-10/10-2a-capstone-zero-to-one.md",
    "module-10/10-2b-capstone-scale.md",
    "module-10/10-2c-capstone-platform.md",
    "module-10/10-3-four-mental-models.md",
    "module-10/10-4-peer-review.md",
    "module-10/10-5-pm-ai-principles.md",
]


def read_progress():
    if PROGRESS_FILE.exists():
        return json.loads(PROGRESS_FILE.read_text())
    return {"started": None, "current_lesson": None, "lessons": {}}


def write_progress(data):
    PROGRESS_FILE.write_text(json.dumps(data, indent=2))


def build_lesson_tree():
    progress = read_progress()
    lessons_status = progress.get("lessons", {})
    modules = {}
    for path in LESSON_ORDER:
        module = path.split("/")[0]
        filename = path.split("/")[1]
        # Human-readable title from filename
        name = filename.replace(".md", "")
        parts = name.split("-", 2)
        lesson_id = "-".join(parts[:2]) if len(parts) >= 2 else name
        title = parts[2].replace("-", " ").title() if len(parts) > 2 else name
        if module not in modules:
            modules[module] = {
                "title": MODULE_TITLES.get(module, module),
                "lessons": [],
            }
        modules[module]["lessons"].append({
            "path": path,
            "id": lesson_id,
            "title": title,
            "completed": lessons_status.get(path, False),
        })
    return list(modules.values())


class CourseHandler(BaseHTTPRequestHandler):
    def log_message(self, format, *args):
        pass  # suppress default access logs

    def send_json(self, data, status=200):
        body = json.dumps(data).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", len(body))
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(body)

    def send_file(self, path, content_type):
        try:
            content = path.read_bytes()
            self.send_response(200)
            self.send_header("Content-Type", content_type)
            self.send_header("Content-Length", len(content))
            self.end_headers()
            self.wfile.write(content)
        except FileNotFoundError:
            self.send_response(404)
            self.end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_GET(self):
        parsed = urlparse(self.path)
        path = parsed.path
        qs = parse_qs(parsed.query)

        if path == "/" or path == "/index.html":
            self.send_file(COURSE_ROOT / "course-ui" / "index.html", "text/html")

        elif path == "/api/lessons":
            self.send_json(build_lesson_tree())

        elif path == "/api/lesson":
            lesson_path = qs.get("path", [None])[0]
            if not lesson_path:
                self.send_json({"error": "missing path"}, 400)
                return
            # Security: only allow paths within COURSE_ROOT and ending in .md
            safe_path = (COURSE_ROOT / lesson_path).resolve()
            if not str(safe_path).startswith(str(COURSE_ROOT)) or not str(safe_path).endswith(".md"):
                self.send_json({"error": "invalid path"}, 400)
                return
            if safe_path.exists():
                content = safe_path.read_text(encoding="utf-8")
                self.send_json({"path": lesson_path, "content": content})
            else:
                self.send_json({"error": "not found"}, 404)

        elif path == "/api/progress":
            self.send_json(read_progress())

        elif path == "/api/order":
            self.send_json(LESSON_ORDER)

        elif path == "/api/profile":
            self.send_json({
                "profile": PROFILE,
                "progress_file": PROGRESS_FILE.name,
                "outputs_dir": OUTPUTS_DIR,
                "is_test": PROFILE != "student",
            })

        else:
            self.send_response(404)
            self.end_headers()

    def do_POST(self):
        parsed = urlparse(self.path)

        if parsed.path == "/api/progress":
            length = int(self.headers.get("Content-Length", 0))
            body = json.loads(self.rfile.read(length))
            lesson_path = body.get("path")
            completed = body.get("completed", True)
            if not lesson_path:
                self.send_json({"error": "missing path"}, 400)
                return
            data = read_progress()
            if data.get("started") is None:
                import datetime
                data["started"] = datetime.date.today().isoformat()
            data["lessons"][lesson_path] = completed
            data["current_lesson"] = lesson_path
            write_progress(data)
            self.send_json({"ok": True, "lessons": data["lessons"]})
        else:
            self.send_response(404)
            self.end_headers()


def main():
    # Write .course-mode so Claude reads the active profile at session start
    COURSE_MODE_FILE.write_text(PROFILE)

    # Auto-create a fresh progress file for non-student profiles
    if PROFILE != "student" and not PROGRESS_FILE.exists():
        import json as _json
        data = {"started": None, "current_lesson": None, "lessons": {l: False for l in LESSON_ORDER}}
        PROGRESS_FILE.write_text(_json.dumps(data, indent=2))

    server = HTTPServer(("localhost", PORT), CourseHandler)
    url = f"http://localhost:{PORT}"
    mode_label = f"[{PROFILE.upper()} MODE]" if PROFILE != "student" else ""
    print(f"\n  AI-Native PM OS — Course UI  {mode_label}")
    print(f"  Profile  : {PROFILE}")
    print(f"  Progress : {PROGRESS_FILE.name}")
    print(f"  Outputs  : {OUTPUTS_DIR}/")
    print(f"  Running at {url}")
    print(f"  Press Ctrl+C to stop\n")
    threading.Timer(0.5, lambda: webbrowser.open(url)).start()
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n  Server stopped.")
        # Reset .course-mode to student on clean exit
        if PROFILE != "student":
            COURSE_MODE_FILE.write_text("student")


if __name__ == "__main__":
    main()
