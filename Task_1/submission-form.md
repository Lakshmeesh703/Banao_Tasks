# Submission Form

> The supplied workspace did not contain the official submission-form template. This completed summary records the requested submission information without inventing the missing form's original field names.

## Applicant Deliverable

**Project:** Vireo Audio Support Digest

**Working tool:** `vireo_digest.py`, launched with `./run_vireo.sh`

**Runtime:** Python 3.8+; no third-party packages, API keys, or internet connection required.

## Business Goal

Reduce the completed-ticket repeat-contact rate from **11.88% to 9.50%**.

In the supplied extract, this means approximately 283 fewer contacts and **Rs 39,656** in avoided contact cost, using the policy's Rs 290 blended cost per contact. This is approximately **Rs 6,609 per quarter** when annualised from the 18-month extract.

## Evidence That It Works

- 12,528 ticket rows parsed.
- 11,884 completed tickets.
- 1,412 repeat contacts identified.
- Repeat rate reproduced as 11.8815%.
- All ticket agent IDs join the roster.
- 1,119 SLA breaches and 1,241 transfers also reported.
- 653 duplicate ticket IDs surfaced as a migration/re-import data-quality warning.
- Validation method and a weekly 20-flag/20-unflagged sampling plan are in `validation.md`.

## Deliverables

- `README.md`: clean-machine setup and usage instructions.
- `vireo_dashboard.html`: weekly digest and Tier 1 leaderboard.
- `memo-to-priya.md`: one-page memo to Priya Raman.
- `validation.md`: reproducibility checks, limitations, and sampling plan.
- `content.md`: screen-recording script under three minutes.
- `run_vireo.sh`: single-command launcher.

## Recording

**Recording content:** `content.md`

The walkthrough covers the prompts and source decisions used, changes between versions, discarded approaches, validation, and the final result. The recording should be made by running `./run_vireo.sh` and narrating the generated dashboard and files.

## AI Tools and Cost

**Tools used:** GitHub Copilot for code generation, analysis, debugging, and documentation; local Python and shell commands for deterministic profiling and verification.

**External model/API cost:** Rs 0. No external model or per-ticket API was used in the final tool.

## Discarded Work and Scope Decisions

- Raw all-agent leaderboard discarded because Tier 2 warranty work must not be compared with Tier 1 by ticket volume.
- Broad sentiment analysis discarded because the supplied data did not justify a validated sentiment claim.
- Predictive staffing, customer-level action lists, automated refunds, and external model integration omitted because they add risk and scope without being required for the first weekly operating rhythm.

## Known Limitation

The repeat flag uses `customer_id + product_sku + category` as a transparent same-issue proxy because the export has no issue ID. A customer returning for a different issue under the same product and category can be falsely flagged; category retagging can cause missed repeats. Weekly sampling is required before using the metric for operational decisions.
