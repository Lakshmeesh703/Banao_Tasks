# Vireo Audio Support Digest

A small, local, dependency-free tool that turns the supplied support CSV export into a weekly digest, a Tier 1 agent leaderboard, a business memo, and reproducible validation evidence.

## Requirements

- Python 3.8 or newer
- The supplied CSV files, `support-policy.pdf`, and `email-thread.txt` in this directory
- No Python packages, API keys, model account, or internet connection required

## Run

From this directory:

```bash
./run_vireo.sh
```

The launcher runs the analysis and opens the dashboard in Chrome or the available system browser. To generate the files without opening a browser:

```bash
python3 vireo_digest.py
```

## Outputs

- `vireo_dashboard.html`: select a week to view ticket volume, repeat contacts, issue signals, and the Tier 1 leaderboard.
- `memo-to-priya.md`: one-page non-technical memo for Priya Raman.
- `validation.md`: reproducible checks, method, limitations, and a spot-check plan.
- `content.md`: spoken content for a screen recording of three minutes or less.

## What the tool measures

The repeat-contact measure follows the supplied policy's 30-day definition. Because the export has no issue ID, the tool uses `customer_id + product_sku + category` as a visible same-issue proxy. A later ticket is flagged when it starts within 30 days after the prior matching ticket was resolved.

The business goal is to reduce the completed-ticket repeat-contact rate from 11.88% to 9.50%. In this extract, that is approximately 283 fewer contacts and Rs 39,656 in avoided contact cost, using the policy's Rs 290 blended contact cost.

The leaderboard counts resolved and auto-closed tickets for Tier 1 agents only. Escalations & Warranty is excluded because the policy says Tier 2 work is measured in resolution days, not weekly ticket volume.

## Verification

After running the launcher, check `validation.md`. The current source export produces:

- 12,528 ticket rows parsed
- 11,884 completed tickets
- 1,412 repeat contacts
- 11.8815% repeat rate
- 1,119 SLA breaches
- 1,241 internal transfers
- 653 duplicate ticket IDs surfaced as a migration/re-import data-quality warning

The duplicate IDs are retained rather than silently removed because the email thread warns that legacy tickets may appear under both source systems. The repeat proxy should be spot-checked weekly by labeling 20 flagged and 20 unflagged tickets.

## Scope decisions

The tool intentionally does not predict staffing, expose customer-level action lists, automate refunds, or call an external AI model. Those additions would increase operational and privacy risk without being needed for a first weekly operating rhythm.

The supplied workspace did not contain the official `submission-form.md` template. A completed submission summary is included at `submission-form.md`; replace it with the official template if the invitation provides one.
