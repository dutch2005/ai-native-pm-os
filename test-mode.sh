#!/bin/bash
# Start the course in TEST MODE
# Your data: progress.test.json + CLAUDE-OUTPUTS-test/
# Student data: progress.json + CLAUDE-OUTPUTS/  (untouched)
echo ""
echo "  Starting in TEST MODE"
echo "  Progress → progress.test.json"
echo "  Outputs  → CLAUDE-OUTPUTS-test/"
echo "  Student data is not touched."
echo ""
cd "$(dirname "$0")"
python3 course-server.py --profile test
