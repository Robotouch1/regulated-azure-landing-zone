# Policy Exemptions Workflow (Regulated Environment Pattern)

## Purpose
Enable business delivery while maintaining auditability. Exemptions are permitted only when justified, time-bound, and risk-accepted.

## When an exemption is allowed
- A documented business requirement exists
- Compensating controls exist (e.g., additional monitoring, restricted exposure)
- The exemption is time-bound with an expiration date
- The exemption is scoped minimally (resource/RG/subscription)

## Required fields (minimum)
- Requestor
- Business justification
- Scope (exact resource/RG/subscription)
- Policy(ies) being exempted
- Expiration date
- Compensating controls
- Risk rating + approval sign-off

## Approval model (separation of duties)
- App owner requests
- Security reviews risk + compensating controls
- Platform validates technical feasibility
- Final approval recorded (security + service owner)

## Review cadence
- Monthly: review upcoming expirations
- Quarterly: review exemption trends and policy tuning opportunities

## Evidence produced
- Exemption register entry
- Approval record
- Compensating controls validation
- Expiration closure record
