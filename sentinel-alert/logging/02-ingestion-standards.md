# Ingestion Standards (Signal vs Cost)

## Why this exists
In regulated environments, "log everything forever" is unrealistic and expensive.
This standard defines the minimum viable telemetry to support:
- incident response
- audit evidence
- security posture monitoring
while controlling cost and noise.

## Tier 0 (must-have)
- Azure Activity Logs (subscription)
- Entra ID sign-in logs / audit logs (if accessible in your lab)
- Defender for Cloud security alerts (where applicable)

## Tier 1 (high value)
- Key Vault diagnostics (audit events)
- NSG flow logs / network security signals (where feasible)
- Storage account diagnostics for access patterns (where sensitivity requires)

## Tier 2 (selective / use-case driven)
- Verbose resource logs that are high volume but low signal
- Application logs (owned by app teams; forwarded when needed)

## Exclusions (intentional)
Some telemetry is excluded by default due to cost/volume, and can be enabled via exception workflow.
All exceptions must be documented in the exemptions register.

## Cost guardrails
- Ingestion review cadence: monthly
- High-volume tables monitored weekly
- New services require an onboarding checklist (what logs exist, expected volume, retention)
