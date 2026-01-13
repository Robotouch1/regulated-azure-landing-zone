# ADR-004: Sentinel Cost Governance via Ingestion Standards

## Status
Accepted

## Context
Sentinel costs scale primarily with ingestion volume. Without governance, costs can spike and alert quality can degrade.
Regulated environments still require retention and evidence.

## Decision
Adopt an ingestion standards model (Tier 0/1/2) and monitor high-volume tables.
Enable additional logs only when justified by threat model, compliance needs, or incident learnings.

## Alternatives considered
1) Ingest everything
- Pros: maximum visibility
- Cons: cost blowouts; noisy detections; operational overload

2) Minimal ingestion only
- Pros: cost control
- Cons: incident investigation gaps; audit friction

## Consequences
- Positive: predictable cost; higher signal-to-noise; repeatable onboarding
- Negative: requires periodic review and exception handling

## Compliance & Evidence
- Ingestion standards document
- Monthly ingestion review record (NDA-safe)
- Exceptions register entries when non-standard telemetry is required

## Residual risk
Missed signals for services not included by default. Mitigate via onboarding checklist + threat modeling.
