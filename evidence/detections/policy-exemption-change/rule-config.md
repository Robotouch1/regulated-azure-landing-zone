# Detection: Azure Policy Exemption Change

## Overview
This analytic rule detects the creation, modification, or deletion of Azure Policy exemptions using Azure Activity logs. Policy exemptions represent intentional bypasses of preventive guardrails and must be monitored closely in regulated environments.

## Severity
High

## Data Source
AzureActivity (Azure control-plane logs)

## Detection Logic
The rule monitors `policyExemptions/write` and `policyExemptions/delete` operations and surfaces exemption activity for SOC review.

## Schedule
- Query frequency: Every 5 minutes
- Lookback window: 1 hour
- Alert threshold: One or more events

## Why This Matters
Policy exemptions weaken security guardrails without changing resource configurations. Attackers and misconfigurations can abuse exemptions to bypass compliance and security controls silently.

## Incident Behavior
- Groups exemption changes into a single alert
- Creates a Sentinel incident for investigation
- Enables audit traceability for guardrail bypass activity

## Known Limitations
AzureActivity logs may not consistently expose full exemption metadata. The detection prioritizes visibility of exemption activity rather than deep enrichment.

## Future Enhancements
- Correlate exemption activity with RBAC role assignments
- Require approval workflows for high-risk exemptions
- Extend detection to management group scope
