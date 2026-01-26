# Detection: Storage Exposure Drift

## Overview
Detects potentially risky changes to Azure Storage Account configuration that increase public exposure or weaken network controls.

## Severity
High

## Data Source
AzureActivity (control-plane)

## Detection Logic
Monitors `Microsoft.Storage/storageAccounts/write` and parses the response payload to identify exposure-related drift:
- `publicNetworkAccess` enabled
- `networkAcls.defaultAction` set to Allow
- `allowBlobPublicAccess` enabled

**Versioning Note (v1):**  
The initial version of this detection alerts on any  
`Microsoft.Storage/storageAccounts/write` operation to establish baseline
visibility into high-impact storage configuration changes.

This broad scope is intentional for early-stage monitoring in regulated
environments, where storage account writes are infrequent and security-relevant.

Future tuning will narrow the alert to exposure-related configuration fields,
including:
- `publicNetworkAccess`
- `networkAcls.defaultAction`
- `allowBlobPublicAccess`

  
## Schedule
- Frequency: Every 5 minutes
- Lookback window: 1 hour
- Alert threshold: > 0

## Why This Matters
Storage accounts are common targets for data exfiltration. Exposure drift can occur through admin error, automation, or malicious activity. In regulated environments, network access to data services must be tightly controlled and continuously monitored.

## Known Limitations
AzureActivity may not always include full configuration detail for every write path. This detection prioritizes visibility into exposure-increasing changes and may require tuning as additional patterns are observed.

## Future Enhancements
- Add correlation with RBAC role assignment and policy exemption activity
- Detect Private Endpoint deletion and firewall exception changes
- Enforce baseline via Azure Policy and monitor exemptions
