# Pipeline Identity Blast Radius (Baseline)

## Identity
Azure DevOps service connection identity used for production deployments.

## Current Capabilities
- Can authenticate to Azure
- Can deploy resources in sub-prod-workload
- Subject to Azure Policy guardrails

## Risk
If compromised, the identity could:
- Attempt infrastructure changes
- Modify resources within assigned scope
- Generate high-impact control-plane activity

## Goal
Reduce where, when, and how this identity can be used.
