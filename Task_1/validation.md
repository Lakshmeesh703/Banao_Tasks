# Validation and limits

## Reproducible checks

| Check | Result | Evidence |
|---|---|---|
| ticket rows parsed | PASS | 12528 |
| duplicate ticket IDs surfaced for review | PASS | 653 |
| all agent IDs join roster | PASS |  |
| repeat contacts have a prior completed issue | PASS | 1412 |
| repeat rate | PASS | 11.8815% |

## Method

Repeat contact follows the policy definition using the transparent proxy `customer_id + product_sku + category`: a later ticket starts within 30 days after the prior completed ticket's resolution. This is a useful operational flag, not a claim of semantic truth.

The tool is deterministic and has no API or model cost. Reviewers can open the generated HTML and compare every headline to the source CSVs. The main remaining error mode is a customer returning for a genuinely different issue that shares the same product and category, or an issue whose category was re-tagged.

## Spot-check plan

Each weekly review should sample 20 flagged repeats and 20 unflagged tickets. A reviewer labels whether the free text describes the same issue. Track precision, recall, and disagreement by category; retrain the key or add a phrase rule only after two weeks of labeled examples.
