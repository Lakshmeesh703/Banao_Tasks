VIREO AUDIO â€” SUPPORT DATA PACK
================================

tickets.csv          Support tickets, 1 Jan 2025 â€“ 30 Jun 2026. One row per ticket as exported.
                     Timestamps are as displayed in the helpdesk (IST).
  ticket_id            Helpdesk ticket number
  created_at           Ticket creation
  first_response_at    First human agent reply
  resolved_at          Resolution (blank if open/pending). For legacy tickets this was
                       reconstructed from the event log.
  status               resolved | closed (auto-closed, no customer reply) | open | pending
  channel              chat | email | voice | social
  customer_id          Key into customers.csv
  order_id             Key into orders.csv. Blank when the customer did not quote it.
                       customer_id + product_sku is the fallback join.
  product_sku          Key into products.csv
  category             Category tag set by the intake bot at creation; agents may re-tag on closure
  priority             Low | Normal | High
  assigned_team        Team the ticket was first routed to
  agent_id             Agent who resolved the ticket. Key into agents.csv. Use the id, not the name.
  transfers            Number of hand-offs between teams. 
  csat_score           1â€“5 survey score. Blank = no response. Legacy rows use 0 for no response.
  refund_amount_inr    Refund raised on the ticket, as exported by each system. Blank = none.
  refund_reason_code   Dropdown code selected by the agent (see support-policy.pdf Â§5)
  replacement_issued   Y/N flag set by the agent
  customer_message     Customer's opening message (chat/email/social) or IVR transcript (voice)
  agent_notes          Agent's closing note
  source_system        helpdesk | legacy_fd (migrated from Freshdesk, see support-policy.pdf Â§9)

agents.csv           Roster. One row per assignment (agent_id, name, site, team, shift, tier,
                     from_date, to_date). An agent can have more than one row.
orders.csv           Orders: order_id, customer_id, sku, order_date, channel, qty,
                     order_value_inr, lot_code (manufacturing lot printed on the box).
customers.csv        customer_id, name, city, state, signup_date, care_plus (Y/N).
products.csv         sku, product_name, family, launch_date, unit_cost_inr, retail_price_inr,
                     warranty_months.
support-policy.pdf   Vireo's support operating policy v3.2 â€” SLAs, costs, refund rules, shifts,
                     definitions.
email-thread.txt     Messages already exchanged between Vireo and us about this work.

No other documentation is available.    


DELIVERABLE QUICK START
=======================

For the clean project setup and submission deliverables, read README.md.
This file remains the supplied data dictionary for the source files.

This pack includes a dependency-free local analyzer. It requires Python 3.8+
and the files in this directory; it does not need an API key or package
installation.

From this directory, run:

  ./run_vireo.sh

The launcher regenerates the files and opens the dashboard in Chrome or the
available system browser. If you prefer not to open a browser automatically,
run `python3 vireo_digest.py` instead.

This generates:

  vireo_dashboard.html  Weekly digest and Tier 1 leaderboard
  memo-to-priya.md       One-page business memo
  validation.md          Reproducible checks and method limits
  recording-script.md    Three-minute walkthrough script

Open vireo_dashboard.html in a browser. The dashboard is generated directly
from the CSVs each time it runs. The repeat-contact flag follows the policy's
30-day definition using customer_id + product_sku + category as a transparent
same-issue proxy. Tier 2 warranty agents are excluded from volume ranking.

The supplied pack did not contain submission-form.md, so no form could be
filled without inventing its fields. The data contains 653 duplicate ticket
IDs across source exports; these rows are retained and documented in
validation.md rather than silently discarded.