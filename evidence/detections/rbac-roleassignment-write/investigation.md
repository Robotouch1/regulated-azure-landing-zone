# Incident Investigation – RBAC Role Assignment Write

## Incident Summary
An Azure Sentinel analytic rule detected a role assignment write operation at subscription scope using Azure Activity logs.

## Detection Context
- Detection Name: RBAC Role Assignment Write (Subscription Scope)
- Severity: High
- Data Source: AzureActivity
- Subscription: sub-prod-workload

## Timeline
- Detection Time: 3:19 PM
- Alert Trigger: Microsoft.Authorization/roleAssignments/write
- Actor: <REDACTED USER>

## Investigation Findings
- AzureActivity logs confirmed a roleAssignments/write operation.
- The target entity indicated a subscription-level RBAC modification.
- The initiating identity matched a known administrator account.
- No anomalous sign-in behavior or lateral activity was observed.

## Assessment
The activity was determined to be a controlled administrative action performed to validate detection behavior.

## Disposition
Benign – Authorized change.

## Outcome
- Detection logic successfully identified a high-risk control-plane event.
- Incident workflow and alerting behavior validated.
- No remediation actions required.

## Notes
Subscription-level RBAC changes remain monitored continuously due to their elevated risk profile.
