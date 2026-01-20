# Incident Investigation – Storage Exposure Drift

## Incident Summary
A Sentinel analytic rule detected a storage account configuration change that could increase public exposure.

## Detection Context
- Detection Name: Storage Exposure Drift
- Severity: High
- Data Source: AzureActivity

## Timeline
- Detection Time: <INSERT TIME>
- Storage Account: <INSERT RESOURCE NAME>
- Operation: Microsoft.Storage/storageAccounts/write
- Actor: <REDACTED>

## Findings
- AzureActivity indicated a configuration write on the storage account.
- Parsed fields showed exposure-related settings (public access/network default action) consistent with drift from baseline.

## Assessment
This activity was a controlled change used to validate detection behavior for the security portfolio.

## Disposition
Benign – Authorized test.

## Outcome
Detection validated. Storage exposure drift is now monitored and can be correlated with policy/RBAC activity.
