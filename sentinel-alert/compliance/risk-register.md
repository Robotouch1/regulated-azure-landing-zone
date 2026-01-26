# Risk Register — Landing Zone (Regulated / Aerospace-style)

| ID | Risk | Cause | Impact | Likelihood | Inherent Risk | Mitigation / Compensating Controls | Owner | Status | Review Date |
|---|---|---|---|---|---|---|---|---|---|
| R-001 | Logging gaps for certain services | Cost controls or missing diagnostics | Reduced detection & slower IR | Medium | High | Policy deployIfNotExists where possible; DCR standards; quarterly audit of diagnostics | Security | Open | Quarterly |
| R-002 | Policy exemptions weaken baseline | Business exceptions accumulate | Increased exposure / audit findings | Medium | High | Expiring exemptions; approval workflow; compensating controls; exemption review cadence | Security + Platform | Open | Monthly |
| R-003 | Privileged access misuse | Standing privileges or weak controls | Tenant compromise | Low | Critical | PIM; MFA; alerting on role changes; break-glass monitoring | Security | Open | Monthly |
| R-004 | Central workspace outage impacts visibility | Single point of failure | Reduced monitoring | Low | Medium | Workspace health monitoring; change control; optional split prod/nonprod workspaces | Platform | Open | Quarterly |
| R-005 | Region restriction blocks urgent deployment | Strict allowed locations | Delivery delays | Medium | Medium | Exception workflow; pre-approved regions list; documented process | Platform | Open | Quarterly |
