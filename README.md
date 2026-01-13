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
