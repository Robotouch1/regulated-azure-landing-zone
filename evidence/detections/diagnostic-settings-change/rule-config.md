# Detection: Diagnostic Settings Changed (Visibility Suppression)

## Overview
This detection identifies creation, modification, or deletion of Azure diagnostic settings using Azure Activity logs. Diagnostic settings control the flow of platform and resource logs and are critical for security visibility and auditability.

## Severity
High

## Data Source
AzureActivity (Azure control-plane logs)

## Detection Logic
The rule monitors `diagnosticSettings/write` and `diagnosticSettings/delete` operations to detect potential visibility suppression.

## Schedule
- Frequency: Every 5 minutes
- Lookback window: 1 hour
- Alert threshold: One or more events

## Why This Matters
Disabling or weakening diagnostic settings reduces security monitoring and audit evidence. Attackers and misconfigurations often suppress logging to evade detection.

## Incident Behavior
- Generates a high-severity incident
- Groups related diagnostic setting changes into a single alert
- Enables SOC investigation and response

## Known Limitations
AzureActivity logs may not include detailed diagnostic configuration changes. The detection prioritizes awareness of visibility changes rather than configuration diffing.

## Future Enhancements
- Correlate diagnostic changes with RBAC or policy exemption activity
- Enforce diagnostic settings using Azure Policy with monitored exemptions
