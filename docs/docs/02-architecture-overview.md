# Architecture Overview — Regulated Azure Landing Zone (Security-First)

## 1) Objectives (Regulated / Aerospace-style)
This landing zone is designed for regulated enterprise environments that require:
- consistent guardrails across subscriptions (prevent misconfiguration drift)
- separation of duties (platform vs security vs application owners)
- centralized visibility for incident response and audit evidence
- controlled change (documented decisions, approvals, exception handling)

## 2) Core assumptions
- Multiple subscriptions exist and must be governed consistently.
- Central security monitoring exists (Sentinel/Defender).
- Workloads vary in sensitivity (data classification).
- Exceptions are allowed but must be documented, time-bound, and risk-accepted.

## 3) Management group hierarchy (reference)
Recommended hierarchy:

Tenant Root Group
└── Platform
    ├── Identity
    ├── Connectivity
    └── Management
└── LandingZones
    ├── Prod
    └── NonProd
└── Sandbox
└── Decommissioned (optional)

### Rationale
- Platform MG holds shared services subscriptions (connectivity, identity foundations, management tooling).
- LandingZones MG is where application subscriptions live, split by environment for clarity and guardrail differences.
- Sandbox is intentionally more permissive but still has minimum controls (logging + identity constraints).
- Decommissioned prevents “zombie” resources and supports audit hygiene.

## 4) Subscription segmentation (reference)
A minimum subscription model:

### Shared / Platform subscriptions
- **sub-identity**: identity-related shared services (where applicable)
- **sub-connectivity**: hub networking, centralized egress controls (if used)
- **sub-management**: centralized logging workspace, monitoring, automation accounts (if used)

### Workload subscriptions
- **sub-prod-<workload>**: production workload boundary
- **sub-nonprod-<workload>**: dev/test boundary

### Security subscription (optional but strong)
- **sub-security**: security tooling and automation components (or keep within management)

### Rationale (regulated environment)
- Subscriptions are an isolation boundary: helps constrain blast radius, supports separation-of-duties, and improves audit scoping.
- Central security services can be owned by a security/platform function rather than each workload team.

## 5) Guardrail philosophy
- “Deny-by-default” for the most common dangerous misconfigurations (public exposure, unsupported regions, missing diagnostics).
- Allow exceptions, but only through documented exemption workflow with expiration and risk acceptance.
- Centralized logging strategy ensures consistent detection coverage and auditability.

## 6) Operational model (who owns what)
- Platform team: core landing zone, connectivity, baseline governance
- Security team: security policy standards, logging standards, detections, incident readiness
- App teams: workload implementation within the guardrails + remediation ownership for findings
