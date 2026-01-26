# ADR-002: Policy Guardrails with Controlled Exemptions

## Status
Accepted

## Context
In regulated environments, guidance alone is insufficient; misconfigurations recur and drift happens.
We need enforceable guardrails that prevent high-risk states (public exposure, missing logging, non-approved regions).
However, zero-exception policies can block legitimate business needs.

## Decision
Implement a “guardrails + controlled exemptions” model:
- A baseline set of deny/modify/deployIfNotExists policies are assigned at MG level.
- Exemptions are allowed only through a documented process:
  - time-bound (expiration required)
  - scoped (specific resource/RG/subscription)
  - justified (business need + compensating controls)
  - risk-accepted (security + owner sign-off)

## Alternatives considered
1) No deny policies (guidance-only)
- Pros: fastest delivery
- Cons: repeated exposure risk; weak audit posture

2) Deny-only with no exemptions
- Pros: strongest enforcement
- Cons: operational dead-ends; encourages “shadow IT” workarounds

## Consequences
- Positive: predictable security baseline, strong audit evidence, fewer recurring findings
- Negative: requires governance overhead (exceptions workflow + tracking)

## Compliance & Evidence
- Policy compliance results
- Exemption register with approvals/expirations
- Risk register entries for accepted deviations
- Change history (PRs) for policy updates

## Residual risk
Excessive exemptions can erode posture. Mitigate by:
- quarterly exemption reviews
- enforcing expirations
- requiring compensating controls for high-risk exemptions
