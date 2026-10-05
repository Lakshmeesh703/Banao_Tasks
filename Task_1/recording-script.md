# Three-minute recording script

1. Start with `python3 vireo_digest.py` and open `vireo_dashboard.html`. Select a week and show the digest plus the Tier 1-only leaderboard.
2. Open `vireo_digest.py`. Explain the prompt decisions: use the policy's 30-day repeat definition; use customer/product/category as a visible proxy; count resolved and auto-closed tickets; exclude Tier 2 warranty.
3. Show `validation.md`: the row count, unique IDs, roster joins, repeat-rate check, and the sampling plan.
4. Say what changed: the first idea was a raw agent ranking and broad keyword sentiment; both were narrowed because the email thread and policy made the comparison unfair and the data did not justify a sentiment claim.
5. Say what was discarded: predictive staffing, customer-level lists, and an external model/API. The final tool is local and reproducible.
