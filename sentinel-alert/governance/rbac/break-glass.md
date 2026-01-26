# Break-glass Access (Emergency Access) — NDA-safe Reference

## Purpose
Break-glass accounts exist for catastrophic scenarios (e.g., IdP outage, misconfigured Conditional Access, privileged lockout).
They must be tightly controlled and heavily monitored.

## Design principles
- Minimal number of accounts (e.g., 1–2)
- Strong authentication (phishing-resistant MFA if possible)
- Exemptions only when required for survivability (documented)
- Stored credentials/keys in an approved secure system
- Tested periodically with controlled procedures

## Monitoring requirements
- Alert on ANY sign-in from break-glass accounts
- Alert on role assignment changes performed by break-glass accounts
- Alert on conditional access policy changes

## Audit evidence
- Break-glass runbook
- Sign-in logs + alerting records
- Periodic test records and approvals
