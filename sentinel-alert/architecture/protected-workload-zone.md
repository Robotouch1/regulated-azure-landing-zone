# Protected Workload Zone (PWZ) — Architecture Pattern

## Purpose
Create a small but realistic “protected workload zone” that demonstrates how a senior security engineer designs:
- network segmentation and trust boundaries,
- secure-by-default deployment patterns,
- centralized visibility (control-plane + runtime),
- and detection of posture drift — without relying on company-specific details.

This pattern is NDA-safe: it uses generic architecture, not Eaton specifics.

---

## Scope (What exists)
**Subscriptions**
- Platform Security (`sub-platform-security`)
  - Central Log Analytics Workspace (LAW)
  - Microsoft Sentinel
- Production Workload (`sub-prod-workload`)
  - VNet + subnets
  - NSG(s)
  - Storage account (used earlier for diagnostics testing)
  - *Minimal* compute (1 VM or 1 app) only to generate meaningful security signals

---

## Trust Boundaries
### Boundary 1 — Internet (Untrusted)
- No direct inbound to private workload subnet.
- Any inbound allow from `0.0.0.0/0` to management ports is considered high risk.

### Boundary 2 — Production VNet (Trusted Internal)
- Workloads communicate only through explicitly allowed flows.

### Boundary 3 — Private Endpoint Subnet (Highly Restricted)
- Private endpoints live here.
- No inbound from Internet.
- Limit inbound to required sources only (e.g., workload subnet, private DNS resolver patterns if used later).

---

## Subnet Model (Logical)
- `snet-workload` : where the VM/app lives
- `snet-private-endpoints` : storage private endpoint (future/optional)
- `snet-management` : optional (Bastion/jumpbox later if needed)

---

## Control Objectives (Senior-level intent)
1. **Deny-by-default inbound**
2. **Centralize control-plane logging** (AzureActivity)
3. **Detect posture drift** (RBAC changes, diag settings tamper, risky NSG rules)
4. **Minimize blast radius** by segmenting workloads and endpoints
5. **Enable audit-friendly evidence** (screenshots + KQL + explanation)

---

## What “Good” Looks Like (Expected Posture)
- No NSG rule allowing inbound from Internet to management ports (22/3389) on workload subnet.
- Diagnostic settings are enabled where required (or governed by policy).
- Cross-subscription log collection works (already proven via AzureActivity).
- Any sensitive change produces an incident with clear investigation context.

---

## Drift Scenarios We Intend To Detect
### Scenario A — Unsafe inbound exposure
- A rule is created/modified to allow `0.0.0.0/0` inbound to 22/3389/* on workload subnet NSG.

### Scenario B — Logging tamper
- Diagnostic settings removed/disabled for a protected resource.

### Scenario C — Privilege escalation
- High-privilege role assignments at subscription scope.

---

## Evidence Plan (What will be captured)
- Screenshot: architecture (logical)
- Screenshot: Sentinel incident summary + entity details
- KQL: analytic rule query saved to repo
- Short narrative: “why this is risky” + “how it scales in enterprise”

---

## Out of Scope (Deliberately)
- Company-specific naming/IPs
- Full CI/CD implementation (optional later)
- Full Defender automation (later, after detections stabilize)
