# RBAC Model — Separation of Duties (Platform vs Security vs App Teams)

## 1) Goals
- Least privilege at the right scope (MG / subscription / RG / resource)
- Clear ownership boundaries (regulated environments expect this)
- Privileged access is time-bound (PIM) and auditable

## 2) Personas
### Platform Team (Cloud Platform / Core Services)
Responsibilities:
- Management group structure
- Subscription provisioning
- Baseline policy assignments
- Core connectivity and management services

Typical RBAC:
- Management Group scope: **Contributor** (limited) or custom role for MG operations
- Subscription scope (platform subscriptions): **Owner** only when required, otherwise **Contributor**
- Policy operations: permissions to assign initiatives

### Security Team (Cloud Security Engineering / Controls)
Responsibilities:
- Define security standards (policy definitions / initiatives)
- Configure Defender for Cloud posture standards
- Configure Sentinel onboarding standards and detection baselines
- Approve exceptions with risk acceptance input

Typical RBAC:
- Management Group scope: **Reader** + **Policy Contributor** (or custom role) where appropriate
- Security tooling subscriptions: **Contributor** (or higher if owning deployment)
- Sentinel workspace: **Sentinel Contributor** (or Microsoft Sentinel roles as needed)
- Log Analytics: permissions to configure tables/retention (as required)

### Application / Workload Teams
Responsibilities:
- Deploy and operate application resources inside subscription/RG
- Remediate security findings for their workloads

Typical RBAC:
- Subscription scope: **Contributor** (prefer RG scope)
- Key Vault / secrets: least privilege access policies/RBAC for app identities only
- No policy assignment permissions

## 3) Scoping rules (practical guidance)
- Prefer **RG scope** for app teams unless operational needs require subscription scope.
- Use **custom roles** to avoid “Owner sprawl.”
- Separate duties:
  - Those who approve exemptions are not the same people who implement the risky change, where feasible.

## 4) Privileged role control
- Use PIM for:
  - Owner
  - User Access Administrator
  - Security Administrator
  - Sentinel roles (where privileged)
- Require MFA and justification, and log PIM activation events to Sentinel.

## 5) Audit evidence produced
- Role assignment exports
- PIM activation logs
- Access review records (where used)
- Exception approval records (policy exemption workflow)
