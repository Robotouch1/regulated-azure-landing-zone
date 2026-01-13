# Detection Use Cases (Security-Heavy Solution Architect Track)

This document defines an enterprise-style detection program for a regulated Azure environment. It is designed to be:
- repeatable across subscriptions (platform + prod + nonprod),
- tunable to avoid alert fatigue,
- defensible for audits (what we detect, why, and what evidence is produced).

## Scope assumptions
- One tenant, three subscriptions:
  - sub-platform-security (central logging + Sentinel)
  - sub-prod-workload (production workload simulation)
  - sub-nonprod-workload (non-production workload simulation)
- Central Log Analytics workspace exists in platform subscription.
- Sentinel is enabled on the central workspace.
- Activity Logs are connected for all subscriptions.
- Additional signals are onboarded based on value and feasibility (Key Vault diagnostics, Defender alerts, Entra ID logs).

## Severity model (enterprise-friendly)
- **High**: likely malicious / high impact. Creates incident automatically. Requires response SLA.
- **Medium**: suspicious. Creates alert or incident depending on confidence and frequency.
- **Low**: informational or hygiene. Logged for hunting / audit; no incident by default.

## Detection tiers
- **Tier A (High confidence):** auto-incident
- **Tier B (Medium confidence):** alert/incident with thresholding
- **Tier C (Hunting queries):** no alert; used during investigations

---

# Use Case Catalog

## UC-01: Privilege escalation (role assignments / UAA changes)
- **Why it matters (regulated):** privileged access misuse is a top control failure; auditors care about who can grant access.
- **Signal:** Azure Activity Logs (Microsoft.Authorization/roleAssignments/write), User Access Administrator changes.
- **Tier/Severity:** Tier A / High
- **Evidence produced:** incident + activity log + affected scope + caller identity
- **Validation in lab:** assign a role at subscription or RG scope and confirm query sees it.

## UC-02: Policy exemptions or policy assignment changes
- **Why it matters:** exemptions weaken baseline; this must be controlled and time-bound.
- **Signal:** Azure Activity Logs for policyAssignments/write, policyExemptions/write (where supported).
- **Tier/Severity:** Tier A / High (for exemptions), Tier B / Medium (for assignment updates)
- **Evidence:** exemption register entry + change event + approval trail (documented process)

## UC-03: Public exposure attempts (Public IP creation / NSG inbound open)
- **Why it matters:** reduces accidental internet exposure (common root cause of incidents).
- **Signal:** Azure Activity Logs (publicIPAddresses/write), NSG securityRules/write
- **Tier/Severity:** Tier B / Medium (threshold), escalates to High when repeated
- **Evidence:** change record + attempted resource + who/when

## UC-04: Key Vault access anomalies (secret reads, permission changes)
- **Why it matters:** Key Vault events are high-value for IP/data protection and audit.
- **Signal:** Key Vault diagnostic logs to Log Analytics
- **Tier/Severity:** Tier A / High (permission changes), Tier B / Medium (unusual secret get patterns)
- **Evidence:** vault audit event + caller + operation

## UC-05: Unusual Azure Activity (failed operations, unusual caller)
- **Why it matters:** attackers and misconfigurations create noisy but meaningful failed operations.
- **Signal:** AzureActivity where ActivityStatus indicates failure
- **Tier/Severity:** Tier B / Medium (thresholded)
- **Evidence:** incident with summary of failures by caller

## UC-06: Defender for Cloud security alerts ingestion
- **Why it matters:** integrates posture + detections; shows operational readiness.
- **Signal:** SecurityAlert / Defender alerts connector
- **Tier/Severity:** severity inherited; many are Tier A
- **Evidence:** alert record + recommended actions

## UC-07: Resource deletion in production (Key resources removed)
- **Why it matters:** destructive actions are high-impact and often malicious.
- **Signal:** AzureActivity for delete operations; scope to prod subscription.
- **Tier/Severity:** Tier A / High
- **Evidence:** deletion event + identity + impacted resource

## UC-08: Network changes affecting egress (route tables, UDR, firewall policy)
- **Why it matters:** egress control is central in regulated environments; attackers modify routes to exfiltrate.
- **Signal:** AzureActivity for routeTables/write, firewallPolicy/write (if used)
- **Tier/Severity:** Tier B / Medium (thresholded), Tier A if in prod + outside change window
- **Evidence:** change record + actor + scope

## UC-09: Identity risk signals (Entra sign-in risk, impossible travel) [optional]
- **Why it matters:** identity is perimeter; high value when tenant logs are available.
- **Signal:** SigninLogs / RiskyUsers (depends on licensing/tenant)
- **Tier/Severity:** Tier A/B depending on risk type
- **Evidence:** sign-in event + risk indicators

## UC-10: Logging tampering (diagnostic settings removed)
- **Why it matters:** disabling logs is a classic attacker move; also an audit failure.
- **Signal:** AzureActivity for diagnosticSettings/delete or changes
- **Tier/Severity:** Tier A / High
- **Evidence:** event showing logging was altered + who/when

---

# Implementation plan (portfolio-ready)
We will implement 8–12 detections as:
- KQL query file
- rule tier + severity
- prerequisites (which logs must be onboarded)
- validation steps (lab actions)
- evidence artifacts (sanitized screenshots)

Folder convention:
- `/detections/tier-a/`
- `/detections/tier-b/`
- `/detections/hunting/`

Each detection includes an "ADR note" when it changes posture or cost materially.
