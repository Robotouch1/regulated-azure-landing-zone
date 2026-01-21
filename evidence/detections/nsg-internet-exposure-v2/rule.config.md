# NSG Internet Exposure – Inbound Allow (v2)

## Purpose
Detect risky NSG security rule changes that expose workloads to the internet.
This rule is tuned to reduce alert fatigue by filtering only for:
- Inbound rules
- Allow action
- Internet/Any source (0.0.0.0/0, *, Internet)
- Sensitive destination ports (22, 3389, 80, 443, *)

## Data source
- Microsoft Sentinel table: `AzureActivity`
- Signal type: Control-plane (configuration drift)

## Detection logic
The rule searches for successful NSG security rule write operations and then inspects the serialized JSON payload
(request/response) to confirm the change represents internet exposure on a sensitive port.

## Severity
High

## Scheduling
- Query frequency: 5 minutes
- Lookup data: 1 hour
- Alert threshold: > 0 results

## Validation
Triggered by creating test NSG inbound allow rules from Any/Internet:
- TCP/22 (SSH)
- Any/3389 (RDP)

Incidents were confirmed in Sentinel and then test rules were removed to restore secure posture.
