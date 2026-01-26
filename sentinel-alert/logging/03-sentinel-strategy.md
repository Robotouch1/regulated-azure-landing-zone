# Microsoft Sentinel Strategy (Architect-led)

## Goals
- Detections that analysts trust (low false positives)
- Clear severity model
- Repeatable onboarding of new subscriptions/workloads

## Rule tiers
- High confidence (auto-create incidents)
- Medium confidence (create alerts; analyst triage)
- Hunting queries (no alert; used during investigations)

## Ownership model
- Security Engineering: rule design, tuning, and baselines
- SOC/IR: triage, containment coordination, escalation
- App owners: remediation of workload-level issues

## Change control
All detection changes follow PR + review (this repo) and are recorded as ADRs if the change alters posture.

## Evidence produced
- Rule baseline documentation
- Incident severity mapping
- Tuning records (what changed and why)
