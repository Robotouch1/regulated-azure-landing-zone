# Logging & Detection Architecture (Regulated Pattern)

## Objectives
- Centralized security visibility for regulated workloads
- Consistent retention and evidence production for audits
- Predictable cost through ingestion governance
- Clear ownership model for incident handling

## Data flow (high level)
1) Azure platform & workload resources emit logs (Activity, Resource, Identity, Security)
2) Diagnostic settings + DCR route logs to Log Analytics (central security workspace)
3) Microsoft Sentinel runs analytics rules and creates incidents
4) Incidents route to SOC/IR workflow (ticketing + escalation)
5) Evidence is retained and exportable for audit needs

## Centralized vs decentralized
This landing zone uses a centralized security workspace pattern.
See ADR-001 for tradeoffs and residual risk.

## Retention model (example)
- Hot retention: 180 days (searchable)
- Archive: 365 days (low-cost retention) where required
- Evidence exports: on demand for audits/incidents (sanitized)
