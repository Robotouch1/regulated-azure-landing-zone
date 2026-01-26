# Control Mapping (Regulated / Aerospace-Style)

This mapping uses NIST 800-53 style control objectives (informally) to document how landing zone design choices produce audit evidence.

| Control Objective | Implementation in this Landing Zone | Evidence Produced | Residual Risk |
|---|---|---|---|
| Access control: least privilege | RBAC scoped to MG/subscription/RG; role separation for platform vs security vs app teams | RBAC assignment exports; privileged role review records | Role sprawl if governance not maintained |
| Privileged access management | PIM for eligible roles; break-glass accounts with strict monitoring | PIM activation logs; break-glass runbook; Sentinel alerts | Emergency access misuse risk |
| Logging & monitoring | Central workspace; required diagnostics for key resources; retention tiers | DCR configs; diagnostic settings compliance reports | Some logs not ingested due to cost controls |
| Secure configuration baseline | Azure Policy guardrails deny risky configs (public IP, unsupported regions, missing tags) | Policy compliance state; exceptions register | Misuse of policy exemptions |
| Incident readiness | Sentinel incident workflow & severity mapping; ownership model defined | Incident lifecycle doc; analytics rule baseline | Detection gaps for new services |
| Change control | ADRs + pull request workflow for policy/IaC updates | Git history; PR approvals; release notes | Emergency changes bypass process |
