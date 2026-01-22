## How to Read This Repository

This repository is organized around **security architecture patterns**, not individual Azure features.

**Recommended reading order:**
1. `architecture/protected-workload-zone.md`  
   → Explains the security intent, trust boundaries, and threat model.
2. `logging/`  
   → Shows how centralized control-plane visibility is established.
3. `governance/`  
   → Documents guardrails, assumptions, and policy decisions.
4. `docs/detections/` (or wherever your KQL lives)  
   → Implements detection logic for posture drift and privilege risk.
5. `evidence/`  
   → Screenshots and artifacts proving incidents fired and were investigated.

The goal is to demonstrate **how a senior security engineer designs, reasons about, and validates security controls** in a regulated cloud environment — without exposing employer-specific details.



# Regulated Azure Landing Zone (Security-First)

This repository presents a security-first Azure Landing Zone blueprint designed for regulated enterprise environments (e.g., aerospace/industrial). It focuses on governance, identity boundaries, centralized logging, threat detection, and audit-ready control evidence — while remaining NDA-safe and vendor-aligned.

## What this demonstrates
- Enterprise-scale Azure governance: management groups, subscription segmentation, RBAC boundaries
- Security guardrails: policy-as-code, restricted locations, tagging standards, baseline posture
- Detection readiness: centralized logging strategy, Microsoft Sentinel integration approach
- Compliance thinking: control mapping, evidence catalog, risk register
- Architecture judgment: ADRs with tradeoffs and residual risk

## Scope (in)
- Management group hierarchy & subscription model
- RBAC model + privileged access approach
- Policy guardrails (definitions/initiatives/assignments)
- Logging architecture (Log Analytics + Sentinel strategy)
- Compliance artifacts (control mapping, evidence catalog, risk register)
- IaC skeleton (Bicep-based) to deploy guardrails

## Out of scope (not in)
- Application-specific architecture
- Real tenant/subscription identifiers or organization-specific naming
- Production workloads or sensitive configurations

## How to navigate
- Architecture overview: `docs/02-architecture-overview.md`
- ADRs: `architecture/adr/`
- Policies: `governance/policy/`
- Identity/RBAC model: `governance/rbac/`
- Logging + Sentinel strategy: `logging/`
- Compliance mapping: `compliance/`

## Quick start (optional)
This repo includes reference Bicep modules and policy JSON. It is designed to be adapted to your environment.
See: `iac/bicep/` and `governance/policy/`
# regulated-azure-landing-zone
