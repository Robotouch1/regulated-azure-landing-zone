# Incident Investigation – Diagnostic Settings Changed

## Incident Summary
A Sentinel analytic rule detected a change to Azure diagnostic settings indicating potential visibility suppression.

## Detection Context
- Detection Name: Visibility Suppression – Diagnostic Settings Changed
- Severity: High
- Data Source: AzureActivity

## Timeline
- Detection Time: 12:35 PM
- Operation: diagnosticSettings/write or diagnosticSettings/delete
- Actor: <REDACTED USER>

## Investigation Findings
- AzureActivity logs confirmed modification or deletion of diagnostic settings.
- The affected resource was a storage account used for detection validation.
- The initiating identity matched a known administrator account.

## Assessment
The activity was a controlled administrative change performed to validate detection behavior.

## Disposition
Benign – Authorized change.

## Outcome
Detection validated. Visibility suppression activity is now monitored continuously.
