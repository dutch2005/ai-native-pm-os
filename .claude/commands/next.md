# /next

Find and load the next incomplete lesson.

## Steps

1. Read `progress.json`
2. Walk through lessons in order (0-1 → 0-2 → ... → 10-5)
3. Find the first lesson where the value is `false`
4. If found: load it using the same flow as `/lesson [id]`
5. If all lessons are `true`: respond with:
   "🎉 You've completed all 62 lessons! Your AI-Native PM OS is fully operational.
   Consider sharing your capstone artifact or revisiting any module for deeper practice."

## Lesson order
0-1, 0-2, 0-3, 0-4, 0-5, 0-6, 0-7, 0-8,
1-1, 1-2, 1-3, 1-4, 1-5,
2-1, 2-2, 2-3, 2-4, 2-5,
3-1, 3-2, 3-3, 3-4, 3-5,
4-1, 4-2, 4-3, 4-4, 4-5,
5-1, 5-2, 5-3, 5-4, 5-5,
6-1, 6-2, 6-3, 6-4, 6-5,
7-1, 7-2, 7-3, 7-4, 7-5, 7-6, 7-7,
8-1, 8-2, 8-3, 8-4, 8-5,
9-1, 9-2, 9-3, 9-4, 9-5,
10-1, 10-2a, 10-2b, 10-2c, 10-3, 10-4, 10-5
