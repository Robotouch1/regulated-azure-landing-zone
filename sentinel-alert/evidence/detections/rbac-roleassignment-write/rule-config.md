# Detection: RBAC Role Assignment Write (Subscription Scope)

## Overview
This analytic rule detects Azure RBAC role assignment write operations occurring at subscription scope using Azure Activity logs. These events represent high-risk privilege changes and are monitored for potential misuse or unauthorized access.

## Severity
High

## Data Source
AzureActivity (Azure control-plane logs)

## Detection Logic
The rule monitors `Microsoft.Authorization/roleAssignments/write` operations and evaluates the target entity to confirm the role assignment occurred at subscription scope.

## Schedule
- Query frequency: Every 5 minutes
- Lookback window: 1 hour
- Alert threshold: Trigger when one or more events are detected

## Why This Matters
Subscription-level RBAC changes can grant broad administrative access across all resources in a subscription. In regulated environments, these actions are tightly controlled and must be monitored for both security and compliance purposes.

## Incident Behavior
- Groups all matching events into a single alert
- Automatically creates a Sentinel incident
- Enables SOC investigation and audit traceability

## Known Limitations
AzureActivity logs do not consistently expose `roleDefinitionId` or target principal details within the Properties field for roleAssignments/write events. This detection focuses on the privileged action itself rather than role name enrichment.

## Future Enhancements
- Enrich role assignment details using ARM or Microsoft Graph
- Extend detection to management group–level RBAC changes
- Add approval-based automation for sensitive role assignments
