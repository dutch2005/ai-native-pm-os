# /complete

Mark the current lesson as done and update progress.

## Steps

1. Read `progress.json`
2. Get `current_lesson` from the JSON
3. If no current lesson: ask "Which lesson did you just finish? (e.g. 3-1)"
4. Set that lesson's value to `true` in the `lessons` object
5. Write the updated `progress.json`
6. Count total complete: X / 62
7. Respond:
   "✅ Lesson [id] marked complete. You're at X / 62 lessons ([Y]%).

   **Before starting the next lesson**, type `/compact` to summarize this session.
   This keeps your context small and your token costs low — each lesson should
   ideally run with a fresh or compacted context.

   Then type `/next` to load the next lesson, or `/progress` to see the full map."
