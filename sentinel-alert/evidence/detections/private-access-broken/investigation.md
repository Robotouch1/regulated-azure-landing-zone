# Incident Investigation – Private Access Broken

## Incident Summary
A Microsoft Sentinel analytic rule detected that public network access was
re-enabled on an Azure Storage Account configured for private-only access.

## Detection Context
- Detection Name: Private Access Broken – Storage Public Access Re-enabled
- Severity: High
- Data Source: AzureActivity

## Timeline
- Detection Time: 9:01 PM
- Storage Account: stsecdiagtest
- Operation: Microsoft.Storage/storageAccounts/write
- Actor: <REDACTED USER>

## Findings
- AzureActivity logs showed a storage account configuration write.
- Parsed configuration indicated `publicNetworkAccess` was set to `Enabled`.
- The storage account had an active Private Endpoint prior to the change.

## Assessment
This activity represents a break in enforced private networking controls.
In this case, the change was performed intentionally to validate detection
behavior.

## Disposition
Benign – Authorized test.

## Outcome
Detection validated. The environment successfully alerts on private access
violations, enabling rapid response to prevent unintended public exposure.
