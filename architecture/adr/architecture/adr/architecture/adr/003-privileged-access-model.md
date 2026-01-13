# ADR-003: Privileged Access Model (PIM + Break-glass)

## Status
Accepted

## Context
Privileged access is the highest-risk attack surface in cloud environments.
Regulated environments require:
- least privilege
- strong authentication
- auditable privilege elevation
- survivability in emergencies

## Decision
Adopt PIM for privileged roles with:
- time-bound activation
- justification required
- MFA enforced
- logging of activations forwarded to Sentinel

Maintain a minimal break-glass capability for catastrophic lockout scenarios, with strict monitoring and documented runbooks.

## Alternatives considered
1) Permanent privileged access
- Pros: convenience
- Cons: unacceptable risk; weak audit posture

2) PIM without break-glass
- Pros: stronger baseline
- Cons: survivability risk during identity/control-plane failures

## Consequences
- Positive: auditable privileged operations; reduced standing privileges
- Negative: operational friction; requires training and process

## Compliance & Evidence
- PIM activation logs
- Access review outputs
- Break-glass monitoring alerts and test records

## Residual risk
Emergency accounts are inherently risky. Mitigate via:
- tight monitoring
- restricted use
- periodic testing
- secure credential storage
