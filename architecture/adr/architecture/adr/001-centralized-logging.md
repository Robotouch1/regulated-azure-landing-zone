# ADR-001: Centralized Logging Workspace with Sentinel

## Status
Accepted

## Context
Regulated environments require consistent log retention, unified detection engineering, and auditable evidence. Decentralized logging often leads to gaps, inconsistent retention, and fragmented incident handling. However, centralization can increase blast radius and cost if not governed.

## Decision
Adopt a centralized Log Analytics workspace model for security-relevant telemetry, with clear ingestion standards and retention tiers. Microsoft Sentinel is enabled on the centralized workspace.

## Alternatives considered
1) Decentralized workspaces per subscription
- Pros: isolation, local autonomy
- Cons: inconsistent retention, harder detection standardization, brittle cross-workspace analytics

2) Centralized workspace per environment (prod/nonprod)
- Pros: improved isolation vs single workspace, simpler than fully decentralized
- Cons: added operational overhead vs single workspace

## Consequences
- Positive: consistent detections, consistent retention, stronger audit evidence, simpler SOC workflows
- Negative: requires strict ingestion governance, potential cost spikes without controls

## Compliance & Evidence
- Evidence: centralized retention policy, data source onboarding records, Sentinel analytics rule baselines, incident workflow documentation.

## Residual risk
Central workspace failure or misconfiguration can impact visibility. Mitigate through availability design, change control, and monitoring of ingestion health.
