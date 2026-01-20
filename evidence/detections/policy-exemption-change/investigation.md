# Incident Investigation – Azure Policy Exemption Change

## Incident Summary
A Sentinel analytic rule detected Azure Policy exemption activity indicating a guardrail bypass.

## Detection Context
- Detection Name: Azure Policy Exemption Change
- Severity: High
- Data Source: AzureActivity

## Timeline
- Detection Time: 11:19 AM
- Operation: policyExemptions/write
- Actor: <REDACTED USER>

## Investigation Findings
- AzureActivity logs confirmed policy exemption creation/modification.
- The exemption reduced enforcement of an assigned policy.
- The initiating identity was a known administrator account.

## Assessment
The activity was a controlled administrative action performed to validate detection behavior.

## Disposition
Benign – Authorized change.

## Outcome
Detection validated. Guardrail bypass activity is now monitored continuously.
