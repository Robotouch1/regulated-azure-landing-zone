# Detection: Private Access Broken – Storage Public Access Re-enabled

## Overview
This detection identifies Azure Storage Accounts where private-only access
has been weakened by re-enabling public network access. The rule monitors
control-plane configuration changes that break private endpoint–based
network isolation.

## Severity
High

## Data Source
AzureActivity (Azure control-plane logs)

## Detection Logic
The rule monitors `Microsoft.Storage/storageAccounts/write` operations and
parses the response payload to identify when the `publicNetworkAccess`
property is set to `Enabled`.

This indicates a deviation from a private-access baseline where storage
traffic is expected to flow exclusively through Private Endpoints.

## Schedule
- Frequency: Every 5 minutes
- Lookback window: 1 hour
- Alert threshold: > 0 results

## Why This Matters
Re-enabling public network access exposes storage endpoints to the internet
and bypasses private networking controls. This can occur due to misconfiguration,
automation drift, or malicious activity and represents a high-risk data
exposure scenario in regulated environments.

## Incident Behavior
- Generates a high-severity Sentinel incident
- Captures the initiating identity, affected resource, and resulting exposure
- Enables rapid investigation and remediation

## Known Limitations
This detection focuses on public access re-enablement. Private Endpoint
deletion events can be added as a complementary detection.

## Future Enhancements
- Detect Private Endpoint deletion events
- Correlate with RBAC privilege escalation or policy exemption activity
- Enforce private-only access via Azure Policy with monitored exemptions
